import type {
  IrDeclaration,
  IrExpressionStaticFacts,
  IrIndexedReceiver,
  IrTypedArraySetReceiver,
  StaticFactAudit,
  StaticFactCounts,
} from '../model/ir.ts';

export const indexedReceiverNames = [
  'Array',
  'ArrayOrFloat32Array',
  'Float32Array',
  'Float64Array',
  'Int16Array',
  'Int32Array',
  'Int8Array',
  'Uint16Array',
  'Uint16ArrayOrUint32Array',
  'Uint32Array',
  'Uint8Array',
  'Uint8ClampedArray',
] as const satisfies readonly IrIndexedReceiver[];

export const typedArraySetReceiverNames = [
  'Float32Array',
  'Float64Array',
  'Int16Array',
  'Int32Array',
  'Int8Array',
  'Uint16Array',
  'Uint16ArrayOrUint32Array',
  'Uint32Array',
  'Uint8Array',
  'Uint8ClampedArray',
] as const satisfies readonly IrTypedArraySetReceiver[];

export function emptyStaticFactAudit(): StaticFactAudit {
  return {
    booleanConditionalTruthiness: 0,
    booleanExplicitTruthiness: 0,
    booleanLogicalExpressions: 0,
    booleanLogicalTruthiness: 0,
    indexedAccesses: {
      expressions: 0,
      reads: 0,
      writes: 0,
    },
    indexedAccessEscapes: {
      widthSensitiveMixedWrites: 0,
    },
    indexedReceivers: Object.fromEntries(
      indexedReceiverNames.map((receiver) => [receiver, { expressions: 0, reads: 0, writes: 0 }]),
    ) as StaticFactAudit['indexedReceivers'],
    numericRelations: 0,
    typedArraySetCalls: 0,
    typedArraySetReceivers: Object.fromEntries(
      typedArraySetReceiverNames.map((receiver) => [receiver, 0]),
    ) as StaticFactAudit['typedArraySetReceivers'],
  };
}

export function auditStaticFacts(declarations: IrDeclaration[]): StaticFactAudit {
  const audit = emptyStaticFactAudit();
  const seen = new WeakSet<object>();
  const visit = (value: unknown): void => {
    if (value === null || typeof value !== 'object' || seen.has(value)) return;
    seen.add(value);
    if (Array.isArray(value)) {
      value.forEach(visit);
      return;
    }
    const record = value as Record<string, unknown>;
    const facts = record.staticFacts as IrExpressionStaticFacts | undefined;
    if (facts) addFacts(audit, facts);
    for (const [key, child] of Object.entries(record)) {
      if (key !== 'staticFacts') visit(child);
    }
  };
  visit(declarations);
  return audit;
}

export function sumStaticFactAudits(audits: StaticFactAudit[]): StaticFactAudit {
  const total = emptyStaticFactAudit();
  for (const audit of audits) {
    total.booleanConditionalTruthiness += audit.booleanConditionalTruthiness;
    total.booleanExplicitTruthiness += audit.booleanExplicitTruthiness;
    total.booleanLogicalExpressions += audit.booleanLogicalExpressions;
    total.booleanLogicalTruthiness += audit.booleanLogicalTruthiness;
    total.indexedAccesses.expressions += audit.indexedAccesses.expressions;
    total.indexedAccesses.reads += audit.indexedAccesses.reads;
    total.indexedAccesses.writes += audit.indexedAccesses.writes;
    total.indexedAccessEscapes.widthSensitiveMixedWrites += audit.indexedAccessEscapes.widthSensitiveMixedWrites;
    total.numericRelations += audit.numericRelations;
    total.typedArraySetCalls += audit.typedArraySetCalls;
    for (const receiver of indexedReceiverNames) {
      total.indexedReceivers[receiver].expressions += audit.indexedReceivers[receiver].expressions;
      total.indexedReceivers[receiver].reads += audit.indexedReceivers[receiver].reads;
      total.indexedReceivers[receiver].writes += audit.indexedReceivers[receiver].writes;
    }
    for (const receiver of typedArraySetReceiverNames) {
      total.typedArraySetReceivers[receiver] += audit.typedArraySetReceivers[receiver];
    }
  }
  return total;
}

export function staticFactCounts(audit: StaticFactAudit): StaticFactCounts {
  return {
    booleanConditionalTruthiness: audit.booleanConditionalTruthiness,
    booleanExplicitTruthiness: audit.booleanExplicitTruthiness,
    booleanLogicalExpressions: audit.booleanLogicalExpressions,
    booleanLogicalTruthiness: audit.booleanLogicalTruthiness,
    indexedAccesses: { ...audit.indexedAccesses },
    indexedAccessEscapes: { ...audit.indexedAccessEscapes },
    numericRelations: audit.numericRelations,
    typedArraySetCalls: audit.typedArraySetCalls,
  };
}

function addFacts(audit: StaticFactAudit, facts: IrExpressionStaticFacts): void {
  if (facts.truthinessUse === 'conditional') audit.booleanConditionalTruthiness += 1;
  if (facts.truthinessUse === 'explicit') audit.booleanExplicitTruthiness += 1;
  if (facts.truthinessUse === 'logical') audit.booleanLogicalTruthiness += 1;
  if (facts.booleanLogical) audit.booleanLogicalExpressions += 1;
  if (facts.numericRelation) audit.numericRelations += 1;
  if (facts.typedArraySet) {
    audit.typedArraySetCalls += 1;
    audit.typedArraySetReceivers[facts.typedArraySet.receiver] += 1;
  }
  if (facts.indexedAccessEscape === 'width-sensitive-mixed-write') {
    audit.indexedAccessEscapes.widthSensitiveMixedWrites += 1;
  }
  if (!facts.indexedAccess) return;
  const receiver = audit.indexedReceivers[facts.indexedAccess.receiver];
  audit.indexedAccesses.expressions += 1;
  audit.indexedAccesses.reads += facts.indexedAccess.reads;
  audit.indexedAccesses.writes += facts.indexedAccess.writes;
  receiver.expressions += 1;
  receiver.reads += facts.indexedAccess.reads;
  receiver.writes += facts.indexedAccess.writes;
}
