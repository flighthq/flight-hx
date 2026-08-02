export type ExportKind =
  | 'class'
  | 'default'
  | 'enum'
  | 'function'
  | 'interface'
  | 'namespace'
  | 'type'
  | 'unknown'
  | 'variable';

export interface ExportRecord {
  fingerprint: string;
  kind: ExportKind;
  name: string;
  runtime: boolean;
  runtimeBinding?: {
    fingerprint: string;
    kind: ExportKind;
    source: string;
  };
  source: string;
}

export interface ExportConflict {
  name: string;
  sources: string[];
}

export interface PackageExportCondition {
  condition: string;
  source: string;
  target: string;
}

export interface PackageExportLane {
  conditions: PackageExportCondition[];
  entry: string;
  exportConflicts: ExportConflict[];
  exports: ExportRecord[];
  source: string;
  specifier: string;
}

export interface SdkExposure {
  sdkLane: string;
  target: string;
}

export interface PackageExclusion {
  evidence: {
    hostDependencies: string[];
    hostImports: string[];
    nodeImports: string[];
    playwrightDependencies: string[];
    playwrightImports: string[];
    sdkExposures: string[];
    toolingBins: string[];
  };
  reason: string;
  rule: 'node-playwright-tooling';
}

export interface PackageInventory {
  dependencies: string[];
  directory: string;
  exclusion: PackageExclusion | null;
  exportLanes: PackageExportLane[];
  haxeModule: string;
  name: string;
  sdkExposures: SdkExposure[];
  sdkIncluded: boolean;
  sourceFiles: number;
  testFiles: number;
  version: string;
}

export interface UpstreamInventory {
  packages: PackageInventory[];
  schemaVersion: 4;
  summary: {
    excludedPackages: number;
    exportConflicts: number;
    exportLanes: number;
    exports: number;
    packages: number;
    rootExports: number;
    sourceFiles: number;
    testFiles: number;
  };
  upstreamCommit: string;
}

export interface ApiReport {
  packages: Array<{
    exportLanes: PackageExportLane[];
    haxeModule: string;
    name: string;
    sdkExposures: SdkExposure[];
    sdkIncluded: boolean;
  }>;
  schemaVersion: 3;
  upstreamCommit: string;
}
