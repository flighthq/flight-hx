# Architecture

## Objective

`flight-hx` automatically ports the Flight TypeScript SDK in `upstream/` into working Haxe source. The repository is a compiler-like translation system, not a manually maintained second implementation.

The output must be reproducible from the same inputs:

```text
upstream revision
  + generator revision
  + configuration
  + maintained runtime and templates
  + semantic patches
  = publishable Haxe source
```

Externs, handwritten edits to generated files, opaque test exclusions, and JavaScript-only wrappers do not satisfy the objective.

## Translation Pipeline

```text
Flight TypeScript source and package barrels
                ↓
      TypeScript AST and symbol graph
                ↓
 normalized language-neutral intermediate model
                ↓
      Haxe ownership and type lowering
                ↓
          semantic patch application
                ↓
 Haxe modules + runtime + API/coverage manifests
                ↓
 Haxe target compilation and JavaScript ESM bridges
                ↓
       upstream Vitest behavioral tests
```

The analyzer resolves packages, source modules, exports, re-exports, type-only imports, overloads, and symbol identity before emission. The intermediate model represents declarations and semantics rather than formatted TypeScript text.

## Public Haxe Surface

The Haxelib project is `flight`; its Haxe namespace is `flight`. The upstream npm scope remains `@flighthq/*`; only the Haxe address uses the shorter root. The public address follows Flight intent rather than source-file ownership:

```text
@flighthq/<npm-package> free function or value
→ flight.<PascalCasePackage>.<exportName>

translated implementation for that package
→ flight._<PascalCasePackage>

@flighthq/types exported type
→ flight.types.<TypeName>
```

Examples:

```text
@flighthq/geometry createVector2   → flight.Geometry.createVector2
@flighthq/render-gl createGlShader → flight.RenderGl.createGlShader
@flighthq/types Vector2Like        → flight.types.Vector2Like
```

Package `index.ts` files do not produce `Index`; each package has a PascalCase facade such as `flight.Geometry`, `flight.RenderGl`, or `flight.Sdk`. All translated bodies and non-public secondary types for that package fold into one mirrored `@:noCompletion` implementation module such as `flight._Geometry`; the module retains declaration-level source provenance for diagnostics, reports, and JavaScript bridges without exposing the upstream file split as Haxe topology.

Lowercase npm slugs do not contain enough information to reconstruct fused-word or dimensional casing. A reviewed package-name table therefore preserves Flight vocabulary such as `ParticleEmitter`, `FileSystem`, and `Scene2DGl`; unlisted names retain the deterministic lowercase-and-hyphen fallback rather than being split heuristically. The same reviewed name deterministically pairs `flight.Scene2DGl` with `flight._Scene2DGl`, so there is no second package spelling to memorize.

Broad consumers use `import flight.Sdk.*`; package consumers use imports such as `import flight.Geometry.*`. Both avoid knowledge of Flight's defining-file split.

Invalid module names, duplicate barrel values, duplicate exported type names, and Haxe package-level type collisions fail generation with every conflicting upstream source. Source provenance remains attached to each declaration and in the generated reports.

## Functions and Data

Flight's globally unique free-function names are a deliberate cross-language API feature.

- Exported names remain unchanged unless Haxe syntax makes that impossible.
- Free functions remain module-level functions.
- `createVector2`, `getVector2Length`, and `setVector2FromPolar` keep those names.
- `create*`, `clone*`, and `acquire*` retain their allocation meaning.
- `out` parameters remain explicit and retain upstream aliasing behavior.
- Expected failures retain upstream sentinel behavior.

Haxe classes may represent nominal entities or target-specific storage, but they do not become the public behavioral API. Constructors may be private or otherwise internal while `create<Type>` remains public. Structural `*Like` values should remain structural where Haxe can represent them portably.

Concrete, non-generic closed mapped aliases lower to strict anonymous Haxe typedefs. The generator recognizes standard `Partial`, `Pick`, and `Omit` by declaration identity, plus source wrappers that directly apply one of those utilities, and retains the source field order, optionality, and named field types. This covers `EntityWithoutRuntime<T>` specializations without naming that wrapper as policy. Generic utilities, open index signatures, standard-library-only shapes, and unresolved projections remain symbolic runtime-boundary types. Synthetic object-destructuring temporaries retain the resolved typedef, so generated reads use ordinary typed fields instead of reflection. Property-presence operations remain explicit runtime checks and do not force unrelated reads or writes back to `Dynamic`.

New checker-discovered structural identities always enter audit-only. Direct emission requires an explicit reviewed-addition entry keyed by stable public identity and declaration fingerprint; generation rejects a missing target, fingerprint drift, ineligibility, or any reflective escape. The historical migration baseline remains immutable. Once a field is admitted, reads and writes use that direct field, and writes cast to the checker-derived field type rather than `Dynamic`.

This structural declaration is also the portable ABI description for later Rust generation. A target-specific nominal representation is an optimization layer, not a replacement API: cpp `@:structInit` classes are admitted only when the generated provenance audit proves that every value reaches the type with the same nominal identity. When cross-schema transfer, dynamic ingress, containment, or observable aliasing prevents that proof, the public structural type and direct Haxe access remain in place.

## Type Placement

Every exported `@flighthq/types` declaration owns a module addressed directly by type name: `Vector2` is `flight.types.Vector2`, `Vector2Like` is `flight.types.Vector2Like`, and `RigidBody2D` is `flight.types.RigidBody2D`. Re-exporting packages reference that canonical declaration and do not duplicate it. Non-public helper types may remain secondary to their source implementation.

When a source file contains a same-named structural type and runtime values, the public type module remains canonical and values compile in the package's underscore-prefixed companion module. The split validates that each exported name has exactly one canonical declaration and that no maintained or generated module already owns its target path.

## Package and SDK Facades

Package facades are the granular public function/value surface. They and `flight.Sdk` mirror upstream barrels rather than blindly aggregating every package. Host and tooling packages excluded upstream remain excluded from the SDK facade. Each facade forwards directly to its single completion-hidden sibling (`flight.Geometry` → `flight._Geometry`); per-source JavaScript bridges recover their original ownership from declaration provenance rather than from emitted Haxe modules.

Each package's `./contract` export lane is Flight's protected inter-package channel. The generator still inventories every contract export and emits its JavaScript source bridge, but it does not emit a Haxe module for a contract source barrel that has no declarations of its own; `reports/core.json` records each omission and its manifest-derived reason. Both decisions use manifest lane and canonical source identity, never a `Contract` filename or export-name allowlist.

The lane maps to Haxe _visibility_, not a namespace lane, in three tiers (see [`public-surface-and-contract-visibility.md`](public-surface-and-contract-visibility.md)): a symbol used only within its own module stays plain `private`; a contract **member** (field, static function, method) reachable by other packages is individually emitted as `private` with `@:allow(flight)`, which rejects ordinary out-of-package consumers without opening private siblings; a contract-exclusive **type** stays public with `@:noCompletion`, because a `private` type is unreachable cross-module even within `flight` and Haxe has no member-style grant for type visibility. Shared declarations such as `Vector2` remain visible. The root-package grant deliberately widens internal access to avoid generation breaks, but Haxe packages are open and this is API enforcement for ordinary consumers rather than a security boundary. Contract enforcement is guarded by `tests/generator/contract-visibility.test.ts`.

The generator emits forwarding functions and value aliases for package-barrel and SDK value re-exports. It resolves renamed cross-package exports before building `flight.Sdk`, so names such as `defaultGlBeginBitmapFill` exist in both the package facade and the SDK when upstream exports them. Forwarders reuse canonical implementations; they do not create maintained duplicate bodies. Type re-exports retain their canonical type-name identity.

Source-level `const alias = target` declarations also retain reference identity. The generator may inline a same-module constant into a Haxe parameter default, where Haxe requires a compile-time value, but it does not clone that initializer into another top-level declaration. This keeps renderer aliases, arrays, functions, and other reference values identical to their canonical target.

Facade parameters retain the public signature but do not repeat source default initializers. A forwarded `null`/omitted value reaches the canonical function, which applies the generated default once in its owning module.

## Runtime and Portability Boundary

Generated ordinary implementation code should use portable Haxe constructs. A small maintained runtime covers TypeScript semantics that need a deliberate Haxe representation, such as:

- typed arrays and byte views;
- JavaScript number and bit-operation details;
- nullish and optional behavior;
- maps, sets, weak references, and identity;
- promises and async coordination;
- structural unions and discriminants;
- object reflection and property presence;

Runtime source lives under `src/flight/_internal/` on the maintained classpath. Its underscore-prefixed package and type names, such as `flight._internal._Promise`, keep implementation details out of normal code completion. It never hides target-specific behavior behind an apparently portable implementation.

The runtime distinguishes ECMAScript `Math.fround` from Haxe's integer-oriented `Math.fround`: the JavaScript operation is one IEEE-754 binary32 round whose result is returned as the target's ordinary `Float`. Async flow also distinguishes normal fallthrough, which fulfills with JavaScript `undefined`, from an explicit `return null`. Once a function enters the async-flow trampoline, a synchronous loop containing a function return remains in that trampoline even when the loop itself has no `await`; the return must cross the loop as a flow outcome rather than an ordinary callback result.

The standard toolkit is a separate maintained layer. `WebExterns.hx` and `_internal/dom/` provide declarations for external type keys; `_HostValueLut.hx` and `_HostModuleLut.hx` provide values for ambient and external-module keys; named backend adapters and public host packages such as `hostLime` provide target capabilities. Adding a JavaScript/TypeScript semantic to `_Runtime` is not a substitute for implementing a toolkit key.

Platform adapters follow these rules:

- An obvious, small target distinction may use a local Haxe conditional.
- A maintained platform implementation lives in a named runtime type or adapter under `src/`, not inside bulk generated source.
- Generated upstream backend code remains generated wherever possible; only the primitive host access crosses the adapter seam.
- Unsupported targets return the upstream sentinel or expose an explicit compile limitation. They do not silently behave as though the capability worked.

WebGL member calls remain typed maintained endpoints. Direct constant reads use the actual JavaScript context's enum surface so wrapped contexts and browser implementations observe the same identity as the TypeScript source; non-JavaScript targets use the fixed WebGL specification values. JavaScript endpoints preserve those context values through dispatch, while native endpoints own the integer coercion required by Lime/OpenGL signatures.

TypeScript host ambient identities map mechanically to `flight._internal.dom.<SameTypeName>` from checker-resolved declaration origin, never from a type-name or prefix allowlist. The transpiler emits ordinary members as the same direct typed Haxe fields and methods on every target; a receiver recovered through Dynamic storage is cast back to its mapped host type first. It does not rewrite a known member to `_Runtime.field` or `_Runtime.callProperty` to compensate for an incomplete native toolkit declaration. Heterogeneous host unions remain Dynamic because they have no single mapped identity. Existing Canvas, DOM-root, WebGL, and WebGPU backend endpoints keep priority where they own target portability or observable host semantics.

External type identities with no generated declaration import a stable `WebExterns` key. Ambient values and non-Flight module values emit fully qualified `_HostValueLut` and `_HostModuleLut` calls. The deterministic host-toolkit manifest records every referenced key, its maintained provider, its use sites, and whether a type provider is concrete or a Dynamic compatibility stub. Generation fails before completion when a key has no provider. Dynamic declarations may remain in the toolkit while a target implementation is unfinished, but that debt cannot change the transpiler's emitted type or member expression. See [`host-toolkit-boundary.md`](host-toolkit-boundary.md).

## JavaScript and Vitest Bridge

Behavioral parity is tested by compiling Haxe to JavaScript and generating ESM modules that match upstream npm package identities:

```text
@flighthq/geometry → generated bridge → compiled flight.Geometry
@flighthq/sdk      → generated SDK bridge → granular package bridges
```

Package bridges expose their compiled Haxe module and mechanically re-export values owned by another package bridge. The SDK bridge follows the upstream SDK barrel by re-exporting the granular bridges. Per-source bridges preserve relative-module identity for upstream tests and synchronize only dependencies explicitly mocked by an adjacent `vi.mock` or `vi.doMock`, preserving genuine Vitest mock seams.

The harness mechanically redirects upstream imports to these bridges while leaving upstream test bodies and assertions unchanged. All 1,599 inventoried test files currently execute, and the harness never edits the upstream submodule.

JavaScript exposure metadata is an output concern, not part of the canonical Haxe API or generated source. The parity harness adds it at its dedicated JavaScript build boundary; ordinary Haxe consumers retain dead-code elimination.

## Traceability

The generated inventory and API reports retain:

- upstream npm package;
- upstream source path;
- upstream export name;
- generated Haxe module and name;
- normalized source fingerprint.

The lowering report accounts for every candidate declaration and diagnostic, the patch audit records semantic exceptions, and the parity report records execution per package and test-file count. Together these reports are the completeness gate and the primary debugging map between languages.
