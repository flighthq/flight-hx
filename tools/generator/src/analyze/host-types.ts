import path from 'node:path';
import ts from 'typescript';

import type { HostTypeUse } from '../model/ir.ts';

export const HOST_TYPE_HAXE_PACKAGE = 'flighthq._internal.dom';

export interface HostTypeIdentity {
  arity: number;
  declarationSources: string[];
  haxeType: string;
  name: string;
}

export interface HostTypeAudit {
  schemaVersion: 2;
  summary: {
    calls: number;
    memberAccesses: number;
    reads: number;
    typeReferences: number;
    types: number;
    writes: number;
  };
  types: HostTypeAuditEntry[];
  upstreamCommit: string;
}

export interface HostTypeAuditEntry {
  arities: number[];
  declarationSources: string[];
  haxeType: string;
  members: Array<{
    calls: number;
    locations: Array<{
      column: number;
      line: number;
      operation: 'call' | 'read' | 'write';
      source: string;
    }>;
    name: string;
    reads: number;
    writes: number;
  }>;
  name: string;
  typeReferences: {
    arities: number[];
    count: number;
    locations: Array<{ arity: number; column: number; line: number; source: string }>;
  };
}

export function createHostTypeAudit(upstreamCommit: string, uses: readonly HostTypeUse[]): HostTypeAudit {
  const uniqueUses = [
    ...new Map(
      uses.map((use) => [
        [use.name, use.source, use.line, use.column, use.kind, use.member ?? '', use.operation ?? '', use.arity].join(
          ':',
        ),
        use,
      ]),
    ).values(),
  ];
  const names = [...new Set(uniqueUses.map((use) => use.name))].sort();
  const types = names.map((name): HostTypeAuditEntry => {
    const typeUses = uniqueUses.filter((use) => use.name === name);
    const references = typeUses
      .filter((use) => use.kind === 'type-reference')
      .sort((left, right) =>
        [left.source, left.line, left.column, left.arity]
          .join(':')
          .localeCompare([right.source, right.line, right.column, right.arity].join(':')),
      );
    const memberUses = typeUses.filter(
      (use): use is HostTypeUse & { member: string; operation: 'call' | 'read' | 'write' } =>
        use.kind === 'member' && use.member !== undefined && use.operation !== undefined,
    );
    const memberNames = [...new Set(memberUses.map((use) => use.member))].sort();
    return {
      arities: [...new Set(typeUses.map((use) => use.arity))].sort((left, right) => left - right),
      declarationSources: [...new Set(typeUses.flatMap((use) => use.declarationSources))].sort(),
      haxeType: `${HOST_TYPE_HAXE_PACKAGE}.${name}`,
      members: memberNames.map((member) => {
        const accesses = memberUses
          .filter((use) => use.member === member)
          .sort((left, right) =>
            [left.source, left.line, left.column, left.operation]
              .join(':')
              .localeCompare([right.source, right.line, right.column, right.operation].join(':')),
          );
        return {
          calls: accesses.filter((use) => use.operation === 'call').length,
          locations: accesses.map((use) => ({
            column: use.column,
            line: use.line,
            operation: use.operation,
            source: use.source,
          })),
          name: member,
          reads: accesses.filter((use) => use.operation === 'read').length,
          writes: accesses.filter((use) => use.operation === 'write').length,
        };
      }),
      name,
      typeReferences: {
        arities: [...new Set(references.map((use) => use.arity))].sort((left, right) => left - right),
        count: references.length,
        locations: references.map((use) => ({
          arity: use.arity,
          column: use.column,
          line: use.line,
          source: use.source,
        })),
      },
    };
  });
  const operations = uniqueUses.filter((use) => use.kind === 'member');
  return {
    schemaVersion: 2,
    summary: {
      calls: operations.filter((use) => use.operation === 'call').length,
      memberAccesses: operations.length,
      reads: operations.filter((use) => use.operation === 'read').length,
      typeReferences: uniqueUses.filter((use) => use.kind === 'type-reference').length,
      types: types.length,
      writes: operations.filter((use) => use.operation === 'write').length,
    },
    types,
    upstreamCommit,
  };
}

function unaliasSymbol(symbol: ts.Symbol | undefined, checker: ts.TypeChecker): ts.Symbol | undefined {
  let current = symbol;
  const seen = new Set<ts.Symbol>();
  while (current && (current.flags & ts.SymbolFlags.Alias) !== 0 && !seen.has(current)) {
    seen.add(current);
    const target = checker.getAliasedSymbol(current);
    if (target === current) break;
    current = target;
  }
  return current;
}

function isEcmaScriptLibrary(source: ts.SourceFile): boolean {
  return /^lib\.(?:decorators|es)/u.test(path.basename(source.fileName));
}

function isTypeScriptHostLibrary(source: ts.SourceFile): boolean {
  const name = path.basename(source.fileName);
  return name.startsWith('lib.') && !isEcmaScriptLibrary(source) && name !== 'lib.d.ts';
}

function isGlobalAugmentation(node: ts.Node): boolean {
  let current: ts.Node | undefined = node.parent;
  while (current) {
    if (ts.isModuleDeclaration(current) && (current.flags & ts.NodeFlags.GlobalAugmentation) !== 0) return true;
    current = current.parent;
  }
  return false;
}

function isHostAmbientDeclaration(declaration: ts.Declaration): boolean {
  const source = declaration.getSourceFile();
  if (!source.isDeclarationFile) return false;
  if (isTypeScriptHostLibrary(source)) return true;
  if (path.basename(source.fileName).startsWith('lib.')) return false;
  return !ts.isExternalModule(source) || isGlobalAugmentation(declaration);
}

function portableDeclarationSource(source: ts.SourceFile): string {
  const normalized = source.fileName.split(path.sep).join('/');
  const nodeModules = normalized.lastIndexOf('/node_modules/');
  return nodeModules >= 0 ? normalized.slice(nodeModules + 1) : path.basename(normalized);
}

function identityForSymbol(symbol: ts.Symbol | undefined, checker: ts.TypeChecker): HostTypeIdentity | undefined {
  const resolved = unaliasSymbol(symbol, checker);
  if (!resolved) return undefined;
  const declarations = resolved.declarations ?? [];
  if (declarations.some((declaration) => isEcmaScriptLibrary(declaration.getSourceFile()))) return undefined;
  const hostDeclarations = declarations.filter(isHostAmbientDeclaration);
  if (hostDeclarations.length === 0) return undefined;
  const name = resolved.getName();
  if (!/^[A-Z][A-Za-z0-9_]*$/u.test(name)) return undefined;
  const arity = declarations.reduce(
    (maximum, declaration) =>
      Math.max(
        maximum,
        ts.isInterfaceDeclaration(declaration) ||
          ts.isTypeAliasDeclaration(declaration) ||
          ts.isClassDeclaration(declaration) ||
          ts.isClassExpression(declaration)
          ? (declaration.typeParameters?.length ?? 0)
          : 0,
      ),
    0,
  );
  return {
    arity,
    declarationSources: [
      ...new Set(hostDeclarations.map((declaration) => portableDeclarationSource(declaration.getSourceFile()))),
    ].sort(),
    haxeType: `${HOST_TYPE_HAXE_PACKAGE}.${name}`,
    name,
  };
}

function mergeCommonIdentities(identities: Array<HostTypeIdentity | undefined>): HostTypeIdentity | undefined {
  if (identities.some((identity) => !identity)) return undefined;
  const concrete = identities as HostTypeIdentity[];
  const names = new Set(concrete.map((identity) => identity.name));
  if (names.size !== 1) return undefined;
  const first = concrete[0];
  if (!first) return undefined;
  return {
    arity: Math.max(...concrete.map((identity) => identity.arity)),
    declarationSources: [...new Set(concrete.flatMap((identity) => identity.declarationSources))].sort(),
    haxeType: first.haxeType,
    name: first.name,
  };
}

export function hostTypeIdentity(
  input: ts.Type | undefined,
  checker: ts.TypeChecker | undefined,
  seen = new Set<ts.Type>(),
): HostTypeIdentity | undefined {
  if (!input || !checker || seen.has(input)) return undefined;
  seen.add(input);
  const type = checker.getNonNullableType(input);
  const aliasIdentity = identityForSymbol(type.aliasSymbol, checker);
  const symbolIdentity = identityForSymbol(type.getSymbol(), checker);
  const direct =
    aliasIdentity && symbolIdentity && aliasIdentity.name === symbolIdentity.name
      ? mergeCommonIdentities([aliasIdentity, symbolIdentity])
      : (aliasIdentity ?? symbolIdentity);
  if (direct) return direct;
  if (type.isUnion()) {
    return mergeCommonIdentities(type.types.map((member) => hostTypeIdentity(member, checker, new Set(seen))));
  }
  if (type.isIntersection()) {
    const identities = type.types
      .map((member) => hostTypeIdentity(member, checker, new Set(seen)))
      .filter((identity): identity is HostTypeIdentity => identity !== undefined);
    const names = new Set(identities.map((identity) => identity.name));
    if (identities.length > 0 && names.size === 1) return mergeCommonIdentities(identities);
  }
  const constraint = checker.getBaseConstraintOfType(type);
  if (constraint && constraint !== type) return hostTypeIdentity(constraint, checker, seen);
  return undefined;
}

export function hostTypeIdentityForTypeNode(
  node: ts.TypeNode,
  checker: ts.TypeChecker | undefined,
): HostTypeIdentity | undefined {
  return checker ? hostTypeIdentity(checker.getTypeFromTypeNode(node), checker) : undefined;
}

export function hostTypeIdentityForValueSymbol(
  node: ts.Identifier,
  checker: ts.TypeChecker | undefined,
): HostTypeIdentity | undefined {
  return checker ? identityForSymbol(checker.getSymbolAtLocation(node), checker) : undefined;
}

export function hostTypeIdentityForExpression(
  node: ts.Expression,
  checker: ts.TypeChecker | undefined,
): HostTypeIdentity | undefined {
  if (!checker) return undefined;
  const type = checker.getTypeAtLocation(node);
  if (checker.typeToString(type).startsWith('typeof ')) return undefined;
  return hostTypeIdentity(type, checker);
}
