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

The Haxelib project is `flight`; its Haxe namespace is `flighthq`. Generated ownership follows a mechanical two-part rule:

```text
@flighthq/<npm-package>/<defining-file>.ts
→ flighthq.<lowerCamelPackage>.<PascalCaseFile>
```

Examples:

```text
@flighthq/geometry/src/vector2.ts   → flighthq.geometry.Vector2
@flighthq/render-gl/src/glShader.ts → flighthq.renderGl.GlShader
@flighthq/types/src/Vector2.ts      → flighthq.types.Vector2
```

The original defining file remains canonical through re-exports. Package `index.ts` files do not produce `Index`; each package instead has a PascalCase facade such as `flighthq.geometry.Geometry`, `flighthq.renderGl.RenderGl`, or `flighthq.sdk.Sdk`. Files named `internal.ts` and test helpers are absent from the public namespace and compile under an underscore-hidden implementation package when the parity harness needs them.

Broad consumers use `import flighthq.sdk.Sdk.*`. Package consumers may use `import flighthq.geometry.Geometry.*`, while more focused consumers import the defining module directly, such as `import flighthq.geometry.Vector2.*`.

The mapping has no semantic bucket list. Invalid module names, duplicate mapped paths, and Haxe package-level type collisions fail generation with every conflicting upstream source. Fix those collisions by reorganizing upstream TypeScript; do not add Haxe-only naming exceptions.

## Functions and Data

Flight's globally unique free-function names are a deliberate cross-language API feature.

- Exported names remain unchanged unless Haxe syntax makes that impossible.
- Free functions remain module-level functions.
- `createVector2`, `getVector2Length`, and `setVector2FromPolar` keep those names.
- `create*`, `clone*`, and `acquire*` retain their allocation meaning.
- `out` parameters remain explicit and retain upstream aliasing behavior.
- Expected failures retain upstream sentinel behavior.

Haxe classes may represent nominal entities or target-specific storage, but they do not become the public behavioral API. Constructors may be private or otherwise internal while `create<Type>` remains public. Structural `*Like` values should remain structural where Haxe can represent them portably.

## Type Placement

Canonical shared declarations remain in their defining `@flighthq/types` file. A main type uses the module path directly (`flighthq.types.Vector2`); additional declarations use ordinary Haxe secondary-type paths (`flighthq.types.Vector2.Vector2Like`). Re-exporting packages reference that canonical declaration and do not duplicate it.

When a source file contains a same-named structural type and runtime values, the public type module remains canonical and values compile in an underscore-hidden companion used by the package facade. Haxe also makes every secondary type occupy its package-level type namespace, so a file module named `ElectronApp` cannot coexist with an `ElectronApp` secondary type declared by another file in that npm package. The generator diagnoses this as upstream organization work.

## Package and SDK Facades

Defining-file modules are the granular public surface. Package facades and `flighthq.sdk.Sdk` mirror upstream barrels rather than blindly aggregating every package. Host and tooling packages excluded upstream remain excluded from the SDK facade.

The generator emits forwarding functions and value aliases for package-barrel and SDK value re-exports. It resolves renamed cross-package exports before building `flighthq.sdk.Sdk`, so names such as `defaultGlBeginBitmapFill` exist in both the granular public module and the SDK when upstream exports them. Forwarders reuse canonical implementations; they do not create maintained duplicate bodies. Type re-exports retain their original defining-module identity.

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
- platform globals.

Runtime source lives under `src/flighthq/_internal/` on the maintained classpath. Its underscore-prefixed package and type names, such as `flighthq._internal._Promise`, keep implementation details out of normal code completion. It never hides target-specific behavior behind an apparently portable implementation.

Platform adapters follow these rules:

- An obvious, small target distinction may use a local Haxe conditional.
- A maintained platform implementation lives in a named runtime type or adapter under `src/`, not inside bulk generated source.
- Generated upstream backend code remains generated wherever possible; only the primitive host access crosses the adapter seam.
- Unsupported targets return the upstream sentinel or expose an explicit compile limitation. They do not silently behave as though the capability worked.

## JavaScript and Vitest Bridge

Behavioral parity is tested by compiling Haxe to JavaScript and generating ESM modules that match upstream npm package identities:

```text
@flighthq/geometry → generated bridge → compiled flighthq.geometry.Geometry
@flighthq/sdk      → generated SDK bridge → granular package bridges
```

Package bridges expose their compiled Haxe module and mechanically re-export values owned by another package bridge. The SDK bridge follows the upstream SDK barrel by re-exporting the granular bridges. Per-source bridges preserve relative-module identity for upstream tests and synchronize only dependencies explicitly mocked by an adjacent `vi.mock` or `vi.doMock`, preserving genuine Vitest mock seams.

The harness mechanically redirects upstream imports to these bridges while leaving upstream test bodies and assertions unchanged. All 1,166 inventoried test files currently execute, and the harness never edits the upstream submodule.

JavaScript exposure metadata is an output concern, not part of the canonical Haxe API or generated source. The parity harness adds it at its dedicated JavaScript build boundary; ordinary Haxe consumers retain dead-code elimination.

## Traceability

The generated inventory and API reports retain:

- upstream npm package;
- upstream source path;
- upstream export name;
- generated Haxe module and name;
- normalized source fingerprint.

The lowering report accounts for every candidate declaration and diagnostic, the patch audit records semantic exceptions, and the parity report records execution per package and test-file count. Together these reports are the completeness gate and the primary debugging map between languages.
