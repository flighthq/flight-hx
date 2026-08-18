# Strict Haxe and Rust-Readiness TODO

Status: active. The first implementation slice generalizes closed mapped-alias materialization, followed by escape-free typed-struct direct emission. Transpiler work and maintained host-toolkit work remain separate.

## Baseline

- 1,536 public schemas are semantically eligible for typed structural lowering.
- 408 schemas currently emit direct fields, covering 14,471 accesses.
- 1,128 eligible schemas remain audit-only, covering 16,195 pending accesses.
- 871 audit-only schemas have no recorded escape, covering 11,441 pending accesses.
- Direct schemas retain 455 operation-local reflective survivors: 197 incompatible-union, 90 unknown-member, 70 width-sensitive, 41 dynamic-enumeration, 40 computed-key, 12 receiver-sensitive-method, and five presence-sensitive accesses.
- Generated Haxe contains 346 `_Partial`, 24 `_Pick`, 197 `_Omit`, 191 `_IndexedAccess`, ten `_Conditional`, and 618 `_Record` instantiations. These are occurrence counts, not claims that every instantiation is safely materializable.
- The maintained host toolkit exposes 218 `dynamic-stub` type entries across 10,963 generated type uses.
- The cpp provenance audit has 551 closed nominal-identity candidates; only `Camera2D` and `ParticleEmitterState` are enabled.
- Generated `Dynamic` occurrences fell from 49,168 to 47,009 across checker-derived typed-struct assignments and the reviewed escape-free tranches.

## 1. Closed mapped aliases

- [x] Replace the special-case concrete `EntityWithoutRuntime<T>` lowering with a checker-derived rule for non-generic closed mapped aliases.
- [x] Materialize concrete `Partial<T>`, `Pick<T, K>`, and `Omit<T, K>` aliases with checker-resolved fields, declaration order, optionality, and field types.
- [x] Cover `ViewportLike`, `FocusNavigationInput`, `InteractionInputSource`, and `ApplicationRenderViewTargetOptions` in generated-output assertions.
- [x] Retain generic utilities such as `EntityWithoutRuntime<T>`, `Partial<T>`, `Pick<T, K>`, and `Omit<T, K>` symbolically.
- [x] Reject open index signatures, callable/constructable objects, unresolved fields, standard-library-only fields, and recursively unrepresentable shapes rather than emitting a misleading closed record.
- [ ] Model `TextureLike` separately as its checker-resolved union of texture variants; do not flatten it into one record.
- [x] Add positive, generic-negative, open-record-negative, shadowed-utility-negative, ordering, optionality, and generation-drift tests.

## 2. Escape-free direct typed structs

- [x] Add an explicit reviewed-addition mechanism for checker-discovered audit-only identities; do not rewrite the historical migration baseline or silently enable newly discovered rows.
- [x] Enable `BitmapRegion` first: 674 accesses, no escapes, mechanically compatible, and nominal-provenance closed.
- [x] Verify that bitmap modules use direct `BitmapRegion` fields and retain all aliasing/out-parameter behavior.
- [x] Cast direct typed-struct writes to the checker-derived field type rather than routing known values through `Dynamic`.
- [x] Promote `GlRenderStateRuntime` and `WgpuRenderStateRuntime`: 1,274 accesses now emit directly while their shared-base cross-schema transfers correctly keep cpp nominalization disabled.
- [x] Promote the Canvas, WebGL, portable, descriptor, and WebGPU render-target family: 707 accesses now emit directly while structural-transfer and optional-omission evidence correctly keeps cpp nominalization disabled.
- [ ] Review the next zero-escape hot rows, including text layout, rich text, physics world/contact records, and clip regions.
- [x] Require an exact report delta, generated Haxe review, Haxe namespace compile, upstream affected-package tests, and the portable target matrix for every tranche.

## 3. Typed union projection

- [ ] Preserve checker-known union alternatives through declaration and expression lowering.
- [ ] Emit direct access to common fields only when every non-null alternative owns a compatible field.
- [ ] Begin with embedded/external image-resource references, which account for 112 of the 197 incompatible-union survivors.
- [ ] Represent discriminated alternatives as typed Haxe unions and Rust enums; do not recover them through `Dynamic` casts.
- [ ] Keep variant-specific fields behind explicit narrowing and retain operation-local runtime checks where TypeScript performs dynamic discrimination.

## 4. Remaining structural escapes

- [ ] Resolve unknown-member ownership where the checker proves an inherited/intersection member without weakening width safety.
- [ ] Design structural capability projections for `HasBoundsRectangleRuntime`, `HasTransform2DRuntime`, and `HasTransform3DRuntime` rather than copying wider values.
- [ ] Keep dynamic enumeration, computed keys, receiver-sensitive methods, and presence checks operation-local unless a typed collection or capability API preserves their semantics.
- [ ] Keep open `Record<K, V>` values as typed dictionaries and map them to Rust `HashMap`, not closed anonymous records.
- [ ] Treat explicit upstream `any` and `unknown` as boundary debt requiring upstream typing or validation adapters, not guessed transpiler types.

## 5. Maintained host toolkit

- [ ] Replace `dynamic-stub` host declarations independently of generator lowering; generated code must keep the same checker-derived host identity and LUT key.
- [ ] Prioritize high-use providers: `WebGL2RenderingContext`, `CanvasRenderingContext2D`, `HTMLCanvasElement`, `GPUDevice`, and the WebGL/WebGPU handle families.
- [ ] Give each provider a typed Haxe declaration plus target implementation or explicit unsupported adapter behavior.
- [ ] Keep host values and factories in `_HostValueLut`, `_HostModuleLut`, named backends, and host packages such as `hostLime`; do not move them into `_Runtime`.
- [ ] Track the `dynamic-stub` count and fail generation when a referenced toolkit key has no provider.

## 6. Native and Rust representations

- [ ] Review provenance-closed cpp candidates as measured slices; never bulk-enable all 551 candidates.
- [ ] Consider `BitmapRegion` for a cpp `@:structInit` class only after direct Haxe emission and bridge/alias tests pass.
- [ ] Preserve structural public APIs where callers may supply anonymous records; use nominal storage only when construction identity and aliasing are closed.
- [ ] Map closed records to Rust structs, discriminated unions to enums, open records to maps, optional mapped aliases to dedicated patch/input structs, and host identities to toolkit traits or handles.
- [ ] Make the Rust emitter consume retained IR types and LUT identities rather than rediscovering types from generated Haxe or accepting `Dynamic` as a compatibility shortcut.

## Completion gates

- [ ] `npm run fix`
- [ ] focused generator tests for every lowering rule and negative boundary
- [ ] `npm run generate:check`
- [ ] `npm run check`
- [ ] `npm run test:haxe:all`
- [ ] affected upstream package parity tests
- [ ] `npm run test:portable`
- [ ] exact report and generated-output census recorded in [`status.md`](status.md)
