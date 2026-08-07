import { existsSync, readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';

import type { HostTypeAudit } from './host-types.ts';

type HostToolkitCoverage = 'dynamic-stub' | 'missing' | 'typed';

export interface HostToolkitAudit {
  moduleValues: Array<{
    coverage: 'js-only-provider' | 'missing';
    imported: string;
    key: string;
    locations: string[];
    specifier: string;
    uses: number;
  }>;
  schemaVersion: 1;
  summary: {
    dynamicTypeEntries: number;
    externalTypeKeys: number;
    globalValueKeys: number;
    hostTypeKeys: number;
    jsOnlyGlobalValueKeys: number;
    missingEntries: number;
    moduleValueKeys: number;
    portableGlobalValueKeys: number;
    typeUses: number;
    valueUses: number;
  };
  types: Array<{
    coverage: HostToolkitCoverage;
    haxeType: string;
    key: string;
    kind: 'external' | 'host';
    locations: string[];
    provider: string;
    uses: number;
  }>;
  upstreamCommit: string;
  values: Array<{
    coverage: 'js-only' | 'missing' | 'portable';
    key: string;
    locations: string[];
    provider: string;
    uses: number;
  }>;
}

interface GeneratedUse {
  locations: Set<string>;
  uses: number;
}

function generatedHaxeFiles(directory: string): string[] {
  return readdirSync(directory, { withFileTypes: true })
    .flatMap((entry) => {
      const absolute = path.join(directory, entry.name);
      return entry.isDirectory() ? generatedHaxeFiles(absolute) : entry.name.endsWith('.hx') ? [absolute] : [];
    })
    .sort();
}

function addUse(uses: Map<string, GeneratedUse>, key: string, location: string): void {
  const current = uses.get(key) ?? { locations: new Set<string>(), uses: 0 };
  current.locations.add(location);
  current.uses += 1;
  uses.set(key, current);
}

function quotedValues(source: string): Set<string> {
  return new Set([...source.matchAll(/'([^']+)'/gu)].map((match) => match[1]!));
}

function declaredStringArray(source: string, name: string): Set<string> {
  const contents = new RegExp(`public static final ${name}:Array<String> = \\[([\\s\\S]*?)\\n  \\];`, 'u').exec(
    source,
  )?.[1];
  return quotedValues(contents ?? '');
}

function typeCoverage(source: string, name: string): HostToolkitCoverage {
  const escaped = name.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&');
  const declaration = new RegExp(`\\b(?:typedef|abstract|class|interface)\\s+${escaped}\\b`, 'u');
  if (!declaration.test(source)) return 'missing';
  const dynamic = new RegExp(`\\btypedef\\s+${escaped}(?:<[^;=]+>)?\\s*=\\s*Dynamic\\s*;`, 'u');
  return dynamic.test(source) ? 'dynamic-stub' : 'typed';
}

export function auditHostToolkit(workspaceDirectory: string, hostTypes: HostTypeAudit): HostToolkitAudit {
  const generatedDirectory = path.join(workspaceDirectory, 'generated');
  const globalUses = new Map<string, GeneratedUse>();
  const moduleUses = new Map<string, GeneratedUse>();
  const externalTypeUses = new Map<string, GeneratedUse>();
  for (const file of generatedHaxeFiles(generatedDirectory)) {
    const source = readFileSync(file, 'utf8');
    const location = path.relative(workspaceDirectory, file).split(path.sep).join('/');
    for (const match of source.matchAll(/_HostValueLut\.(?:get|typeofValue)\('([^']+)'\)/gu)) {
      addUse(globalUses, match[1]!, location);
    }
    for (const match of source.matchAll(/_HostModuleLut\.get\('([^']+)', '([^']+)'\)/gu)) {
      addUse(moduleUses, `${match[1]!}#${match[2]!}`, location);
    }
    for (const match of source.matchAll(/import flighthq\._internal\.WebExterns\.([A-Za-z0-9_]+);/gu)) {
      addUse(externalTypeUses, match[1]!, location);
    }
  }

  const hostTypeDirectory = path.join(workspaceDirectory, 'src', 'flighthq', '_internal', 'dom');
  const webExternsPath = path.join(workspaceDirectory, 'src', 'flighthq', '_internal', 'WebExterns.hx');
  const webExterns = existsSync(webExternsPath) ? readFileSync(webExternsPath, 'utf8') : '';
  const types: HostToolkitAudit['types'] = hostTypes.types.map((entry) => {
    const provider = path.join(hostTypeDirectory, `${entry.name}.hx`);
    const source = existsSync(provider) ? readFileSync(provider, 'utf8') : '';
    return {
      coverage: typeCoverage(source, entry.name),
      haxeType: entry.haxeType,
      key: `host:${entry.name}`,
      kind: 'host' as const,
      locations: [
        ...new Set([
          ...entry.typeReferences.locations.map((location) => location.source),
          ...entry.members.flatMap((member) => member.locations.map((location) => location.source)),
        ]),
      ].sort(),
      provider: path.relative(workspaceDirectory, provider).split(path.sep).join('/'),
      uses:
        entry.typeReferences.count +
        entry.members.reduce((total, member) => total + member.reads + member.writes + member.calls, 0),
    };
  });
  for (const [name, use] of [...externalTypeUses].sort(([left], [right]) => left.localeCompare(right))) {
    types.push({
      coverage: typeCoverage(webExterns, name),
      haxeType: `flighthq._internal.WebExterns.${name}`,
      key: `external:${name}`,
      kind: 'external',
      locations: [...use.locations].sort(),
      provider: 'src/flighthq/_internal/WebExterns.hx',
      uses: use.uses,
    });
  }
  types.sort((left, right) => left.key.localeCompare(right.key));

  const valueProvider = path.join(workspaceDirectory, 'src', 'flighthq', '_internal', '_HostValueLut.hx');
  const valueSource = existsSync(valueProvider) ? readFileSync(valueProvider, 'utf8') : '';
  const providedValues = declaredStringArray(valueSource, 'keys');
  const portableValues = declaredStringArray(valueSource, 'portableKeys');
  const invalidPortableValues = [...portableValues].filter((name) => !providedValues.has(name)).sort();
  const values = [...globalUses]
    .sort(([left], [right]) => left.localeCompare(right))
    .map(([name, use]) => ({
      coverage: !providedValues.has(name)
        ? ('missing' as const)
        : portableValues.has(name)
          ? ('portable' as const)
          : ('js-only' as const),
      key: `global:${name}`,
      locations: [...use.locations].sort(),
      provider: 'src/flighthq/_internal/_HostValueLut.hx',
      uses: use.uses,
    }));

  const moduleProvider = path.join(workspaceDirectory, 'src', 'flighthq', '_internal', '_HostModuleLut.hx');
  const moduleProviderExists = existsSync(moduleProvider);
  const moduleValues = [...moduleUses]
    .sort(([left], [right]) => left.localeCompare(right))
    .map(([key, use]) => {
      const separator = key.lastIndexOf('#');
      return {
        coverage: moduleProviderExists ? ('js-only-provider' as const) : ('missing' as const),
        imported: key.slice(separator + 1),
        key: `module:${key}`,
        locations: [...use.locations].sort(),
        specifier: key.slice(0, separator),
        uses: use.uses,
      };
    });

  const missing = [
    ...types.filter((entry) => entry.coverage === 'missing').map((entry) => entry.key),
    ...values.filter((entry) => entry.coverage === 'missing').map((entry) => entry.key),
    ...moduleValues.filter((entry) => entry.coverage === 'missing').map((entry) => entry.key),
    ...invalidPortableValues.map((name) => `global:${name} (portable but undeclared)`),
  ];
  if (missing.length > 0) {
    throw new Error(
      `Host toolkit LUT is missing generated dependencies:\n${missing.map((key) => `- ${key}`).join('\n')}`,
    );
  }

  return {
    moduleValues,
    schemaVersion: 1,
    summary: {
      dynamicTypeEntries: types.filter((entry) => entry.coverage === 'dynamic-stub').length,
      externalTypeKeys: types.filter((entry) => entry.kind === 'external').length,
      globalValueKeys: values.length,
      hostTypeKeys: types.filter((entry) => entry.kind === 'host').length,
      jsOnlyGlobalValueKeys: values.filter((entry) => entry.coverage === 'js-only').length,
      missingEntries: missing.length,
      moduleValueKeys: moduleValues.length,
      portableGlobalValueKeys: values.filter((entry) => entry.coverage === 'portable').length,
      typeUses: types.reduce((total, entry) => total + entry.uses, 0),
      valueUses:
        values.reduce((total, entry) => total + entry.uses, 0) +
        moduleValues.reduce((total, entry) => total + entry.uses, 0),
    },
    types,
    upstreamCommit: hostTypes.upstreamCommit,
    values,
  };
}
