import { readFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { portConfig } from '../../port.config.ts';

import {
  hostEndpointContract,
  hostEndpointBinding,
  hostEndpointIsCovered,
  hostEndpointUsesDynamicFallback,
  hostPropertyOperation,
  hostReceiverContracts,
  webGlComputedConstantDomain,
  type HostEndpointOperation,
} from '../host-endpoints.ts';
import type { IrHostEndpointBinding } from '../model/ir.ts';

import { upstreamTypeScriptProgram, type UpstreamTypeScriptProgram } from './program.ts';

export interface HostEndpointSite {
  column: number;
  line: number;
  source: string;
}

export interface HostEndpointAuditEntry {
  accesses: number;
  binding: IrHostEndpointBinding;
  contract: 'backend' | 'dynamic-fallback';
  member: string;
  operation: HostEndpointOperation;
  receiverTypes: string[];
  runtimeEndpoint: string;
  runtimePath: string;
  sites: HostEndpointSite[];
}

export interface HostEndpointCoverageIssue {
  binding: IrHostEndpointBinding;
  kind: 'contract-runtime-gap' | 'dynamic-runtime-gap' | 'usage-contract-gap';
  member: string;
  operation: HostEndpointOperation;
  runtimePath: string;
}

export interface HostEndpointAudit {
  coverageIssues: HostEndpointCoverageIssue[];
  endpoints: HostEndpointAuditEntry[];
  schemaVersion: 1;
  summary: {
    accesses: number;
    backendContractEndpoints: number;
    bindings: number;
    calls: number;
    dynamicFallbackEndpoints: number;
    endpoints: number;
    reads: number;
    writes: number;
  };
  upstreamCommit: string;
}

type HostRuntimeSources = Partial<Record<IrHostEndpointBinding, string>>;

const dynamicRuntimePath = 'src/flighthq/_internal/_Runtime.hx';

interface MutableHostEndpointAuditEntry extends HostEndpointAuditEntry {
  siteKeys: Set<string>;
}

export function auditHostEndpoints(
  workspaceDirectory: string,
  upstreamCommit: string,
  { checker, program }: UpstreamTypeScriptProgram = upstreamTypeScriptProgram(workspaceDirectory),
  runtimeSources?: HostRuntimeSources,
): HostEndpointAudit {
  const endpointsByKey = new Map<string, MutableHostEndpointAuditEntry>();
  const record = (
    binding: IrHostEndpointBinding,
    member: string,
    operation: HostEndpointOperation,
    runtimeEndpoint: string,
    node: ts.Node,
  ): void => {
    const receiver = hostReceiverContracts.find((contract) => contract.binding === binding);
    if (!receiver) throw new Error(`Missing host receiver contract for ${binding}`);
    const dynamicFallback = hostEndpointUsesDynamicFallback(binding, operation, runtimeEndpoint);
    const key = [binding, operation, member, runtimeEndpoint].join('|');
    const entry =
      endpointsByKey.get(key) ??
      ({
        accesses: 0,
        binding,
        contract: dynamicFallback ? 'dynamic-fallback' : 'backend',
        member,
        operation,
        receiverTypes: receiver.receiverTypes.slice(),
        runtimeEndpoint,
        runtimePath: dynamicFallback ? dynamicRuntimePath : receiver.runtimePath,
        siteKeys: new Set<string>(),
        sites: [],
      } satisfies MutableHostEndpointAuditEntry);
    entry.accesses += 1;
    const sourceFile = node.getSourceFile();
    const position = sourceFile.getLineAndCharacterOfPosition(node.getStart(sourceFile));
    const site: HostEndpointSite = {
      column: position.character + 1,
      line: position.line + 1,
      source: path.relative(workspaceDirectory, sourceFile.fileName).split(path.sep).join('/'),
    };
    const siteKey = `${site.source}:${String(site.line)}:${String(site.column)}`;
    if (!entry.siteKeys.has(siteKey)) {
      entry.siteKeys.add(siteKey);
      entry.sites.push(site);
    }
    endpointsByKey.set(key, entry);
  };

  const visit = (node: ts.Node): void => {
    if (ts.isPropertyAccessExpression(node)) {
      const binding = hostEndpointBinding(checker.getTypeAtLocation(node.expression), checker);
      if (binding) {
        const operation = hostPropertyOperation(node);
        const runtimeEndpoint =
          binding === 'WebGl2Backend' && operation === 'call'
            ? webGlRuntimeEndpoint(node.name.text, callArgumentCount(node))
            : node.name.text;
        record(binding, node.name.text, operation, runtimeEndpoint, node);
      }
    } else if (ts.isElementAccessExpression(node) && node.argumentExpression) {
      const binding = hostEndpointBinding(checker.getTypeAtLocation(node.expression), checker);
      if (binding === 'WebGl2Backend') {
        const domain = webGlComputedConstantDomain(checker.getTypeAtLocation(node.argumentExpression), checker);
        if (domain) {
          for (const member of domain.values) record(binding, member, 'read', member, node);
        }
      }
    }
    ts.forEachChild(node, visit);
  };
  for (const source of program.getSourceFiles().filter(isProductionUpstreamSource)) visit(source);

  const endpoints = [...endpointsByKey.values()]
    .map(({ siteKeys: _siteKeys, ...entry }) => ({
      ...entry,
      sites: entry.sites.sort(compareSites),
    }))
    .sort(compareEndpoints);
  const coverageIssues = hostEndpointCoverageIssues(workspaceDirectory, endpoints, runtimeSources);
  const countOperation = (operation: HostEndpointOperation): number =>
    endpoints
      .filter((endpoint) => endpoint.operation === operation)
      .reduce((total, endpoint) => total + endpoint.accesses, 0);
  return {
    coverageIssues,
    endpoints,
    schemaVersion: 1,
    summary: {
      accesses: endpoints.reduce((total, endpoint) => total + endpoint.accesses, 0),
      backendContractEndpoints: hostContractEndpointCount(),
      bindings: new Set(endpoints.map((endpoint) => endpoint.binding)).size,
      calls: countOperation('call'),
      dynamicFallbackEndpoints: endpoints.filter((endpoint) => endpoint.contract === 'dynamic-fallback').length,
      endpoints: endpoints.length,
      reads: countOperation('read'),
      writes: countOperation('write'),
    },
    upstreamCommit,
  };
}

export function validateHostEndpointCoverage(audit: HostEndpointAudit): void {
  if (audit.coverageIssues.length === 0) return;
  throw new Error(
    `Host endpoint coverage is incomplete:\n${audit.coverageIssues
      .map((issue) => `- ${issue.binding}.${issue.member} [${issue.operation}] ${issue.kind} in ${issue.runtimePath}`)
      .join('\n')}`,
  );
}

export function hostEndpointCoverageIssues(
  workspaceDirectory: string,
  endpoints: readonly HostEndpointAuditEntry[],
  runtimeSources?: HostRuntimeSources,
): HostEndpointCoverageIssue[] {
  const sources = new Map<IrHostEndpointBinding, string>();
  for (const contract of hostReceiverContracts) {
    sources.set(
      contract.binding,
      runtimeSources?.[contract.binding] ?? readFileSync(path.join(workspaceDirectory, contract.runtimePath), 'utf8'),
    );
  }
  const dynamicRuntime = readFileSync(path.join(workspaceDirectory, dynamicRuntimePath), 'utf8');
  const issues: HostEndpointCoverageIssue[] = [];
  for (const endpoint of endpoints) {
    if (hostEndpointIsCovered(endpoint.binding, endpoint.operation, endpoint.runtimeEndpoint)) continue;
    if (hostEndpointUsesDynamicFallback(endpoint.binding, endpoint.operation, endpoint.runtimeEndpoint)) {
      const runtimeOperation = dynamicRuntimeOperationName(endpoint.operation);
      if (!haxeStaticFunctionNames(dynamicRuntime).has(runtimeOperation)) {
        issues.push({
          binding: endpoint.binding,
          kind: 'dynamic-runtime-gap',
          member: endpoint.runtimeEndpoint,
          operation: endpoint.operation,
          runtimePath: dynamicRuntimePath,
        });
      }
    } else {
      issues.push({
        binding: endpoint.binding,
        kind: 'usage-contract-gap',
        member: endpoint.runtimeEndpoint,
        operation: endpoint.operation,
        runtimePath: endpoint.runtimePath,
      });
    }
  }

  for (const [binding, contract] of Object.entries(hostEndpointContract) as Array<
    [IrHostEndpointBinding, (typeof hostEndpointContract)[IrHostEndpointBinding]]
  >) {
    const receiver = hostReceiverContracts.find((candidate) => candidate.binding === binding)!;
    const source = sources.get(binding)!;
    for (const operation of ['call', 'read', 'write'] as const) {
      for (const member of contract[operation]) {
        if (backendRuntimeHas(binding, operation, member, source)) continue;
        issues.push({
          binding,
          kind: 'contract-runtime-gap',
          member,
          operation,
          runtimePath: receiver.runtimePath,
        });
      }
    }
  }
  return issues.sort(compareCoverageIssues);
}

function backendRuntimeHas(
  binding: IrHostEndpointBinding,
  operation: HostEndpointOperation,
  member: string,
  source: string,
): boolean {
  if (binding === 'WebGl2Backend') {
    return operation === 'call'
      ? haxeStaticFunctionNames(source).has(member)
      : operation === 'read'
        ? haxeStaticConstantNames(source).has(member)
        : false;
  }
  const branches = binding === 'Canvas2dBackend' ? explicitCanvasBranches(source) : [source];
  const functionName = runtimeOperationName(operation);
  return branches.every((branch) => haxeSwitchCases(branch, functionName).has(member));
}

function explicitCanvasBranches(source: string): string[] {
  const cairoStart = source.indexOf('#elseif (lime && lime_cairo)');
  const unavailableStart = source.indexOf('#elseif lime', cairoStart + 1);
  if (cairoStart < 0 || unavailableStart < 0) return [source];
  return [source.slice(0, cairoStart), source.slice(cairoStart, unavailableStart)];
}

function haxeSwitchCases(source: string, functionName: string): Set<string> {
  const start = source.search(new RegExp(`public static (?:inline )?function ${functionName}\\(`, 'u'));
  if (start < 0) return new Set();
  const remainder = source.slice(start);
  const next = remainder.slice(1).search(/public static (?:inline )?function /u);
  const body = next < 0 ? remainder : remainder.slice(0, next + 1);
  return new Set([...body.matchAll(/(?:case |name == )'([^']+)'/gu)].map((match) => match[1]!));
}

function haxeStaticFunctionNames(source: string): Set<string> {
  return new Set(
    [...source.matchAll(/public static (?:inline )?function ([A-Za-z_][A-Za-z0-9_]*)\(/gu)].map((match) => match[1]!),
  );
}

function haxeStaticConstantNames(source: string): Set<string> {
  return new Set(
    [...source.matchAll(/public static inline final ([A-Za-z_][A-Za-z0-9_]*):/gu)].map((match) => match[1]!),
  );
}

function runtimeOperationName(operation: HostEndpointOperation): 'call' | 'field' | 'setField' {
  return operation === 'call' ? 'call' : operation === 'read' ? 'field' : 'setField';
}

function dynamicRuntimeOperationName(operation: HostEndpointOperation): 'callProperty' | 'field' | 'setField' {
  return operation === 'call' ? 'callProperty' : operation === 'read' ? 'field' : 'setField';
}

function callArgumentCount(node: ts.PropertyAccessExpression): number | undefined {
  return ts.isCallExpression(node.parent) && node.parent.expression === node ? node.parent.arguments.length : undefined;
}

function webGlRuntimeEndpoint(member: string, argumentCount: number | undefined): string {
  if (member !== 'texImage2D') return member;
  if (argumentCount === 6) return 'texImage2DSource';
  if (argumentCount === 9) return member;
  return `${member}/${String(argumentCount)}`;
}

function hostContractEndpointCount(): number {
  return (Object.values(hostEndpointContract) as Array<Record<HostEndpointOperation, Set<string>>>).reduce(
    (total, contract) => total + contract.call.size + contract.read.size + contract.write.size,
    0,
  );
}

function isProductionUpstreamSource(source: ts.SourceFile): boolean {
  const normalized = source.fileName.split(path.sep).join('/');
  const packageDirectory = /\/upstream\/packages\/([^/]+)\/src\//u.exec(normalized)?.[1];
  return (
    packageDirectory !== undefined &&
    !(packageDirectory in portConfig.excludedPackages) &&
    !/\.(?:test|spec)\.tsx?$/u.test(normalized) &&
    !normalized.endsWith('.d.ts')
  );
}

function compareSites(left: HostEndpointSite, right: HostEndpointSite): number {
  return left.source.localeCompare(right.source) || left.line - right.line || left.column - right.column;
}

function compareEndpoints(left: HostEndpointAuditEntry, right: HostEndpointAuditEntry): number {
  return (
    left.binding.localeCompare(right.binding) ||
    left.member.localeCompare(right.member) ||
    left.operation.localeCompare(right.operation) ||
    left.runtimeEndpoint.localeCompare(right.runtimeEndpoint)
  );
}

function compareCoverageIssues(left: HostEndpointCoverageIssue, right: HostEndpointCoverageIssue): number {
  return (
    left.binding.localeCompare(right.binding) ||
    left.member.localeCompare(right.member) ||
    left.operation.localeCompare(right.operation) ||
    left.kind.localeCompare(right.kind)
  );
}
