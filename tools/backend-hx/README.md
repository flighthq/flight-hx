# backend-hx integration

The Haxe backend itself lives in `flight-compiler`. This directory owns only flight-hx's downstream integration driver.

`generate.mjs` builds the pinned compiler, constructs the complete pinned Flight SDK package graph, and invokes the compiler's public Haxe backend in either `extern` or `transpile` mode. It writes each mode atomically and records source/compiler revisions, package coverage, initialization, named compatibility corrections, and exact refusal details.

The integration also owns the boundaries that only a consumer repository can verify:

- compiler-emitted JS externs receive public `flight.*` type aliases and are filtered to values actually exported from each package's `/contract` source graph;
- narrow Haxe compatibility corrections remain named in each manifest;
- all emitted transpiled files must pass a compiler callback using pinned Haxe 4.3.7 before output is accepted;
- `--check` builds candidate trees in temporary directories and rejects byte drift.

Analysis, TypeScript parsing, IR, lowering, and primary Haxe emission must remain compiler-owned. Do not add a second frontend or general-purpose transpiler here.
