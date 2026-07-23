import { readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { lowerTypeScriptSource } from '../lower/typescript.ts';
import type { LoweringDiagnostic } from '../model/ir.ts';

export interface PackageLoweringAudit {
  declarations: number;
  diagnostics: LoweringDiagnostic[];
  files: number;
  lowered: number;
  packageName: string;
}

export interface LoweringAudit {
  packages: PackageLoweringAudit[];
  schemaVersion: 1;
  summary: {
    declarations: number;
    diagnostics: number;
    files: number;
    lowered: number;
    packages: number;
  };
}

export function auditLowering(workspaceDirectory: string): LoweringAudit {
  const packagesDirectory = path.join(workspaceDirectory, 'upstream', 'packages');
  const packages = readdirSync(packagesDirectory, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .map((entry) => path.join(packagesDirectory, entry.name))
    .map((directory) => ({ directory, metadata: readPackageMetadata(directory) }))
    .sort((left, right) => left.metadata.name.localeCompare(right.metadata.name))
    .map(({ directory, metadata }) => auditPackage(directory, metadata.name, workspaceDirectory));

  return {
    packages,
    schemaVersion: 1,
    summary: {
      declarations: sum(packages, (item) => item.declarations),
      diagnostics: sum(packages, (item) => item.diagnostics.length),
      files: sum(packages, (item) => item.files),
      lowered: sum(packages, (item) => item.lowered),
      packages: packages.length,
    },
  };
}

function auditPackage(directory: string, packageName: string, workspaceDirectory: string): PackageLoweringAudit {
  const sourceDirectory = path.join(directory, 'src');
  const files = walkTypeScriptSources(sourceDirectory);
  let declarations = 0;
  let lowered = 0;
  const diagnostics: LoweringDiagnostic[] = [];
  for (const file of files) {
    const source = ts.createSourceFile(
      file,
      readFileSync(file, 'utf8'),
      ts.ScriptTarget.Latest,
      true,
      ts.ScriptKind.TS,
    );
    declarations += source.statements.filter(isCandidateDeclaration).length;
    const result = lowerTypeScriptSource(source, packageName, workspaceDirectory);
    lowered += result.accountedDeclarations;
    diagnostics.push(...result.diagnostics);
  }
  diagnostics.sort(
    (left, right) => left.source.localeCompare(right.source) || left.line - right.line || left.column - right.column,
  );
  return { declarations, diagnostics, files: files.length, lowered, packageName };
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
