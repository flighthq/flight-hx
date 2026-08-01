# U1 Item 5: General `for...in` Lowering

Status: implemented for upstream `c61de179af8a12c2fa3b9b7d5389ee302f577a0d` without beginning artifact regeneration or package validation.

## Lowering rule

The statement IR now represents `for...in` independently from iterable `for...of`. A checker-proven receiver with a string index signature uses `DynamicObject.keys`, the maintained typed record endpoint. Proof is conservative: `any`, `unknown`, type parameters, and unions or intersections without a string index on every constituent remain unproven.

All unproven receivers use `_Runtime.forInKeys`. On JavaScript this helper executes a native `for...in` and materializes its keys before Haxe iteration, preserving ECMAScript integer-key ordering, string insertion order, and inherited enumerable properties. Portable targets use `Reflect.fields` as the existing dynamic-object convention.

The one production occurrence, `scene3d-wgpu/src/customShaderWgpuMeshMaterialRenderer.ts`, has a `Record<string, Texture>` receiver and therefore takes the direct record path. Its existing own-property check remains intact.

## Control flow and failures

Synchronous and async-flow emission both evaluate the receiver once. Async loop bodies iterate the captured key array through `_Async.repeatFlow`, so `await`, `break`, `continue`, and return propagation follow the same flow protocol as `for...of`.

Only a single identifier declared by the loop initializer is admitted. Assignment initializers, multiple declarations, and binding patterns fail with an `Unsupported TypeScript for-in initializer` diagnostic rather than silently changing binding behavior.

Focused coverage asserts direct emission for a typed record, runtime emission for `any`, async-flow runtime emission, and the unsupported initializer diagnostic.
