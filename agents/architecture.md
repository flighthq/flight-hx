# Architecture

## Objective

`flight-hx` automatically ports the Flight TypeScript SDK in `upstream/` into working Haxe source. The repository is a compiler-like translation system, not a manually maintained second implementation.

The output must be reproducible from the same inputs:

```text
upstream revision
  + generator revision
  + configuration
  + templates
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

The public namespace is the flat Haxe package `flight`. The Haxelib project name is also `flight`.

Each upstream npm package maps to a PascalCase Haxe module directly under `flight`:

```text
@flighthq/sdk       → flight.Sdk
@flighthq/types     → flight.Types
@flighthq/geometry  → flight.Geometry
@flighthq/render-gl → flight.RenderGl
@flighthq/host-tauri → flight.HostTauri
```

Kebab-case conversion is deterministic. Acronym or collision exceptions belong in configuration and appear in the generated name map.

Broad consumers use:

```haxe
import flight.Sdk.*;
import flight.Types.Vector2;

final value:Vector2 = createVector2(10, 20);
normalizeVector2(value, value);
```

Package-oriented consumers use:

```haxe
import flight.Geometry.*;
import flight.Types.Vector2;

final value:Vector2 = createVector2();
```

Haxe wildcard imports on a class expose its static fields, which makes the free-function facade work. They do not import secondary typedefs from the module. Types therefore use explicit module-qualified imports such as `import flight.Types.Vector2`, or remain inferred at call sites. This is a compiler-enforced Haxe constraint rather than an additional public ownership layer.

Qualified module access remains available where Haxe permits it:

```haxe
final value = Sdk.createVector2();
```

There is no public second-level package such as `flight.geometry.Geometry`, and there is no public per-type ownership layer. Internal emitter modules may be deeper when required for compiler scalability or cyclic initialization, but they are not documented import paths.

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

Canonical shared type declarations follow upstream ownership:

```text
@flighthq/types → flight.Types
```

Haxe secondary types occupy the package-level type namespace even though their import path includes the declaring module. Consequently, `flight.Types.Vector2` and a proposed `flight.Geometry.Vector2` alias both define `flight.Vector2` and collide. Package and SDK modules therefore cannot redeclare type aliases in the same flat `flight` package.

Conceptually:

```haxe
// flight/Types.hx
typedef Vector2 = {
  var x:Float;
  var y:Float;
}

// flight/Geometry.hx
function createVector2(?x:Float, ?y:Float):Vector2 {
  // generated implementation
}

// generated static field on flight.Sdk
function createVector2(?x:Float, ?y:Float):Vector2 {
  return forwardedGeometryCreateVector2(x, y);
}
```

Package signatures import and reference the canonical declaration. Consumers explicitly import types from their canonical module (`import flight.Types.Vector2`) or rely on type inference. The API manifest still records package and SDK type re-exports, but Haxe emission does not create colliding duplicate declarations. Do not infer a new canonical home from `create<Type>` or redistribute upstream types by hand.

## Package and SDK Facades

Package modules are the granular public surface. `flight.Sdk` mirrors the upstream `@flighthq/sdk` policy rather than blindly aggregating every package. Host and tooling packages excluded upstream remain excluded from `flight.Sdk`.

The generator emits forwarding functions and value aliases for package-barrel and SDK value re-exports. It resolves renamed cross-package exports before building `flight.Sdk`, so names such as `defaultGlBeginBitmapFill` exist in both the granular public module and the SDK when upstream exports them. Forwarders reuse canonical implementations; they do not create maintained duplicate bodies. Type re-exports remain manifest-only where Haxe's flat secondary-type namespace would collide.

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

Runtime source lives under `templates/runtime/` and is copied or rendered into the generated classpath. It never hides target-specific behavior behind an apparently portable implementation.

Platform adapters follow these rules:

- An obvious, small target distinction may use a local Haxe conditional.
- A maintained platform implementation lives in a named runtime template or adapter, not inside bulk generated source.
- Generated upstream backend code remains generated wherever possible; only the primitive host access crosses the adapter seam.
- Unsupported targets return the upstream sentinel or expose an explicit compile limitation. They do not silently behave as though the capability worked.

## JavaScript and Vitest Bridge

Behavioral parity is tested by compiling Haxe to JavaScript and generating ESM modules that match upstream npm package identities:

```text
@flighthq/geometry → generated bridge → compiled flight.Geometry
@flighthq/sdk      → generated SDK bridge → granular package bridges
```

Package bridges expose their compiled Haxe module and mechanically re-export values owned by another package bridge. The SDK bridge follows the upstream SDK barrel by re-exporting the granular bridges. Per-source bridges preserve relative-module identity for upstream tests and synchronize only dependencies explicitly mocked by an adjacent `vi.mock` or `vi.doMock`, preserving genuine Vitest mock seams.

The harness mechanically redirects upstream imports to these bridges while leaving upstream test bodies and assertions unchanged. All 1,166 inventoried test files currently execute, and the harness never edits the upstream submodule.

JavaScript exposure metadata is an output concern, not the canonical Haxe API. Avoid keeping all generated fields alive merely to simplify the bridge; preserve dead-code elimination for ordinary Haxe consumers.

## Traceability

The generated inventory and API reports retain:

- upstream npm package;
- upstream source path;
- upstream export name;
- generated Haxe module and name;
- normalized source fingerprint.

The lowering report accounts for every candidate declaration and diagnostic, the patch audit records semantic exceptions, and the parity report records execution per package and test-file count. Together these reports are the completeness gate and the primary debugging map between languages.
