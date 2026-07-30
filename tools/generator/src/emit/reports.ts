import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';

import type { TypedStructAudit } from '../analyze/typed-structs.ts';
import type { ApiReport, UpstreamInventory } from '../model/inventory.ts';
import type { LoweringAudit } from '../analyze/lowering.ts';

export function createApiReport(inventory: UpstreamInventory): ApiReport {
  return {
    packages: inventory.packages.map((item) => ({
      exports: item.exports,
      haxeModule: item.haxeModule,
      name: item.name,
      sdkIncluded: item.sdkIncluded,
    })),
    schemaVersion: 1,
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
    `| Public exports | ${inventory.summary.exports} |`,
    `| Export conflicts | ${inventory.summary.exportConflicts} |`,
    '',
    '| Upstream package | Haxe module | Sources | Tests | Exports | SDK | Conflicts |',
    '| --- | --- | ---: | ---: | ---: | :---: | ---: |',
  ];
  for (const item of inventory.packages) {
    lines.push(
      `| \`${item.name}\` | \`${item.haxeModule}\` | ${item.sourceFiles} | ${item.testFiles} | ${item.exports.length} | ${item.sdkIncluded ? 'yes' : 'no'} | ${item.exportConflicts.length} |`,
    );
  }
  lines.push('');
  return lines.join('\n');
}

export function loweringSummary(audit: LoweringAudit): string {
  const facts = audit.summary.staticFacts;
  const emission = audit.summary.staticEmission;
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
    '',
    '| Indexed receiver | Expressions | Reads | Writes |',
    '| --- | ---: | ---: | ---: |',
  ];
  for (const [receiver, counts] of Object.entries(facts.indexedReceivers)) {
    lines.push(`| \`${receiver}\` | ${counts.expressions} | ${counts.reads} | ${counts.writes} |`);
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
