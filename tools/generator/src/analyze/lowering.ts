import { readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { upstreamTypeScriptProgram } from './program.ts';
import { indexedReceiverNames, staticFactCounts, sumStaticFactAudits } from './static-facts.ts';
import { typedStructRegistry, type TypedStructRegistry } from './typed-structs.ts';
import { lowerTypeScriptSource } from '../lower/typescript.ts';
import type {
  LoweringDiagnostic,
  StaticFactAudit,
  StaticFactCounts,
  StaticLoweringEmissionCounts,
} from '../model/ir.ts';

export interface PackageLoweringAudit {
  declarations: number;
  diagnostics: LoweringDiagnostic[];
  files: number;
  lowered: number;
  packageName: string;
  staticFacts: StaticFactCounts;
}

export interface LoweringAudit {
  packages: PackageLoweringAudit[];
  schemaVersion: 8;
  summary: {
    declarations: number;
    diagnostics: number;
    files: number;
    lowered: number;
    packages: number;
    staticEmission: StaticLoweringEmissionCounts;
    staticFacts: StaticFactAudit;
  };
}

export function auditLowering(workspaceDirectory: string, typedStructs?: TypedStructRegistry): LoweringAudit {
  const { checker, program } = upstreamTypeScriptProgram(workspaceDirectory);
  const structRegistry =
    typedStructs ?? typedStructRegistry(workspaceDirectory, 'not-recorded', undefined, { checker, program });
  const packagesDirectory = path.join(workspaceDirectory, 'upstream', 'packages');
  const results = readdirSync(packagesDirectory, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .map((entry) => path.join(packagesDirectory, entry.name))
    .map((directory) => ({ directory, metadata: readPackageMetadata(directory) }))
    .sort((left, right) => left.metadata.name.localeCompare(right.metadata.name))
    .map(({ directory, metadata }) =>
      auditPackage(directory, metadata.name, workspaceDirectory, program, checker, structRegistry),
    );
  const packages = results.map((result) => result.packageAudit);

  return {
    packages,
    schemaVersion: 8,
    summary: {
      declarations: sum(packages, (item) => item.declarations),
      diagnostics: sum(packages, (item) => item.diagnostics.length),
      files: sum(packages, (item) => item.files),
      lowered: sum(packages, (item) => item.lowered),
      packages: packages.length,
      staticEmission: {
        booleanAndExpressions: 0,
        booleanConditionalExpressions: 0,
        booleanOrExpressions: 0,
        booleanTruthinessUses: 0,
        destructuringEscapes: {
          'regexp-result-array': { assignment: 0, declaration: 0, parameter: 0 },
          'unproven-receiver': { assignment: 0, declaration: 0, parameter: 0 },
        },
        destructuringReads: {
          assignment: { direct: 0, parked: 0, proven: 0 },
          declaration: { direct: 0, parked: 0, proven: 0 },
          parameter: { direct: 0, parked: 0, proven: 0 },
        },
        destructuringReceivers: Object.fromEntries(
          indexedReceiverNames.map((receiver) => [
            receiver,
            {
              assignment: 0,
              declaration: 0,
              parameter: 0,
            },
          ]),
        ) as StaticLoweringEmissionCounts['destructuringReceivers'],
        indexedAccesses: {
          reads: 0,
          writes: 0,
        },
        indexedReceivers: Object.fromEntries(
          indexedReceiverNames.map((receiver) => [receiver, { reads: 0, writes: 0 }]),
        ) as StaticLoweringEmissionCounts['indexedReceivers'],
        numericRelations: 0,
        syntheticArrayReads: {
          highArityArguments: 0,
          iterationBindings: 0,
        },
      },
      staticFacts: sumStaticFactAudits(results.map((result) => result.staticFacts)),
    },
  };
}

function auditPackage(
  directory: string,
  packageName: string,
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
  typedStructs: TypedStructRegistry,
): { packageAudit: PackageLoweringAudit; staticFacts: StaticFactAudit } {
  const sourceDirectory = path.join(directory, 'src');
  const files = walkTypeScriptSources(sourceDirectory);
  let declarations = 0;
  let lowered = 0;
  const diagnostics: LoweringDiagnostic[] = [];
  const staticFacts: StaticFactAudit[] = [];
  for (const file of files) {
    const source = program.getSourceFile(file);
    if (!source) throw new Error(`Upstream TypeScript program is missing source: ${file}`);
    declarations += source.statements.filter(isCandidateDeclaration).length;
    const result = lowerTypeScriptSource(source, packageName, workspaceDirectory, checker, typedStructs);
    lowered += result.accountedDeclarations;
    diagnostics.push(...result.diagnostics);
    staticFacts.push(result.staticFacts);
  }
  diagnostics.sort(
    (left, right) => left.source.localeCompare(right.source) || left.line - right.line || left.column - right.column,
  );
  const packageStaticFacts = sumStaticFactAudits(staticFacts);
  return {
    packageAudit: {
      declarations,
      diagnostics,
      files: files.length,
      lowered,
      packageName,
      staticFacts: staticFactCounts(packageStaticFacts),
    },
    staticFacts: packageStaticFacts,
  };
}

function isCandidateDeclaration(statement: ts.Statement): boolean {
  return (
    ts.isClassDeclaration(statement) ||
    ts.isEnumDeclaration(statement) ||
    ts.isFunctionDeclaration(statement) ||
    ts.isInterfaceDeclaration(statement) ||
    ts.isModuleDeclaration(statement) ||
    ts.isTypeAliasDeclaration(statement) ||
    ts.isVariableStatement(statement)
  );
}

function readPackageMetadata(directory: string): { name: string } {
  return JSON.parse(readFileSync(path.join(directory, 'package.json'), 'utf8')) as { name: string };
}

function walkTypeScriptSources(directory: string): string[] {
  const files: string[] = [];
  for (const entry of readdirSync(directory, { withFileTypes: true })) {
    const file = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...walkTypeScriptSources(file));
    else if (
      /\.tsx?$/u.test(entry.name) &&
      !/\.(?:test|spec)\.tsx?$/u.test(entry.name) &&
      !entry.name.endsWith('.d.ts')
    ) {
      files.push(file);
    }
  }
  return files.sort();
}

function sum<T>(items: T[], select: (item: T) => number): number {
  return items.reduce((total, item) => total + select(item), 0);
}
