# backend-hx integration

The Haxe backend itself lives in `flight-compiler`. This directory owns only flight-hx's downstream integration driver.

`generate.mjs` builds the pinned compiler, constructs the complete pinned Flight SDK package graph, and invokes the compiler's public Haxe backend in either `extern` or `transpile` mode. It writes each mode atomically and records source/compiler revisions, package coverage, initialization, named compatibility corrections, and exact refusal details.

The integration also owns the boundaries that only a consumer repository can verify:

- compiler-emitted JS externs receive public `flight.*` type aliases and are filtered to values actually exported from each package's `/contract` source graph;
- narrow Haxe compatibility corrections remain named in each manifest, include exact per-file
  application counts, and fail generation when their expected inputs drift;
- all emitted transpiled files must pass a compiler callback using pinned Haxe 4.3.7 before output is accepted;
- `--check` builds candidate trees in temporary directories and rejects byte drift.

Analysis, TypeScript parsing, IR, lowering, and primary Haxe emission must remain compiler-owned. Do not add a second frontend or general-purpose transpiler here.

The checked-in extern tree is the downstream golden reference: all 2,855 SDK modules compile after
two exact, manifest-recorded Haxe syntax corrections. Those corrections belong here until the
compiler emits equivalent valid syntax itself. The transpiled fallback is independently useful, but
its completeness is not a prerequisite for the complete web extern package or direct flight-cpp
native bindings.

`refreshTranspiledSurface.mjs` is the deliberate seam between those timelines. It does not parse
TypeScript or lower implementations: it intersects the checked-in compiler-emitted Haxe
implementations with the current generated extern declarations, then deterministically rewrites the
derived aliases, facades, supported/unavailable ledger, and manifest provenance. Routine production
verification runs this inexpensive derivation check plus full extern regeneration. Re-running the
full optional transpile compiler is reserved for advancing its pinned implementation corpus.
