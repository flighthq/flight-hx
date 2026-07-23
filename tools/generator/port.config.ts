export const portConfig = {
  haxePackage: 'flight',
  upstreamDirectory: 'upstream',
  generatedDirectory: 'generated',
  reportsDirectory: 'reports',
  // Upstream packages accounted for in the inventory but deliberately NOT translated to Haxe,
  // each with a recorded reason (AGENTS.md: a declaration is translated, patched, or explicitly
  // excluded with a reason — never silently dropped). Keyed by directory name under upstream/packages.
  excludedPackages: {
    'tool-capture':
      'Node/Playwright browser-automation dev tooling (@playwright/test); not portable Flight runtime, excluded from the @flighthq/sdk barrel, and depended on by no other package.',
  } as Record<string, string>,
} as const;
