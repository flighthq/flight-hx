import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';

import type { TypedStructClassFeasibilityAudit } from '../analyze/typed-struct-classes.ts';
import type { TypedStructProvenanceAudit } from '../analyze/typed-struct-provenance.ts';
import type { TypedStructAudit } from '../analyze/typed-structs.ts';
import type { ApiReport, UpstreamInventory } from '../model/inventory.ts';
import type { LoweringAudit } from '../analyze/lowering.ts';

export function createApiReport(inventory: UpstreamInventory): ApiReport {
  return {
    packages: inventory.packages.map((item) => ({
      exportLanes: item.exportLanes,
      haxeModule: item.haxeModule,
      name: item.name,
      sdkExposures: item.sdkExposures,
      sdkIncluded: item.sdkIncluded,
    })),
    schemaVersion: 2,
    upstreamCommit: inventory.upstreamCommit,
  };
}

export function inventorySummary(inventory: UpstreamInventory): string {
  const lines = [
    '# Upstream Inventory',
    '',
    `Upstream commit: \`${inventory.upstreamCommit}\``,
    '',
    '| Metric | Count |',
    '| --- | ---: |',
    `| Packages | ${inventory.summary.packages} |`,
    `| Source files | ${inventory.summary.sourceFiles} |`,
    `| Test files | ${inventory.summary.testFiles} |`,
    `| Public export lanes | ${inventory.summary.exportLanes} |`,
    `| Public export records | ${inventory.summary.exports} |`,
    `| Root-lane exports | ${inventory.summary.rootExports} |`,
    `| Export conflicts | ${inventory.summary.exportConflicts} |`,
    '',
    '| Upstream package | Haxe module | Sources | Tests | Lanes | Export records | SDK | Conflicts |',
    '| --- | --- | ---: | ---: | ---: | ---: | :---: | ---: |',
  ];
  for (const item of inventory.packages) {
    const exports = item.exportLanes.reduce((total, lane) => total + lane.exports.length, 0);
    const conflicts = item.exportLanes.reduce((total, lane) => total + lane.exportConflicts.length, 0);
    lines.push(
      `| \`${item.name}\` | \`${item.haxeModule}\` | ${item.sourceFiles} | ${item.testFiles} | ${item.exportLanes.length} | ${exports} | ${item.sdkIncluded ? 'yes' : 'no'} | ${conflicts} |`,
    );
  }
  lines.push('', '| Public specifier | Source barrel | Exports | Conflicts |', '| --- | --- | ---: | ---: |');
  for (const item of inventory.packages) {
    for (const lane of item.exportLanes) {
      lines.push(
        `| \`${lane.specifier}\` | \`${lane.source}\` | ${lane.exports.length} | ${lane.exportConflicts.length} |`,
      );
    }
  }
  lines.push('');
  return lines.join('\n');
}

export function loweringSummary(audit: LoweringAudit): string {
  const facts = audit.summary.staticFacts;
  const emission = audit.summary.staticEmission;
  const destructuringProven = Object.values(emission.destructuringReads).reduce(
    (total, counts) => total + counts.proven,
    0,
  );
  const destructuringDirect = Object.values(emission.destructuringReads).reduce(
    (total, counts) => total + counts.direct,
    0,
  );
  const destructuringParked = Object.values(emission.destructuringReads).reduce(
    (total, counts) => total + counts.parked,
    0,
  );
  const lines = [
    '# Lowering Audit',
    '',
    '| Metric | Count |',
    '| --- | ---: |',
    `| Packages | ${audit.summary.packages} |`,
    `| Source files | ${audit.summary.files} |`,
    `| Candidate declarations | ${audit.summary.declarations} |`,
    `| Lowered declarations | ${audit.summary.lowered} |`,
    `| Current diagnostics | ${audit.summary.diagnostics} |`,
    `| Proven explicit Boolean truthiness uses | ${facts.booleanExplicitTruthiness} |`,
    `| Proven Boolean conditional conditions | ${facts.booleanConditionalTruthiness} |`,
    `| Proven Boolean logical-left truthiness uses | ${facts.booleanLogicalTruthiness} |`,
    `| Proven Boolean logical expressions | ${facts.booleanLogicalExpressions} |`,
    `| Proven numeric relations | ${facts.numericRelations} |`,
    `| Direct Boolean truthiness uses | ${emission.booleanTruthinessUses} |`,
    `| Direct Boolean conditional expressions | ${emission.booleanConditionalExpressions} |`,
    `| Direct Boolean \`&&\` expressions | ${emission.booleanAndExpressions} |`,
    `| Direct Boolean \`\\|\\|\` expressions | ${emission.booleanOrExpressions} |`,
    `| Direct numeric relations | ${emission.numericRelations} |`,
    `| Proven indexed expressions | ${facts.indexedAccesses.expressions} |`,
    `| Proven indexed reads | ${facts.indexedAccesses.reads} |`,
    `| Proven indexed writes | ${facts.indexedAccesses.writes} |`,
    `| Parked width-sensitive mixed indexed writes | ${facts.indexedAccessEscapes.widthSensitiveMixedWrites} |`,
    `| Direct indexed reads | ${emission.indexedAccesses.reads} |`,
    `| Direct indexed writes | ${emission.indexedAccesses.writes} |`,
    `| Direct synthetic iteration-binding Array reads | ${emission.syntheticArrayReads.iterationBindings} |`,
    `| Direct synthetic high-arity-argument Array reads | ${emission.syntheticArrayReads.highArityArguments} |`,
    `| Audited ordinary destructuring indexed reads | ${destructuringProven + destructuringParked} |`,
    `| Destructuring reads with retained receiver facts | ${destructuringProven} |`,
    `| Direct destructuring Array reads | ${destructuringDirect} |`,
    `| Proven destructuring reads awaiting a direct endpoint | ${destructuringProven - destructuringDirect} |`,
    `| Parked destructuring reads | ${destructuringParked} |`,
    '',
    '| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |',
    '| --- | ---: | ---: | ---: | ---: | ---: |',
  ];
  for (const [receiver, counts] of Object.entries(facts.indexedReceivers)) {
    const direct = emission.indexedReceivers[receiver as keyof typeof emission.indexedReceivers];
    lines.push(
      `| \`${receiver}\` | ${counts.expressions} | ${counts.reads} | ${counts.writes} | ${direct.reads} | ${direct.writes} |`,
    );
  }
  const reads = emission.destructuringReads;
  const direct = {
    assignment: reads.assignment.direct,
    declaration: reads.declaration.direct,
    parameter: reads.parameter.direct,
  };
  const deferred = {
    assignment: reads.assignment.proven - reads.assignment.direct,
    declaration: reads.declaration.proven - reads.declaration.direct,
    parameter: reads.parameter.proven - reads.parameter.direct,
  };
  const parked = {
    assignment: reads.assignment.parked,
    declaration: reads.declaration.parked,
    parameter: reads.parameter.parked,
  };
  lines.push(
    '',
    '| Destructuring emission | Assignment reads | Declaration reads | Parameter reads | Total |',
    '| --- | ---: | ---: | ---: | ---: |',
    `| Direct Array | ${direct.assignment} | ${direct.declaration} | ${direct.parameter} | ${direct.assignment + direct.declaration + direct.parameter} |`,
    `| Proven, awaiting endpoint | ${deferred.assignment} | ${deferred.declaration} | ${deferred.parameter} | ${deferred.assignment + deferred.declaration + deferred.parameter} |`,
    `| Parked | ${parked.assignment} | ${parked.declaration} | ${parked.parameter} | ${parked.assignment + parked.declaration + parked.parameter} |`,
    '',
    '| Proven destructuring receiver | Assignment reads | Declaration reads | Parameter reads | Total |',
    '| --- | ---: | ---: | ---: | ---: |',
  );
  for (const [receiver, counts] of Object.entries(emission.destructuringReceivers)) {
    const total = counts.assignment + counts.declaration + counts.parameter;
    lines.push(
      `| <code>${receiver}</code> | ${counts.assignment} | ${counts.declaration} | ${counts.parameter} | ${total} |`,
    );
  }
  lines.push(
    '',
    '| Destructuring parked reason | Assignment reads | Declaration reads | Parameter reads | Total |',
    '| --- | ---: | ---: | ---: | ---: |',
  );
  for (const [escape, counts] of Object.entries(emission.destructuringEscapes)) {
    const total = counts.assignment + counts.declaration + counts.parameter;
    lines.push(`| ${escape} | ${counts.assignment} | ${counts.declaration} | ${counts.parameter} | ${total} |`);
  }
  lines.push(
    '',
    '| Package | Declarations | Lowered | Diagnostics | Boolean truthiness | Numeric relations | Indexed calls |',
    '| --- | ---: | ---: | ---: | ---: | ---: | ---: |',
  );
  for (const item of audit.packages) {
    const itemFacts = item.staticFacts;
    const booleanTruthiness =
      itemFacts.booleanExplicitTruthiness + itemFacts.booleanConditionalTruthiness + itemFacts.booleanLogicalTruthiness;
    lines.push(
      `| \`${item.packageName}\` | ${item.declarations} | ${item.lowered} | ${item.diagnostics.length} | ${booleanTruthiness} | ${itemFacts.numericRelations} | ${itemFacts.indexedAccesses.reads + itemFacts.indexedAccesses.writes} |`,
    );
  }
  lines.push('');
  return lines.join('\n');
}

export function typedStructSummary(audit: TypedStructAudit): string {
  const lines = [
    '# Typed Struct Audit',
    '',
    `Upstream commit: \`${audit.upstreamCommit}\``,
    '',
    'Eligibility is audited independently from emission. Audit-only schemas remain reflective until their audit diff is approved.',
    '',
    '| Metric | Count |',
    '| --- | ---: |',
    `| Candidates | ${audit.summary.candidates} |`,
    `| Eligible | ${audit.summary.eligible} |`,
    `| Ineligible | ${audit.summary.ineligible} |`,
    `| Audit-only schemas | ${audit.summary.auditOnlySchemas} |`,
    `| Direct schemas | ${audit.summary.directSchemas} |`,
    `| Declared fields | ${audit.summary.fields} |`,
    `| Bindable accesses | ${audit.summary.bindableAccesses} |`,
    `| Pending accesses | ${audit.summary.pendingAccesses} |`,
    `| Directly emitted accesses | ${audit.summary.directAccesses} |`,
    `| Reflective survivors | ${audit.summary.reflectiveSurvivors} |`,
    `| Dynamic escapes | ${audit.summary.escapes} |`,
    '',
    '| Candidate | Mode | Purpose | Fields | Reads | Writes | Calls | Pending | Direct | Reflective survivors | Escapes | Eligible | Reasons |',
    '| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :---: | --- |',
  ];
  for (const candidate of audit.candidates) {
    lines.push(
      `| \`${candidate.name}\` | \`${candidate.emission.mode}\` | ${candidate.purpose} | ${candidate.fields.length} | ${candidate.accesses.reads} | ${candidate.accesses.writes} | ${candidate.accesses.calls} | ${candidate.emission.pendingAccesses} | ${candidate.emission.directAccesses} | ${candidate.emission.reflectiveSurvivors.reduce((total, survivor) => total + survivor.accesses, 0)} | ${candidate.escapes.length} | ${candidate.eligible ? 'yes' : 'no'} | ${candidate.reasons.length > 0 ? candidate.reasons.map((reason) => `\`${reason}\``).join(', ') : '—'} |`,
    );
  }
  const memberEscapes = audit.candidates.flatMap((candidate) =>
    candidate.memberEscapes.map((escape) => ({ candidate, escape })),
  );
  if (memberEscapes.length > 0) {
    lines.push(
      '',
      '## Member-level escapes',
      '',
      '| Candidate identity | Member | Reason | Source identity |',
      '| --- | --- | --- | --- |',
    );
    for (const { candidate, escape } of memberEscapes) {
      lines.push(`| \`${candidate.id}\` | \`${escape.member}\` | \`${escape.reason}\` | \`${escape.source}\` |`);
    }
  }
  lines.push('');
  return lines.join('\n');
}

export function typedStructClassFeasibilitySummary(audit: TypedStructClassFeasibilityAudit): string {
  const summary = audit.summary;
  const lines = [
    '# Typed Struct Class Feasibility Audit',
    '',
    `Upstream commit: \`${audit.upstreamCommit}\``,
    '',
    'This is a construction, structural-flow, and observability census. It does not enable class emission.',
    '',
    '| Metric | Count |',
    '| --- | ---: |',
    `| Eligible canonical schemas | ${summary.schemas} |`,
    `| Direct field accesses | ${summary.directAccesses} |`,
    `| Declared optional fields | ${summary.optionalFields} |`,
    `| Declared required-undefined fields | ${summary.requiredUndefinedFields} |`,
    `| Production object literals | ${summary.objectLiterals} |`,
    `| Production object literals omitting optional fields | ${summary.objectLiteralsOmittingOptionalFields} |`,
    `| Production object literals with spread | ${summary.objectLiteralsWithSpread} |`,
    `| Production object literals with computed keys | ${summary.objectLiteralsWithComputedKeys} |`,
    `| Test object literals | ${summary.testObjectLiterals} |`,
    `| Cross-schema transfers | ${summary.crossSchemaTransfers} |`,
    `| Anonymous structural transfers | ${summary.anonymousStructuralTransfers} |`,
    `| Dynamic ingresses | ${summary.dynamicIngresses} |`,
    `| Production enumerations | ${summary.productionEnumerations} |`,
    `| Production JSON serializations | ${summary.productionJsonSerializations} |`,
    `| Production object rests | ${summary.productionObjectRests} |`,
    `| Production object spreads | ${summary.productionObjectSpreads} |`,
    `| Exported input signature references | ${summary.bridgeInputSignatures} |`,
    `| Exported output signature references | ${summary.bridgeOutputSignatures} |`,
    `| Vitest oracle observations | ${summary.oracleObservations} |`,
    `| Mechanically compatible schemas | ${summary.mechanicallyCompatibleSchemas} |`,
    `| Schemas requiring normalization | ${summary.normalizationRequiredSchemas} |`,
    `| Schemas requiring observability review | ${summary.observabilityReviewSchemas} |`,
    '',
    'Counts below are per canonical schema. Exact source locations and related schema identities are in `typed-struct-classes.json`.',
    '',
    '| Candidate | Direct | Fields | Optional | Required undefined | Object literals | Plain | Literal spread | Computed | Optional omitted | Cross schema | Anonymous | Dynamic | Enumerate | JSON | Rest | Spread | Bridge in | Bridge out | Test literals | Oracle | Mechanical | Normalization | Observability |',
    '| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :---: | --- | --- |',
  ];
  for (const schema of audit.schemas) {
    const oracle =
      schema.oracle.enumerations +
      schema.oracle.jsonSerializations +
      schema.oracle.objectRests +
      schema.oracle.objectSpreads +
      schema.oracle.prototypeObservations +
      schema.oracle.strictEqualityAssertions;
    lines.push(
      `| \`${schema.id}\` | ${schema.directAccesses} | ${schema.fields.total} | ${schema.fields.optional} | ${schema.fields.requiredUndefined} | ${schema.construction.objectLiterals} | ${schema.construction.plainObjectLiterals} | ${schema.construction.objectLiteralsWithSpread} | ${schema.construction.computedObjectLiterals} | ${schema.construction.objectLiteralsOmittingOptionalFields} | ${schema.production.crossSchemaTransfers} | ${schema.production.anonymousStructuralTransfers} | ${schema.production.dynamicIngresses} | ${schema.production.enumerations} | ${schema.production.jsonSerializations} | ${schema.production.objectRests} | ${schema.production.objectSpreads} | ${schema.bridge.inputSignatures} | ${schema.bridge.outputSignatures} | ${schema.construction.testObjectLiterals} | ${oracle} | ${schema.migration.mechanicallyCompatible ? 'yes' : 'no'} | ${schema.migration.normalizationReasons.length > 0 ? schema.migration.normalizationReasons.map((reason) => `\`${reason}\``).join(', ') : '—'} | ${schema.migration.observabilityReasons.length > 0 ? schema.migration.observabilityReasons.map((reason) => `\`${reason}\``).join(', ') : '—'} |`,
    );
  }
  lines.push('');
  return lines.join('\n');
}

export function typedStructProvenanceSummary(audit: TypedStructProvenanceAudit): string {
  const summary = audit.summary;
  const lines = [
    '# Typed Struct Provenance Audit',
    '',
    `Upstream commit: \`${audit.upstreamCommit}\``,
    '',
    'This reporting-only audit tests nominal-identity closure for the clean required-field set. It does not enable class emission. Bridge exposure is reported separately and is not itself a closure blocker.',
    '',
    '| Metric | Count |',
    '| --- | ---: |',
    `| Clean required-field candidates | ${summary.candidateSchemas} |`,
    `| Nominally closed candidates | ${summary.closedSchemas} |`,
    `| Blocked candidates | ${summary.blockedSchemas} |`,
    `| Normalization-provenance blockers only | ${summary.normalizationOnlyBlockedSchemas} |`,
    `| Container-transfer blockers only | ${summary.containerOnlyBlockedSchemas} |`,
    `| Both blocker classes | ${summary.combinedBlockedSchemas} |`,
    `| Normalization roots (all eligible schemas) | ${summary.normalizationRoots} |`,
    `| JSON.parse roots | ${summary.jsonParseRoots} |`,
    `| Containment edges (all eligible schemas) | ${summary.containmentEdges} |`,
    `| Candidates blocked by normalization provenance | ${summary.normalizationProvenanceBlockedSchemas} |`,
    `| Candidates blocked by container transfers | ${summary.containerTransferBlockedSchemas} |`,
    `| Candidates with anonymous container transfers | ${summary.anonymousContainerTransferSchemas} |`,
    `| Candidates with cross-schema container transfers | ${summary.crossSchemaContainerTransferSchemas} |`,
    `| Candidates with dynamic container transfers | ${summary.dynamicContainerTransferSchemas} |`,
    `| Candidates exposed through bridge inputs | ${summary.bridgeInputExposedSchemas} |`,
    `| Candidates exposed through bridge outputs | ${summary.bridgeOutputExposedSchemas} |`,
    '',
    'Exact containment paths, roots, transfer locations, and bridge paths are in `typed-struct-provenance.json`.',
    '',
    '| Candidate | Direct | Fields | Parents | Children | Normalization roots | Container transfers | Bridge in roots | Bridge out roots | Closed | Blockers |',
    '| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :---: | --- |',
  ];
  for (const schema of audit.schemas) {
    lines.push(
      `| \`${schema.id}\` | ${schema.directAccesses} | ${schema.fields} | ${schema.containment.parents.length} | ${schema.containment.children.length} | ${schema.normalizationProvenance.length} | ${schema.transfers.length} | ${schema.bridgeExposure.inputPaths.length} | ${schema.bridgeExposure.outputPaths.length} | ${schema.nominalIdentity.closed ? 'yes' : 'no'} | ${schema.nominalIdentity.blockerReasons.length > 0 ? schema.nominalIdentity.blockerReasons.map((reason) => `\`${reason}\``).join(', ') : '—'} |`,
    );
  }
  lines.push('');
  return lines.join('\n');
}

export function stableJson(value: unknown): string {
  return `${JSON.stringify(value, undefined, 2)}\n`;
}

export function writeOrCheck(file: string, content: string, check: boolean): void {
  const normalized = content.replace(/\r\n/gu, '\n');
  if (check) {
    if (!existsSync(file)) throw new Error(`Generated report is missing: ${path.relative(process.cwd(), file)}`);
    const current = readFileSync(file, 'utf8').replace(/\r\n/gu, '\n');
    if (current !== normalized) throw new Error(`Generated report is stale: ${path.relative(process.cwd(), file)}`);
    return;
  }
  writeFileSync(file, normalized);
}
