import type { IrType } from './ir.ts';

export interface PatchTarget {
  export: string;
  package: string;
  source: string;
}

interface BasePatch {
  expect: {
    astHash: string;
    kind: 'class' | 'enum' | 'function' | 'type' | 'variable';
  };
  id: string;
  reason: string;
  target: PatchTarget;
}

export type SemanticPatch =
  | (BasePatch & { operation: 'remove' })
  | (BasePatch & { name: string; operation: 'rename' })
  | (BasePatch & { constructsCppStructInitTypes?: string[]; operation: 'replaceBody'; fragment: string })
  | (BasePatch & { operation: 'replaceType'; type: IrType });

export interface PatchAuditRecord {
  astHash: string;
  constructsCppStructInitTypes?: string[] | undefined;
  id: string;
  operation: SemanticPatch['operation'];
  reason: string;
  target: PatchTarget;
}

export interface PatchAudit {
  applied: PatchAuditRecord[];
  schemaVersion: 1;
  summary: {
    applied: number;
    conflicting: number;
    stale: number;
    unmatched: number;
  };
}
