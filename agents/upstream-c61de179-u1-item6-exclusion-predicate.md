# U1 Item 6: Derived Package Exclusion Predicate

Status: implemented for upstream `c61de179af8a12c2fa3b9b7d5389ee302f577a0d` without regenerating Haxe, bridges, or committed reports.

## Name-free derivation

Package exclusion is now inventory data, not a package-name entry in `port.config.ts`. The sole supported rule, `node-playwright-tooling`, requires all of these independently derived facts:

- a manifest `bin` entry establishing a tooling/CLI lane;
- no exposure through any SDK barrel;
- at least one production `node:*` import;
- an `@playwright/test` production dependency and production import; and
- no host dependency or import from the Electron, Capacitor, or Tauri families, so the host-bound surface is limited to Node and Playwright.

The current inventory has one complete match, `@flighthq/tool-capture`. Its evidence records one bin, one Playwright host dependency, six distinct Node imports, one Playwright import, and zero SDK exposures. The derived reason is emitted in `PackageInventory.exclusion`, the inventory Markdown exclusion table, the core generation report, and generator stderr.

`port.config.ts` no longer contains either an `excludedPackages` field or the package name.

## Fail-closed behavior

A tooling bin or Playwright dependency/import starts an exclusion claim. Any missing required fact, SDK exposure, or different known host family rejects the inventory as a partial match with the failed facts. The complete inventory must derive exactly one exclusion under the single supported rule; zero matches or an additional full match also fails. This prevents an upstream tool package from entering translation silently and prevents a second package or a new host rationale from being excluded automatically.

The derived exclusion set now controls core lowering/facades, the lowering audit, host-endpoint discovery, and all typed-struct discovery/use/class/provenance scopes. Consequently the current lowering audit covers 138 translated packages with zero diagnostics: the production `for...in` gap was implemented in Item 5, and the excluded tooling array-rest diagnostic no longer enters the translated audit.

The inventory schema is version 3 and includes `summary.excludedPackages`, per-package evidence, rule, and reason. Focused tests cover the real upstream evidence, absence of a name entry, a complete fixture, partial fixtures, a new host reason, an additional complete match, and zero-diagnostic translated lowering coverage.
