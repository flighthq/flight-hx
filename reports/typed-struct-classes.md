# Typed Struct Class Feasibility Audit

Upstream commit: `5d24729f7360475e28a105ae0caeeaa2e1328260`

This is a construction, structural-flow, and observability census. It does not enable class emission.

| Metric | Count |
| --- | ---: |
| Eligible canonical schemas | 404 |
| Direct field accesses | 10257 |
| Declared optional fields | 402 |
| Declared required-undefined fields | 1 |
| Production object literals | 530 |
| Production object literals omitting optional fields | 86 |
| Production object literals with spread | 40 |
| Production object literals with computed keys | 0 |
| Test object literals | 1563 |
| Cross-schema transfers | 117 |
| Anonymous structural transfers | 160 |
| Dynamic ingresses | 55 |
| Production enumerations | 0 |
| Production JSON serializations | 6 |
| Production object rests | 0 |
| Production object spreads | 40 |
| Exported input signature references | 1755 |
| Exported output signature references | 451 |
| Vitest oracle observations | 57 |
| Mechanically compatible schemas | 328 |
| Schemas requiring normalization | 76 |
| Schemas requiring observability review | 59 |

Counts below are per canonical schema. Exact source locations and related schema identities are in `typed-struct-classes.json`.

| Candidate | Direct | Fields | Optional | Required undefined | Object literals | Plain | Literal spread | Computed | Optional omitted | Cross schema | Anonymous | Dynamic | Enumerate | JSON | Rest | Spread | Bridge in | Bridge out | Test literals | Oracle | Mechanical | Normalization | Observability |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :---: | --- | --- |
| `@flighthq/bitmapfont-formats:upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts#BitmapFontCharRecord` | 12 | 9 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/bitmapfont-formats:upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts#BitmapFontKerningRecord` | 3 | 3 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/bitmapfont-formats:upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts#BitmapFontPageRecord` | 5 | 2 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | yes | — | — |
| `@flighthq/bitmapfont-formats:upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts#BitmapFontRecord` | 9 | 6 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 5 | 3 | yes | — | `object-spread` |
| `@flighthq/mesh:upstream/packages/mesh/src/meshGeometry.ts#MeshGeometryOptions` | 7 | 5 | 3 | 0 | 13 | 13 | 0 | 0 | 11 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 66 | 0 | yes | — | `optional-omission` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/formatRegistry.ts#ParticleFormatCodec` | 0 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 5 | 4 | yes | — | `object-spread` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxParse.ts#LibgdxParsed` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxParse.ts#LibgdxParseOptions` | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 1 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxParse.ts#LibgdxParseResult` | 2 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxSchema.ts#LibgdxParticleDocument` | 76 | 25 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxSchema.ts#LibgdxRangeValue` | 19 | 7 | 0 | 0 | 23 | 14 | 9 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 0 | 0 | 0 | 0 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxSerialize.ts#LibgdxSerializeOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/parseParticleConfig.ts#ParseParticleConfigOptions` | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/parseParticleConfig.ts#ParticleConfigParseResult` | 0 | 3 | 0 | 0 | 12 | 12 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/particleDesignerParse.ts#ParticleDesignerParsed` | 2 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/particleDesignerParse.ts#ParticleDesignerParseOptions` | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 10 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/particleDesignerSchema.ts#ParticleDesignerDocument` | 46 | 46 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/particleDesignerSerialize.ts#ParticleDesignerSerializeOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/pixiParse.ts#PixiParsed` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/pixiParse.ts#PixiParseResult` | 2 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/serializeResult.ts#ParticleSerializeResult` | 0 | 2 | 0 | 0 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 1 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/spineParse.ts#SpineParsed` | 2 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/spineSchema.ts#SpineAlphaKeyframe` | 0 | 2 | 0 | 0 | 5 | 5 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/spineSchema.ts#SpineParticleDocument` | 0 | 24 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — | `json-serialization` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/spineSchema.ts#SpineRangeValue` | 0 | 2 | 0 | 0 | 18 | 18 | 0 | 0 | 0 | 0 | 16 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/spineSchema.ts#SpineTintKeyframe` | 0 | 2 | 0 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexParse.ts#StarlingPexParsed` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexParse.ts#StarlingPexParseOptions` | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 6 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexParse.ts#StarlingPexParseResult` | 2 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexSchema.ts#StarlingPexColor` | 30 | 4 | 0 | 0 | 8 | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexSchema.ts#StarlingPexDocument` | 79 | 38 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexSerialize.ts#StarlingPexSerializeOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unityParse.ts#UnityParsed` | 2 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unityParse.ts#UnityParseOptions` | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 24 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityAnimationCurve` | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityBurst` | 0 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityColor` | 12 | 4 | 0 | 0 | 8 | 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityColorOverLifetime` | 2 | 4 | 1 | 0 | 5 | 4 | 1 | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | no | `object-literal-spread` | `optional-omission` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityCurveKey` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityEmission` | 0 | 2 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityGradient` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityGradientAlphaKey` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityGradientColorKey` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityMinMaxValue` | 0 | 4 | 3 | 0 | 7 | 7 | 0 | 0 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | `optional-omission` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityParticleDocument` | 0 | 17 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — | `json-serialization` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityRotationOverLifetime` | 0 | 2 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityShape` | 0 | 5 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnitySizeOverLifetime` | 0 | 4 | 1 | 0 | 5 | 4 | 1 | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | no | `object-literal-spread` | `optional-omission` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySerialize.ts#UnitySerializeOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfAccessor` | 18 | 7 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 35 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfAccessorSparse` | 7 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfAnimation` | 3 | 3 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfAnimationChannel` | 6 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfAnimationSampler` | 4 | 3 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfBuffer` | 1 | 2 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 20 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfBufferView` | 13 | 4 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 31 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfDocument` | 25 | 16 | 16 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | 0 | 0 | 0 | 4 | 0 | 19 | 2 | no | `dynamic-ingress` | `json-serialization` |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfImage` | 11 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfImportOptions` | 2 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfMaterial` | 12 | 9 | 9 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 11 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfMesh` | 4 | 3 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 19 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfMorphTarget` | 6 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfNode` | 15 | 8 | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 23 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfNormalTextureInfo` | 1 | 4 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfOcclusionTextureInfo` | 1 | 4 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfPbrMetallicRoughness` | 5 | 5 | 5 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 0 | yes | — | `optional-omission` |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfPrimitive` | 19 | 5 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 20 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfSampler` | 9 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfScene` | 1 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 21 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfSkin` | 6 | 4 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfTexture` | 4 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfTextureInfo` | 2 | 3 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfTextureTransform` | 5 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Joint` | 26 | 9 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Mesh` | 9 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Vertex` | 4 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Weight` | 18 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/objSchema.ts#ObjMaterial` | 19 | 11 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/objSchema.ts#ObjMaterialLibrary` | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/shared.ts#SkinInfluence` | 5 | 2 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 6 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/threeDsSchema.ts#ThreeDsMaterial` | 8 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/threeDsSchema.ts#ThreeDsMesh` | 14 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/loadSceneOptions.ts#LoadSceneOptions` | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 0 | 11 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/resolveSceneResources.ts#ResolveSceneResourcesOptions` | 3 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/revealSceneResourcesOnResolve.ts#SceneResourceRevealOptions` | 4 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneMaterialTextureRegistry.ts#SceneMaterialTextureRegistry` | 2 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceResolver.ts#SceneResourceInFlight` | 5 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceResolver.ts#SceneResourceResolver` | 22 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceResolver.ts#SceneResourceResolverOptions` | 3 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 13 | 0 | yes | — | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceSignals.ts#SceneResourceEvent` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceSignals.ts#SceneResourceSignals` | 4 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — | — |
| `@flighthq/shape-formats:upstream/packages/shape-formats/src/shapeJson.ts#ShapeBitmapReference` | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/shape-formats:upstream/packages/shape-formats/src/shapeJson.ts#ShapeJsonFormatOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/shape-formats:upstream/packages/shape-formats/src/shapeJson.ts#ShapeJsonParseOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/signals:upstream/packages/signals/src/throttle.ts#SignalThrottleOptions` | 4 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteParse.ts#AsepriteParsed` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteArrayDocument` | 1 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | no | `anonymous-structural-transfer` | `json-serialization` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteArrayFrame` | 2 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteBaseFrame` | 1 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | yes | — | `object-spread` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteFrameTag` | 6 | 5 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteHashDocument` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | `json-serialization` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteHashFrame` | 0 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteLayer` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteMeta` | 9 | 9 | 2 | 0 | 3 | 2 | 1 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | no | `object-literal-spread` | `optional-omission` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteRect` | 0 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteSize` | 2 | 2 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSerialize.ts#AsepriteSerializeOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/cocosPlistParse.ts#CocosPlistParsed` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/cocosPlistSchema.ts#CocosPlistDocument` | 7 | 2 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/cocosPlistSchema.ts#CocosPlistFrame` | 12 | 7 | 1 | 0 | 2 | 2 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | `optional-omission` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/cocosPlistSchema.ts#CocosPlistMetadata` | 7 | 3 | 0 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/libgdxAtlasParse.ts#LibgdxAtlasParseOptions` | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/libgdxAtlasSchema.ts#LibgdxAtlasDocument` | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/libgdxAtlasSchema.ts#LibgdxAtlasPage` | 0 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/libgdxAtlasSchema.ts#LibgdxAtlasRegion` | 0 | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/spritesheetDetect.ts#SpritesheetParseOptions` | 2 | 3 | 3 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | yes | — | `optional-omission` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/starlingParse.ts#StarlingParsed` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/starlingParse.ts#StarlingParseOptions` | 2 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/starlingSchema.ts#StarlingDocument` | 3 | 2 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/starlingSchema.ts#StarlingSubTexture` | 32 | 12 | 7 | 0 | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | `optional-omission` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerParse.ts#TexturePackerParsed` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerArrayDocument` | 1 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | no | `anonymous-structural-transfer` | `json-serialization` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerArrayFrame` | 0 | 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerFrameTag` | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerHashDocument` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | `json-serialization` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerHashFrame` | 0 | 6 | 1 | 0 | 3 | 2 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | no | `object-literal-spread` | `object-spread`, `optional-omission` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerMeta` | 8 | 7 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerPivot` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerRect` | 0 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerSize` | 2 | 2 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSerialize.ts#TexturePackerSerializeOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/texture-formats:upstream/packages/texture-formats/src/byteReader.ts#ByteReader` | 28 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteArrayDocument` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 2 | yes | — | `json-serialization` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteArrayFrame` | 1 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteBaseFrame` | 0 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteFrameTag` | 0 | 5 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteHashDocument` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteHashFrame` | 0 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteMeta` | 0 | 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteRect` | 6 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteSize` | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerParse.ts#TextureAtlasPackerParseOptions` | 1 | 1 | 1 | 0 | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 1 | 0 | yes | — | `optional-omission` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerArrayDocument` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 2 | yes | — | `json-serialization` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerArrayFrame` | 1 | 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerFrameTag` | 0 | 4 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerHashDocument` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 1 | yes | — | `json-serialization` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerHashFrame` | 0 | 6 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerMeta` | 0 | 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerPivot` | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerRect` | 8 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 12 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerSize` | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 0 | yes | — | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasStarlingParse.ts#TextureAtlasStarlingParseOptions` | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/tilemap-formats:upstream/packages/tilemap-formats/src/tiledOptions.ts#TiledParseOptions` | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Aabb.ts#Aabb` | 22 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 4 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Aabb.ts#AabbLike` | 230 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 19 | 0 | 0 | 0 | 0 | 0 | 0 | 35 | 0 | 0 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/AnimationClip.ts#AnimationClip` | 8 | 2 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 4 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/App.ts#App` | 7 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/App.ts#AppLoginItem` | 0 | 4 | 0 | 0 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 3 | 1 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/App.ts#AppLoginItemLike` | 5 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 3 | 1 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Application.ts#Application` | 57 | 13 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 18 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ApplicationLoopOptions.ts#ApplicationLoopOptions` | 5 | 5 | 5 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 5 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/ApplicationWindow.ts#ApplicationWindow` | 139 | 36 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 59 | 4 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ApplicationWindow.ts#WindowBounds` | 24 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ApplicationWindow.ts#WindowOptions` | 75 | 18 | 18 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 13 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetDescriptor` | 10 | 4 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 10 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetEntry` | 19 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetGroupLoadOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLibrary` | 9 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLibraryRuntime` | 25 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLoaderAdapter` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLoadProgress` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AttractorForce.ts#AttractorForce` | 6 | 7 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioBus.ts#AudioBus` | 16 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioBus.ts#AudioBusOptions` | 4 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 5 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioBus.ts#AudioMixer` | 6 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 11 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioBus.ts#AudioMixerOptions` | 3 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioResource.ts#AudioChannel` | 40 | 8 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 15 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioResource.ts#AudioPlayOptions` | 4 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioResource.ts#AudioResource` | 17 | 1 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 8 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/AudioResource.ts#AudioResourceUrl` | 3 | 2 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 7 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Billboard.ts#Billboard` | 4 | 12 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 1 | 0 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/BinPack.ts#BinPackOptions` | 8 | 8 | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 10 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/BitmapFont.ts#BitmapFont` | 12 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 5 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/BitmapFont.ts#BitmapFontData` | 9 | 5 | 2 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 9 | 7 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/BitmapFont.ts#BitmapFontGlyphData` | 9 | 9 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/BitmapFont.ts#BitmapFontKerningData` | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/BitmapFont.ts#BitmapFontParseOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 24 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/BitmapText.ts#BitmapTextOptions` | 12 | 6 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 23 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/BoundingSphere.ts#BoundingSphere` | 150 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 23 | 2 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Camera.ts#Camera` | 37 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 38 | 1 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Camera.ts#OrthographicProjection` | 6 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Camera.ts#PerspectiveProjection` | 7 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Camera2D.ts#Camera2D` | 17 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Camera2D.ts#Camera2DFollowOptions` | 4 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 5 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Camera2D.ts#Camera2DOptions` | 4 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 14 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Capsule.ts#Capsule` | 45 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 6 | 1 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/CircleCollider.ts#CircleCollider` | 17 | 7 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Clipboard.ts#ClipboardBookmark` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Clipboard.ts#ClipboardWriteItem` | 5 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ClipboardWatch.ts#ClipboardWatch` | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ColorTransform.ts#ColorTransform` | 215 | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 0 | 0 | 0 | 0 | 30 | 3 | 15 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Connectivity.ts#Connectivity` | 5 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Connectivity.ts#ConnectivityReachability` | 8 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Connectivity.ts#ConnectivityReachabilityOptions` | 4 | 3 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Connectivity.ts#ConnectivityStatus` | 50 | 8 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 2 | 2 | 5 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/CubeTexture.ts#CubeTexture` | 28 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 9 | 2 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Device.ts#DeviceInfo` | 50 | 25 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Device.ts#SafeAreaInsets` | 16 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/DeviceCapabilities.ts#DeviceCapabilities` | 6 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/DeviceDisplayMetrics.ts#DeviceDisplayMetrics` | 14 | 7 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#FileDialogFilter` | 12 | 3 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#FileDialogHandle` | 12 | 3 | 0 | 0 | 7 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 3 | 15 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#MessageDialogOptions` | 28 | 10 | 9 | 0 | 4 | 1 | 3 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 5 | 0 | 16 | 0 | no | `object-literal-spread` | `object-spread`, `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#MessageDialogResult` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#OpenDirectoryDialogOptions` | 7 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 6 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#OpenFileDialogOptions` | 19 | 7 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 9 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#PromptDialogOptions` | 6 | 5 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 6 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#SaveFileDialogOptions` | 13 | 6 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 8 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/DragForce.ts#DragForce` | 3 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileEntry` | 2 | 3 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 4 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FilePermissions` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 4 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileStat` | 0 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileSystemUsage` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileWalkOptions` | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileWatchEvent` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FilmicToneMapOptions.ts#FilmicToneMapOptions` | 6 | 6 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Font.ts#Font` | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Font.ts#FontUrl` | 0 | 2 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 8 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/FontMetrics.ts#FontMetrics` | 17 | 8 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 3 | 3 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/FontResource.ts#FontResource` | 9 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Frustum.ts#Frustum` | 24 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 7 | 1 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Geolocation.ts#GeolocationRequestOptions` | 3 | 3 | 3 | 0 | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | 7 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/Geolocation.ts#GeoPosition` | 0 | 9 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Geolocation.ts#GeoPositionResult` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlas` | 6 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlasOptions` | 7 | 6 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 21 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlasRuntime` | 72 | 15 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlasShelf` | 6 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphEntry` | 39 | 8 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 6 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphMetrics` | 11 | 3 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 5 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphRasterizedBitmap` | 17 | 6 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphRasterizeOptions` | 8 | 4 | 2 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphSource` | 0 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/GridSliceOptions.ts#GridSliceOptions` | 2 | 12 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 7 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Haptics.ts#HapticsCapabilities` | 10 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/HasBoundsRectangle.ts#HasBoundsRectangleRuntime` | 14 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 5 | 0 | 0 | 0 | 0 | 0 | 4 | 2 | 0 | 0 | no | `anonymous-structural-transfer`, `cross-schema-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/HasTransform2D.ts#HasTransform2D` | 81 | 9 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 31 | 18 | 0 | 0 | 0 | 0 | 32 | 0 | 0 | 0 | no | `anonymous-structural-transfer`, `dynamic-ingress` | — |
| `@flighthq/types:upstream/packages/types/src/HasTransform2D.ts#HasTransform2DRuntime` | 27 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 5 | 0 | 0 | 0 | 0 | 0 | 4 | 2 | 0 | 0 | no | `anonymous-structural-transfer`, `cross-schema-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/HasTransform3D.ts#HasTransform3D` | 15 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 30 | 1 | 0 | 0 | 0 | 0 | 0 | 13 | 0 | 2 | 0 | no | `anonymous-structural-transfer`, `cross-schema-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/HasTransform3D.ts#HasTransform3DRuntime` | 24 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 0 | 0 | 0 | 0 | 0 | 1 | 5 | 1 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/ImageResource.ts#ImageResource` | 159 | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 36 | 6 | 2 | 0 | 0 | 0 | 0 | 34 | 12 | 40 | 1 | no | `anonymous-structural-transfer`, `cross-schema-transfer`, `dynamic-ingress` | `strict-equality` |
| `@flighthq/types:upstream/packages/types/src/ImageResourceCompressed.ts#ImageResourceCompressed` | 4 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/InputGamepadData.ts#InputGamepadAxisData` | 7 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/InputGamepadData.ts#InputGamepadButtonData` | 8 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/InputGamepadData.ts#InputGamepadConnectData` | 10 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/InputTextData.ts#InputTextData` | 5 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/InteractionManager.ts#InteractionPointerOptions` | 12 | 7 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 0 | 0 | 0 | 0 | 6 | 0 | 11 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcBackendCapabilities` | 0 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcChannel` | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcMessageEvent` | 2 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcTarget` | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/IpcSignals.ts#IpcSignals` | 3 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Lifecycle.ts#AppLifecycle` | 8 | 7 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Matrix.ts#Matrix` | 704 | 6 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 1 | 3 | 0 | 0 | 0 | 0 | 83 | 9 | 6 | 2 | no | `anonymous-structural-transfer`, `dynamic-ingress` | `strict-equality` |
| `@flighthq/types:upstream/packages/types/src/Matrix3.ts#Matrix3` | 49 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 40 | 4 | 3 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Matrix4.ts#Matrix4` | 115 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 87 | 9 | 4 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/MediaSession.ts#MediaSessionActionDetails` | 0 | 4 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/MediaSession.ts#MediaSessionArtwork` | 0 | 3 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/MediaSession.ts#MediaSessionMetadata` | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/MediaSession.ts#MediaSessionPositionState` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Menu.ts#MenuItemTemplate` | 81 | 8 | 8 | 0 | 43 | 41 | 2 | 0 | 41 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 7 | 8 | 22 | 1 | no | `object-literal-spread` | `object-spread`, `optional-omission`, `strict-equality` |
| `@flighthq/types:upstream/packages/types/src/MenuSignals.ts#MenuSignals` | 5 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Mesh.ts#Mesh` | 61 | 13 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 9 | 0 | 0 | 0 | 0 | 8 | 2 | 0 | 0 | no | `cross-schema-transfer`, `dynamic-ingress` | — |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#MeshGeometry` | 221 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 57 | 23 | 0 | 1 | no | `anonymous-structural-transfer` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#MeshSubset` | 23 | 2 | 0 | 0 | 11 | 11 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#VertexAttribute` | 32 | 3 | 0 | 0 | 18 | 18 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 59 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#VertexAttributeLayout` | 53 | 2 | 0 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 25 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/NodeSignals.ts#NodeSignals` | 14 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#NotificationAction` | 5 | 3 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#NotificationCapabilities` | 0 | 7 | 0 | 0 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 1 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#NotificationChannel` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#NotificationRequest` | 52 | 16 | 15 | 0 | 4 | 0 | 4 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 4 | 3 | 2 | 22 | 0 | no | `anonymous-structural-transfer`, `object-literal-spread` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#NotificationSchedule` | 7 | 2 | 1 | 0 | 2 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 1 | 0 | 9 | 0 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#ScheduledNotification` | 0 | 3 | 0 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Obb.ts#Obb` | 64 | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 8 | 1 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/ParsedAccelerator.ts#ParsedAccelerator` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 3 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleConfigIssue.ts#ParticleConfigIssue` | 0 | 3 | 0 | 0 | 10 | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleCurve.ts#ColorKeyframe` | 22 | 4 | 0 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 11 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleCurve.ts#CurveKeyframe` | 11 | 2 | 0 | 0 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 19 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitter.ts#ParticleEmitter` | 54 | 19 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 3 | 0 | 0 | 0 | 0 | 25 | 2 | 0 | 0 | no | `anonymous-structural-transfer`, `dynamic-ingress` | — |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitter.ts#ParticleEmitterData` | 405 | 9 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitter.ts#ParticleEmitterRuntime` | 6 | 34 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitterConfig.ts#ParticleEmitterConfig` | 705 | 52 | 0 | 0 | 2 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 26 | 9 | 0 | 0 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitterSignals.ts#ParticleEmitterSignals` | 6 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitterState.ts#ParticleEmitterState` | 236 | 13 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 13 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleObjectsState.ts#ParticleObjectsState` | 36 | 10 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ParticleObjectsUpdateOptions.ts#ParticleObjectsUpdateOptions` | 4 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/PathBooleanOptions.ts#PathBooleanOptions` | 7 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 0 | 9 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/PathOffsetOptions.ts#PathOffsetOptions` | 5 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 15 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Plane.ts#Plane` | 97 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 14 | 2 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/PlaneCollider.ts#PlaneCollider` | 10 | 7 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Platform.ts#PlatformInfo` | 37 | 14 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 4 | 1 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Power.ts#Power` | 37 | 10 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Power.ts#PowerStatus` | 21 | 8 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/PowerBatteryHealth.ts#PowerBatteryHealth` | 0 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Protocol.ts#ParsedProtocolUrl` | 0 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Protocol.ts#ProtocolHandler` | 2 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Quaternion.ts#Quaternion` | 216 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 34 | 4 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Ray3D.ts#Ray3D` | 85 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 16 | 1 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/RectangleCollider.ts#RectangleCollider` | 9 | 8 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/RenderCacheRefreshOptions.ts#RenderCacheRefreshOptions` | 9 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | 11 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ResourceLoader.ts#ResourceLoader` | 20 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 12 | 1 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/ResourceLoaderItemSignals.ts#ResourceLoaderItemSignals` | 8 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ResourceLoaderOptions.ts#ResourceLoaderOptions` | 12 | 10 | 10 | 0 | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 26 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/ResourceLoadHandle.ts#ResourceLoadHandle` | 2 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ResourceLoadItem.ts#ResourceLoadItem` | 11 | 9 | 8 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/ResourceLoadReport.ts#ResourceLoadReport` | 3 | 6 | 0 | 1 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sampler.ts#Sampler` | 51 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 9 | 6 | 1 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Scene.ts#Scene` | 14 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 19 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Scene.ts#SceneRuntime` | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SceneAnimationTarget.ts#SceneAnimationTarget` | 6 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | no | `dynamic-ingress` | — |
| `@flighthq/types:upstream/packages/types/src/SceneNode.ts#SceneNodeTraits` | 11 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 8 | 16 | 0 | 0 | 0 | 0 | 36 | 8 | 0 | 0 | no | `anonymous-structural-transfer`, `cross-schema-transfer`, `dynamic-ingress` | — |
| `@flighthq/types:upstream/packages/types/src/SceneResourceRef.ts#EmbeddedSceneResourceRef` | 2 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SceneResourceRef.ts#ExternalSceneResourceRef` | 2 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Screen.ts#ScreenInfo` | 225 | 25 | 0 | 0 | 7 | 4 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 15 | 8 | 2 | 3 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/ScreenChangeEvent.ts#ScreenChangedMetrics` | 0 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/ScreenChangeEvent.ts#ScreenChangeEvent` | 4 | 3 | 0 | 0 | 6 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ScreenMode.ts#ScreenMode` | 10 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 3 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ScreenSignals.ts#ScreenSignals` | 3 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#AmbientLightReading` | 3 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#MotionReading` | 38 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#OrientationReading` | 49 | 8 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#PressureReading` | 0 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#ProximityReading` | 0 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#QuaternionReading` | 32 | 7 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#RotationRateReading` | 5 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#SensorReading` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#Sensors` | 11 | 11 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#SensorSubscribeOptions` | 8 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Share.ts#ShareContent` | 26 | 4 | 4 | 0 | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 36 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/Share.ts#ShareOptions` | 2 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 4 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Share.ts#ShareResult` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ShareSignals.ts#ShareSignals` | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Shell.ts#ShellOpenExternalOptions` | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Shell.ts#ShellOpenPathOptions` | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Shell.ts#ShellShortcutLink` | 7 | 7 | 6 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 4 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ShortcutEvent.ts#ShortcutEvent` | 0 | 1 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/ShortcutSignals.ts#ShortcutSignals` | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Signal.ts#Signal` | 40 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 10 | 2 | 2 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Signal.ts#SignalData` | 30 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Spatial.ts#SpatialAabb` | 34 | 4 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | 33 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SphereCollider.ts#SphereCollider` | 22 | 8 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Spritesheet.ts#Spritesheet` | 8 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 8 | 5 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetAnimation.ts#SpritesheetAnimation` | 20 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 5 | 3 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetAnimationData.ts#SpritesheetAnimationData` | 38 | 8 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetData.ts#SpritesheetData` | 33 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 7 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetFrame.ts#SpritesheetFrame` | 12 | 6 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 3 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetFrameData.ts#SpritesheetFrameData` | 102 | 12 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetPlayer.ts#SpritesheetPlayer` | 65 | 9 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 14 | 3 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetValidationDiagnostic.ts#SpritesheetValidationDiagnostic` | 0 | 4 | 0 | 0 | 6 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/StatusBar.ts#StatusBar` | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/StatusBar.ts#StatusBarInfo` | 11 | 5 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 2 | 2 | 1 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/StatusBar.ts#StatusBarStyleEntry` | 10 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 8 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageChange` | 0 | 3 | 0 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageMigration` | 4 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageNamespace` | 6 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageQuota` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageSignals` | 2 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Surface.ts#Surface` | 433 | 9 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 0 | 0 | 0 | 0 | 0 | 24 | 12 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/TextMetrics.ts#TextMetrics` | 6 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Texture.ts#Texture` | 170 | 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 33 | 4 | 21 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/TextureAtlas.ts#TextureAtlas` | 121 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 17 | 17 | 38 | 4 | no | `anonymous-structural-transfer` | `strict-equality` |
| `@flighthq/types:upstream/packages/types/src/TextureAtlasRegion.ts#TextureAtlasRegion` | 258 | 14 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 3 | 5 | 39 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/TextureUvTransform.ts#TextureUvTransform` | 10 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | no | `cross-schema-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Tileset.ts#Tileset` | 14 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 4 | 7 | 14 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Tray.ts#TrayBalloonOptions` | 7 | 7 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 5 | 1 | yes | — | `strict-equality` |
| `@flighthq/types:upstream/packages/types/src/Tray.ts#TrayCapabilities` | 0 | 6 | 0 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | yes | — | `enumeration` |
| `@flighthq/types:upstream/packages/types/src/Tray.ts#TrayEventData` | 0 | 10 | 0 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Tray.ts#TrayIcon` | 15 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 16 | 2 | 11 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Tray.ts#TrayIconOptions` | 12 | 4 | 4 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 14 | 0 | yes | — | `optional-omission` |
| `@flighthq/types:upstream/packages/types/src/TurbulenceForce.ts#TurbulenceForce` | 4 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/TweenManager.ts#TweenManager` | 16 | 3 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 19 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#AppUpdater` | 10 | 10 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdateInfo` | 1 | 9 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 5 | 4 | yes | — | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdateProgress` | 0 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdaterConfig` | 1 | 3 | 0 | 0 | 3 | 2 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 2 | 6 | 2 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdaterError` | 0 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdaterSignatureConfig` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdaterState` | 0 | 4 | 0 | 0 | 8 | 1 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 0 | 2 | 0 | 0 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Vector2.ts#Vector2` | 322 | 2 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 9 | 0 | 0 | 0 | 0 | 0 | 126 | 11 | 42 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/Vector3.ts#Vector3` | 1140 | 3 | 0 | 0 | 8 | 8 | 0 | 0 | 0 | 0 | 4 | 0 | 0 | 0 | 0 | 0 | 162 | 8 | 58 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/VideoResource.ts#VideoChannel` | 44 | 8 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 11 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/VideoResource.ts#VideoPlayOptions` | 4 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/VideoResource.ts#VideoResource` | 33 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 11 | 5 | 6 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/VideoResource.ts#VideoResourceLoadOptions` | 8 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 0 | 3 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/VideoResource.ts#VideoResourceUrl` | 3 | 2 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 1 | 6 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/VideoTexture.ts#VideoTexture` | 37 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 15 | 2 | 0 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/VortexForce.ts#VortexForce` | 9 | 10 | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Webcam.ts#WebcamCaptureOptions` | 2 | 4 | 4 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 | 7 | 2 | no | `object-literal-spread` | `object-spread` |
| `@flighthq/types:upstream/packages/types/src/Webcam.ts#WebcamPhoto` | 0 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/Webcam.ts#WebcamVideo` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — | — |
| `@flighthq/types:upstream/packages/types/src/WebcamStream.ts#WebcamStream` | 0 | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0 | no | `anonymous-structural-transfer` | — |
| `@flighthq/types:upstream/packages/types/src/WindForce.ts#WindForce` | 3 | 4 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 0 | 2 | 0 | yes | — | — |
| `@flighthq/xml:upstream/packages/xml/src/xmlParse.ts#XmlElement` | 41 | 4 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 3 | 0 | 0 | yes | — | — |
