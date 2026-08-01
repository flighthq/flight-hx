import { mkdirSync } from 'node:fs';
import path from 'node:path';

import { portConfig } from '../port.config.ts';
import { auditHostEndpoints } from './analyze/host-endpoints.ts';
import { analyzeUpstream } from './analyze/inventory.ts';
import { auditLowering } from './analyze/lowering.ts';
import { auditTypedStructClassFeasibility } from './analyze/typed-struct-classes.ts';
import { auditTypedStructProvenance } from './analyze/typed-struct-provenance.ts';
import { typedStructRegistry } from './analyze/typed-structs.ts';
import { generateCoreModules } from './emit/core.ts';
import {
  createApiReport,
  hostEndpointSummary,
  inventorySummary,
  loweringSummary,
  stableJson,
  typedStructClassFeasibilitySummary,
  typedStructProvenanceSummary,
  typedStructSummary,
  writeOrCheck,
} from './emit/reports.ts';

const argumentsSet = new Set(process.argv.slice(2));
const check = argumentsSet.has('--check');
const apiOnly = argumentsSet.has('--api');
const jsonOnly = argumentsSet.has('--json');
const workspaceDirectory = process.cwd();
const reportsDirectory = path.join(workspaceDirectory, portConfig.reportsDirectory);

try {
  const inventory = analyzeUpstream(workspaceDirectory);
  const hostEndpoints = apiOnly
    ? undefined
    : auditHostEndpoints(workspaceDirectory, inventory.upstreamCommit, undefined, undefined, inventory);
  const typedStructs = apiOnly
    ? undefined
    : typedStructRegistry(workspaceDirectory, inventory.upstreamCommit, undefined, undefined, inventory);
  const typedStructClasses =
    apiOnly || !typedStructs
      ? undefined
      : auditTypedStructClassFeasibility(workspaceDirectory, inventory.upstreamCommit, typedStructs);
  const typedStructProvenance =
    apiOnly || !typedStructs || !typedStructClasses
      ? undefined
      : auditTypedStructProvenance(workspaceDirectory, inventory.upstreamCommit, typedStructs, typedStructClasses);
  const lowering = apiOnly ? undefined : auditLowering(workspaceDirectory, typedStructs, inventory);
  const api = createApiReport(inventory);

  if (jsonOnly) {
    process.stdout.write(stableJson(apiOnly ? api : inventory));
  } else {
    mkdirSync(reportsDirectory, { recursive: true });
    if (!apiOnly) {
      if (!typedStructs) throw new Error('Expected typed-struct audit');
      if (!typedStructProvenance) throw new Error('Expected typed-struct provenance audit');
      if (!hostEndpoints) throw new Error('Expected host-endpoint audit');
      const core = generateCoreModules(workspaceDirectory, check, typedStructs, typedStructProvenance, hostEndpoints);
      for (const excluded of core.excludedPackages) {
        process.stderr.write(`Excluded (not translated): ${excluded.packageName} — ${excluded.reason}\n`);
      }
      writeOrCheck(path.join(reportsDirectory, 'inventory.json'), stableJson(inventory), check);
      writeOrCheck(path.join(reportsDirectory, 'inventory.md'), inventorySummary(inventory), check);
      writeOrCheck(path.join(reportsDirectory, 'host-endpoints.json'), stableJson(hostEndpoints), check);
      writeOrCheck(path.join(reportsDirectory, 'host-endpoints.md'), hostEndpointSummary(hostEndpoints), check);
      if (!lowering) throw new Error('Expected lowering audit');
      lowering.summary.staticEmission = core.staticLowering;
      writeOrCheck(path.join(reportsDirectory, 'lowering.json'), stableJson(lowering), check);
      writeOrCheck(path.join(reportsDirectory, 'lowering.md'), loweringSummary(lowering), check);
      writeOrCheck(path.join(reportsDirectory, 'typed-structs.json'), stableJson(typedStructs.report), check);
      writeOrCheck(path.join(reportsDirectory, 'typed-structs.md'), typedStructSummary(typedStructs.report), check);
      if (!typedStructClasses) throw new Error('Expected typed-struct class-feasibility audit');
      writeOrCheck(path.join(reportsDirectory, 'typed-struct-classes.json'), stableJson(typedStructClasses), check);
      writeOrCheck(
        path.join(reportsDirectory, 'typed-struct-classes.md'),
        typedStructClassFeasibilitySummary(typedStructClasses),
        check,
      );
      writeOrCheck(
        path.join(reportsDirectory, 'typed-struct-provenance.json'),
        stableJson(typedStructProvenance),
        check,
      );
      writeOrCheck(
        path.join(reportsDirectory, 'typed-struct-provenance.md'),
        typedStructProvenanceSummary(typedStructProvenance),
        check,
      );
    }
    writeOrCheck(path.join(reportsDirectory, 'api.json'), stableJson(api), check);
    process.stdout.write(
      `${check ? 'Verified' : 'Generated'} ${inventory.summary.packages} packages, ${inventory.summary.exportLanes} public lanes, ${inventory.summary.exports} export records, and ${inventory.summary.testFiles} tests.\n`,
    );
  }
} catch (error) {
  const message = error instanceof Error ? error.message : String(error);
  process.stderr.write(`${message}\n`);
  process.exitCode = 1;
}
