# Native flight-cpp binding boundary

This directory is the exact downstream support partition, not a promise that every header emitted
by flight-cpp is usable. `manifest.json` pins the flight-cpp checkout, its generated SDK's distinct
Flight/compiler revisions, C++20, downstream corrections, public Haxe names, native symbols, and
headers. Public facade overrides deliberately expose nothing outside that manifest.

## Current compile audit

The current pin's generated SDK uses the same Flight revision as this repo and records its distinct
flight-compiler revision (`806d257` versus flight-hx planning at `804435a`). It reports 2,574 emitted
and 577 refused modules from 3,151 profile inputs across 153 packages. The exact general-purpose
Haxe-callable partition remains intentionally smaller: 219 functions across 27 public modules. They
are compared with current web signatures, then compiled and executed from one Haxe source in the
cross-target gate. Sixty-two bind directly from the compiler plan, four use compiler-emitted UTF-8
String adapters, 53 required-primitive functions, and three optional-scalar adapters are explicit
flight-hx overrides from dependency-complete flight-cpp headers. Forty-five additional functions
use the generated flat/recursive `Array<Float>` adapter, which copies between hxcpp and
`flight::Array<double>`, preserves argument aliases and optional-output identity, and copies native
mutations back. Two Audio functions copy required UTF-8 strings and map optional native results to
Haxe `Null<String>`. Fifty Bitmap and Spring functions pass `flight::Ref<T>` carriers through
unchanged, retain shared ownership, reconstruct optional primitive parameters from presence bits,
and accept readonly structural-reference inputs where the native signature requires them.
Expanding that partition remains manifest-first and compile-proven; the larger generated C++
inventory is not silently claimed as Haxe support.

`reconciliation.json` is the checked package-by-package difference between that exact partition and
the complete default web API. It records 1,902 dependency-complete modules, 672
dependency-incomplete modules, 577 refused modules, and all associated refusal codes. The compiler
dual plan covers all 11,247 public rows and emits 2,245 Haxe-C++ declarations. All 66 function
candidates are promoted: 62 as direct calls and four through exact compiler-emitted adapters. The
header scan also finds 183 public scalar signatures with matching inline definitions; 114 overlap
the promoted partition and the remaining 69 across 32 packages are probe candidates, not promised support.
Complex signatures stay classified for identity, lifetime, nullable/union, callback, and
structural-owner review.

The bridges do not reimplement Flight. Generated declaration-only headers expose primitive ABI
prototypes to hxcpp; separate C++ translation units include flight-cpp's `include`,
`overrides/include`, and `generated/include` roots in that order and forward directly to the real
functions. The four String cases preserve the compiler-owned adapter bodies and copy through UTF-8
at that isolated boundary. This isolates flight-cpp's `flight::null` and `flight::Array` names from
hxcpp-generated code. The haxelib initialization macro also suppresses hxcpp's trailing C++11 flag
so flight-cpp remains a C++20 build.

The downstream scalar override provenance is deliberately temporary and fail-loud. It requires an
exact required-primitive signature in a dependency-complete generated header, and generation fails
if flight-compiler begins planning the same public function. Compiler support therefore replaces the
override instead of leaving two competing sources of truth.
Optional-scalar overrides have distinct provenance and require the exact generated
`std::optional` signature. Their internal ABI carries a presence bit plus the primitive value, while
the public Haxe signature remains identical to the web API.
Flat and recursively nested `Array<Float>` adapters likewise have distinct provenance and require
exact dependency-complete native signatures. Nullable-String adapters require an exact
`std::optional<flight::String>` result and copy through UTF-8 at the same isolated boundary. They
remain generated from the manifest rather than handwritten per function, and every promoted call
executes on both native and web through the installed consumer.
Reference-carrier adapters require dependency-complete headers, exact native names and signatures,
non-optional reference parameters, and either exact `flight::Ref<T>` inputs or flight-cpp's readonly
`StructuralRef` view. A generated dependency-light header forward-declares only real structs, never
C++ aliases, which keeps the full type contract and its `flight::null` helper outside hxcpp's
generated namespace. Their public wrappers are `extern inline`: hxcpp reflected static wrappers are
limited to five arguments, while inlined calls preserve Flight's larger signatures. Reference
handles can be passed and returned but cannot currently be compared directly with Haxe `null`.
`manifest.json` also records failed override probes. The current inventory is empty: flight-cpp's
Spine helper override repaired the last recorded header failure, and
`Skeleton2dFormats.clampUnit` now crosses the same compile-and-run gate as the other required-scalar
overrides.

## Window/render status

The current flight-cpp pin contains the real optional SDL3 host and its OpenGL adapter. The
manifest-recorded `flight.HostSdlGl` extension now lets `examples/window-native` construct that host,
create a hidden SDL OpenGL window/context, issue a clear through flight-cpp's WebGL-shaped adapter,
and present. The installed-package cross-target gate builds and runs this path offscreen.

This is a real host/window/GL/presentation proof, but not a claim that every generated Flight
renderer contract is available through Haxe. Keep the native extension separate from the generated
portable surface until that mapping is complete. Building it requires CMake, Ninja, and external SDL
3.2+ development files; the Haxelib packages bridge source, not SDL or prebuilt flight-cpp binaries.

`examples/camera2d` advances that seam into a genuine Scene2D GL workload. One Haxe source authors
the deterministic graph used by both targets through `flight.Scene2dApp`; it contains no backend
conditional or hidden-package import. On web, public `flight.Sprite`, `Shape`, and `DisplayObject`
are the current compiler-emitted structural externs. On native, the same names are typed handles
into the session, which owns the otherwise GC-unsafe C++ objects and forwards each fine-grained
scene command to flight-cpp. The internal declaration-only bridge header keeps the large renderer
include closure out of hxcpp-generated translation units. The sample's 44-node shared-texture grid
exercises the public `Sprite` identity and Flight's GL Sprite renderer on both targets.

The native extension is recorded separately in `manifest.json`, including the three flight-cpp
include roots it needs. Their order is significant: `include`, then flight-cpp's own
`overrides/include`, then `generated/include`. The overrides are part of the pinned flight-cpp SDK,
not hidden flight-hx patches. The cross-target gate first runs flight-cpp's full Camera2D smoke as a
control, then compiles the example from an isolated Haxelib installation and requires three real
offscreen framebuffer reads with scene coverage and the yellow center player.
