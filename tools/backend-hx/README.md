# backend-hx integration

The Haxe backend itself lives in `flight-compiler`. This directory owns only flight-hx's downstream integration driver.

`generate.mjs` builds the pinned compiler, constructs the complete pinned Flight SDK package graph, and invokes the compiler's public Haxe backend in either `extern` or `transpile` mode. It writes each mode atomically and records source/compiler revisions, package coverage, initialization, named compatibility corrections, and exact refusal details.

The integration also owns the boundaries that only a consumer repository can verify:

- compiler-emitted JS externs receive a complete public `flight.*` facade (types, functions, and
  values) and are filtered to declarations actually exported from each package's `/contract`
  source graph; optional arguments are forwarded as JavaScript `undefined` when Haxe represents
  omission as `null`, preserving upstream default parameters;
- narrow Haxe compatibility corrections remain named in each manifest, include exact per-file
  application counts, and fail generation when their expected inputs drift;
- all emitted transpiled files must pass a compiler callback using pinned Haxe 4.3.7 before output is accepted;
- `--check` builds candidate trees in temporary directories and rejects byte drift.

Analysis, TypeScript parsing, IR, lowering, and primary Haxe emission must remain compiler-owned. Do not add a second frontend or general-purpose transpiler here.

`generate.mjs` writes `generated/js/default-api.json` as the exact per-package public contract.
For extern mode it also asks flight-compiler for its target-neutral dual-binding and Haxe-C++ extern
plans, folds in flight-cpp's real refusal/header ledgers, and writes the compact checked
`generated/js/native-planning.json`. `syncNativeFunctions.mjs` only materializes manifest-approved
direct functions and exact compiler-emitted adapters found in that plan. It also permits explicit
downstream scalar overrides only when a dependency-complete flight-cpp header contains the exact
required-primitive signature, plus separately proven optional-scalar adapters that reconstruct
`std::optional` from a primitive presence bit, when the compiler plan does not yet contain that
function. The same manifest-first boundary generates proven flat and recursive `Array<Float>` copy
adapters with argument-alias preservation, optional-output identity, and mutation copy-back. It
also copies required Haxe strings into `flight::String` and maps nullable native string results back
to `Null<String>`. Reference-carrier bindings retain `flight::Ref<T>` ownership, encode optional
primitive presence explicitly, preserve optional reference omission and nullable reference results
through a thin hxcpp-facing owning wrapper, accept exact or readonly structural-reference inputs, and use a
struct-only forward-declaration header so C++ aliases and the full Flight type contract never leak
into hxcpp-generated namespaces. Their public facade is call-site-only `extern inline` to support
signatures beyond hxcpp's reflected-wrapper arity. Schema, compiler revision, locator, carrier, emitted adapter body, header status,
provenance, and web signature drift all fail loudly.
Failed compile probes remain manifest-recorded scalar override refusals; an emitted or
dependency-complete inventory status never silently becomes Haxe support.
`reconcileNativeSurface.mjs` then compares it with flight-cpp's best-effort/refusal inventories and
the manifest-pinned native Haxe partition. Its `src-cpp/reconciliation.json` output distinguishes
dependency-complete headers, dependency-incomplete headers, hard refusals, compile-proven bindings,
and header-confirmed scalar probe candidates. It never treats a generated header as proof that
Haxe's ABI, ownership, nullable/union, callbacks, and structural identities are reconciled.

The checked-in extern tree is the downstream golden reference: all 3,144 modules in the current
153-package SDK graph compile after two exact, manifest-recorded compatibility corrections. Those
corrections belong here until the compiler owns the missing ambient WebGPU binding and public
resolver naming itself. The transpiled fallback is independently useful, but its completeness is
not a prerequisite for the complete web extern package or flight-cpp native bindings.

`refreshTranspiledSurface.mjs` is the deliberate seam between those timelines. It does not parse
TypeScript or lower implementations: it intersects the checked-in compiler-emitted Haxe
implementations with the current generated extern declarations, then deterministically rewrites the
derived aliases, facades, supported/unavailable ledger, and manifest provenance. Routine production
verification runs this inexpensive derivation check plus full extern regeneration. Re-running the
full optional transpile compiler is reserved for advancing its pinned implementation corpus.
When the current extern and optional transpiled corpora intentionally pin different Flight
revisions, refresh/check and backend parity report an explicit skip instead of deriving a false
cross-revision surface. Regenerating the optional corpus is the action that re-enables that claim.
