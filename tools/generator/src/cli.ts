import { mkdirSync } from 'node:fs';
import path from 'node:path';

import { portConfig } from '../port.config.ts';
import { analyzeUpstream } from './analyze/inventory.ts';
import { auditLowering } from './analyze/lowering.ts';
import { generateCoreModules } from './emit/core.ts';
import { createApiReport, inventorySummary, loweringSummary, stableJson, writeOrCheck } from './emit/reports.ts';

const argumentsSet = new Set(process.argv.slice(2));
const check = argumentsSet.has('--check');
const apiOnly = argumentsSet.has('--api');
const jsonOnly = argumentsSet.has('--json');
const workspaceDirectory = process.cwd();
const reportsDirectory = path.join(workspaceDirectory, portConfig.reportsDirectory);

try {
  const inventory = analyzeUpstream(workspaceDirectory);
  const lowering = apiOnly ? undefined : auditLowering(workspaceDirectory);
  const api = createApiReport(inventory);

  if (jsonOnly) {
    process.stdout.write(stableJson(apiOnly ? api : inventory));
  } else {
    mkdirSync(reportsDirectory, { recursive: true });
    if (!apiOnly) {
      generateCoreModules(workspaceDirectory, check);
      writeOrCheck(path.join(reportsDirectory, 'inventory.json'), stableJson(inventory), check);
      writeOrCheck(path.join(reportsDirectory, 'inventory.md'), inventorySummary(inventory), check);
      if (!lowering) throw new Error('Expected lowering audit');
      writeOrCheck(path.join(reportsDirectory, 'lowering.json'), stableJson(lowering), check);
      writeOrCheck(path.join(reportsDirectory, 'lowering.md'), loweringSummary(lowering), check);
    }
    writeOrCheck(path.join(reportsDirectory, 'api.json'), stableJson(api), check);
    process.stdout.write(
      `${check ? 'Verified' : 'Generated'} ${inventory.summary.packages} packages, ${inventory.summary.exports} public exports, and ${inventory.summary.testFiles} tests.\n`,
    );
  }
} catch (error) {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`${message}\n`);
  process.exitCode = 1;
}
