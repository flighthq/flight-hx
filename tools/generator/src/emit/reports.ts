import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';

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
    '',
    '| Package | Declarations | Lowered | Diagnostics |',
    '| --- | ---: | ---: | ---: |',
  ];
  for (const item of audit.packages) {
    lines.push(`| \`${item.packageName}\` | ${item.declarations} | ${item.lowered} | ${item.diagnostics.length} |`);
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
