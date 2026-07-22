import { readFileSync } from 'node:fs';
import path from 'node:path';

import type { IrDeclaration } from '../model/ir.ts';
import type { PatchAudit, PatchAuditRecord, SemanticPatch } from '../model/patch.ts';

export function definePatches<const Patches extends readonly SemanticPatch[]>(patches: Patches): Patches {
  return patches;
}

export function applySemanticPatches(
  declarations: IrDeclaration[],
  patches: readonly SemanticPatch[],
  workspaceDirectory: string,
): PatchAudit {
  validateUniqueIds(patches);
  validateConflicts(patches);
  const applied: PatchAuditRecord[] = [];

  for (const patch of [...patches].sort((left, right) => left.id.localeCompare(right.id))) {
    const matches = declarations.filter((declaration) => matchesTarget(declaration, patch));
    if (matches.length === 0) throw new Error(`Unmatched semantic patch ${patch.id}`);
    if (matches.length > 1)
      throw new Error(`Ambiguous semantic patch ${patch.id}: matched ${matches.length} declarations`);
    const declaration = matches[0]!;
    if (declaration.kind !== patch.expect.kind) {
      throw new Error(`Semantic patch ${patch.id} expected ${patch.expect.kind}, received ${declaration.kind}`);
    }
    if (declaration.origin.fingerprint !== patch.expect.astHash) {
      throw new Error(
        `Stale semantic patch ${patch.id}: expected ${patch.expect.astHash}, received ${declaration.origin.fingerprint}`,
      );
    }

    switch (patch.operation) {
      case 'remove':
        declarations.splice(declarations.indexOf(declaration), 1);
        break;
      case 'rename':
        declaration.name = patch.name;
        break;
      case 'replaceBody':
        if (declaration.kind !== 'function') throw new Error(`Semantic patch ${patch.id} requires a function`);
        declaration.haxeBody = readFileSync(path.resolve(workspaceDirectory, patch.fragment), 'utf8').trimEnd();
        break;
      case 'replaceType':
        if (declaration.kind !== 'type') throw new Error(`Semantic patch ${patch.id} requires a type`);
        declaration.type = patch.type;
        break;
    }
    applied.push({
      astHash: declaration.origin.fingerprint,
      id: patch.id,
      operation: patch.operation,
      reason: patch.reason,
      target: patch.target,
    });
  }

  return {
    applied,
    schemaVersion: 1,
    summary: { applied: applied.length, conflicting: 0, stale: 0, unmatched: 0 },
  };
}

function matchesTarget(declaration: IrDeclaration, patch: SemanticPatch): boolean {
  return (
    declaration.origin.packageName === patch.target.package &&
    declaration.origin.source === patch.target.source &&
    declaration.name === patch.target.export
  );
}

function validateConflicts(patches: readonly SemanticPatch[]): void {
  const owners = new Map<string, string>();
  for (const patch of patches) {
    const key = `${patch.target.package}\0${patch.target.source}\0${patch.target.export}\0${patch.operation}`;
    const owner = owners.get(key);
    if (owner) throw new Error(`Conflicting semantic patches ${owner} and ${patch.id}`);
    owners.set(key, patch.id);
  }
}

function validateUniqueIds(patches: readonly SemanticPatch[]): void {
  const ids = new Set<string>();
  for (const patch of patches) {
    if (ids.has(patch.id)) throw new Error(`Duplicate semantic patch id ${patch.id}`);
    ids.add(patch.id);
  }
}
