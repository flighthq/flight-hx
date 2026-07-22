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
  source: string;
}

export interface ExportConflict {
  name: string;
  sources: string[];
}

export interface PackageInventory {
  dependencies: string[];
  directory: string;
  exportConflicts: ExportConflict[];
  exports: ExportRecord[];
  haxeModule: string;
  name: string;
  sdkIncluded: boolean;
  sourceFiles: number;
  testFiles: number;
  version: string;
}

export interface UpstreamInventory {
  packages: PackageInventory[];
  schemaVersion: 1;
  summary: {
    exportConflicts: number;
    exports: number;
    packages: number;
    sourceFiles: number;
    testFiles: number;
  };
  upstreamCommit: string;
}

export interface ApiReport {
  packages: Array<{
    exports: ExportRecord[];
    haxeModule: string;
    name: string;
    sdkIncluded: boolean;
  }>;
  schemaVersion: 1;
  upstreamCommit: string;
}
