# Generated transpiled Haxe SDK

This tree combines compiler-emitted implementations from `@flighthq/sdk` 0.5.0 at
`65889a191bb0d2f5f2f95148590874f3e49bf9d4`, produced by `flight-compiler` at `56496423fd865a51023e72966190d10d886eae40`, with a public
`flight.*` partition derived from the current extern SDK at compiler revision
`9edfcca46db71d6a6a53aafa2718d8c9f9d5df7c`. Do not edit it by hand.

The transpile compiler emitted 1,110 of 2,866 dependency-closed source modules
from 154 SDK packages into 1,110 Haxe files. The flight-hx integration derived
6,114 backing/public files at the exact intersection of those implementations and the
current extern surface. It refused 1,756 modules; every refusal is recorded in
`refusals.json`. The exact supported and unavailable public `flight.*` partitions, including both
compiler revisions, are recorded in `public-surface.json`.

Refresh only the derived public partition from the checked-in compiler output and current extern SDK:

```sh
npm run refresh:transpile-surface
npm run refresh:transpile-surface:check
```

Regenerating the underlying optional transpiled implementation corpus is a separate compiler-maintenance task:

```sh
npm run generate -- --transpile
npm run refresh:transpile-surface
```
