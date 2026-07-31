# Typed Struct Provenance Audit

Upstream commit: `5d24729f7360475e28a105ae0caeeaa2e1328260`

This reporting-only audit tests nominal-identity closure for the clean required-field set. It does not enable class emission. Bridge exposure is reported separately and is not itself a closure blocker.

| Metric | Count |
| --- | ---: |
| Clean required-field candidates | 199 |
| Nominally closed candidates | 137 |
| Blocked candidates | 62 |
| Normalization-provenance blockers only | 36 |
| Container-transfer blockers only | 22 |
| Both blocker classes | 4 |
| Normalization roots (all eligible schemas) | 82 |
| JSON.parse roots | 9 |
| Containment edges (all eligible schemas) | 418 |
| Candidates blocked by normalization provenance | 40 |
| Candidates blocked by container transfers | 26 |
| Candidates with anonymous container transfers | 16 |
| Candidates with cross-schema container transfers | 0 |
| Candidates with dynamic container transfers | 10 |
| Candidates exposed through bridge inputs | 131 |
| Candidates exposed through bridge outputs | 147 |

Exact containment paths, roots, transfer locations, and bridge paths are in `typed-struct-provenance.json`.

| Candidate | Direct | Fields | Parents | Children | Normalization roots | Container transfers | Bridge in roots | Bridge out roots | Closed | Blockers |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :---: | --- |
| `@flighthq/bitmapfont-formats:upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts#BitmapFontCharRecord` | 12 | 9 | 1 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/bitmapfont-formats:upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts#BitmapFontKerningRecord` | 3 | 3 | 1 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/bitmapfont-formats:upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts#BitmapFontPageRecord` | 5 | 2 | 1 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxParse.ts#LibgdxParsed` | 0 | 3 | 0 | 2 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxParse.ts#LibgdxParseResult` | 2 | 3 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxSchema.ts#LibgdxParticleDocument` | 76 | 25 | 2 | 16 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/parseParticleConfig.ts#ParticleConfigParseResult` | 0 | 3 | 0 | 1 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/particleDesignerParse.ts#ParticleDesignerParsed` | 2 | 3 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/particleDesignerSchema.ts#ParticleDesignerDocument` | 46 | 46 | 1 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/pixiParse.ts#PixiParsed` | 0 | 2 | 0 | 1 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/pixiParse.ts#PixiParseResult` | 2 | 2 | 0 | 1 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/serializeResult.ts#ParticleSerializeResult` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/spineParse.ts#SpineParsed` | 2 | 3 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexParse.ts#StarlingPexParsed` | 0 | 3 | 0 | 2 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexParse.ts#StarlingPexParseResult` | 2 | 3 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexSchema.ts#StarlingPexColor` | 30 | 4 | 4 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexSchema.ts#StarlingPexDocument` | 79 | 38 | 2 | 4 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unityParse.ts#UnityParsed` | 2 | 3 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityAnimationCurve` | 0 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | no | `normalization-provenance` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityBurst` | 0 | 4 | 1 | 0 | 0 | 1 | 1 | 1 | no | `container-transfer` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityCurveKey` | 0 | 2 | 1 | 0 | 1 | 1 | 1 | 1 | no | `container-transfer`, `normalization-provenance` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityEmission` | 0 | 2 | 1 | 2 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityGradient` | 0 | 2 | 1 | 2 | 1 | 0 | 1 | 1 | no | `normalization-provenance` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityGradientAlphaKey` | 0 | 2 | 1 | 0 | 1 | 0 | 1 | 1 | no | `normalization-provenance` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityGradientColorKey` | 0 | 2 | 1 | 0 | 1 | 0 | 1 | 1 | no | `normalization-provenance` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityRotationOverLifetime` | 0 | 2 | 1 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/unitySchema.ts#UnityShape` | 0 | 5 | 1 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfAccessorSparse` | 7 | 3 | 1 | 0 | 1 | 0 | 1 | 0 | no | `normalization-provenance` |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/gltfSchema.ts#GltfAnimationChannel` | 6 | 2 | 1 | 0 | 1 | 0 | 1 | 0 | no | `normalization-provenance` |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Joint` | 26 | 9 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Mesh` | 9 | 4 | 0 | 2 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Vertex` | 4 | 4 | 1 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/md5Schema.ts#Md5Weight` | 18 | 5 | 1 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/objSchema.ts#ObjMaterial` | 19 | 11 | 1 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/objSchema.ts#ObjMaterialLibrary` | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/shared.ts#SkinInfluence` | 5 | 2 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/threeDsSchema.ts#ThreeDsMaterial` | 8 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/scene-formats:upstream/packages/scene-formats/src/threeDsSchema.ts#ThreeDsMesh` | 14 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneMaterialTextureRegistry.ts#SceneMaterialTextureRegistry` | 2 | 1 | 2 | 0 | 0 | 0 | 4 | 2 | yes | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceResolver.ts#SceneResourceInFlight` | 5 | 3 | 1 | 0 | 0 | 1 | 2 | 1 | no | `container-transfer` |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceResolver.ts#SceneResourceResolver` | 22 | 5 | 1 | 5 | 0 | 0 | 2 | 1 | yes | — |
| `@flighthq/scene-resources:upstream/packages/scene-resources/src/sceneResourceSignals.ts#SceneResourceSignals` | 4 | 2 | 1 | 2 | 0 | 0 | 2 | 2 | yes | — |
| `@flighthq/shape-formats:upstream/packages/shape-formats/src/shapeJson.ts#ShapeBitmapReference` | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteParse.ts#AsepriteParsed` | 0 | 2 | 0 | 3 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteArrayFrame` | 2 | 7 | 1 | 3 | 1 | 1 | 1 | 1 | no | `container-transfer`, `normalization-provenance` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteHashFrame` | 0 | 6 | 0 | 3 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteLayer` | 0 | 3 | 1 | 0 | 3 | 0 | 2 | 1 | no | `normalization-provenance` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteRect` | 0 | 4 | 6 | 0 | 2 | 0 | 2 | 1 | no | `normalization-provenance` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/asepriteSchema.ts#AsepriteSize` | 2 | 2 | 4 | 0 | 3 | 0 | 2 | 1 | no | `normalization-provenance` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/cocosPlistParse.ts#CocosPlistParsed` | 0 | 2 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/cocosPlistSchema.ts#CocosPlistDocument` | 7 | 2 | 1 | 2 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/cocosPlistSchema.ts#CocosPlistMetadata` | 7 | 3 | 1 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/libgdxAtlasSchema.ts#LibgdxAtlasDocument` | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/libgdxAtlasSchema.ts#LibgdxAtlasPage` | 0 | 7 | 1 | 1 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/libgdxAtlasSchema.ts#LibgdxAtlasRegion` | 0 | 8 | 1 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/starlingParse.ts#StarlingParsed` | 0 | 2 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/starlingSchema.ts#StarlingDocument` | 3 | 2 | 1 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerParse.ts#TexturePackerParsed` | 0 | 2 | 0 | 3 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerFrameTag` | 4 | 4 | 1 | 0 | 2 | 1 | 2 | 1 | no | `container-transfer`, `normalization-provenance` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerPivot` | 0 | 2 | 2 | 0 | 3 | 0 | 2 | 1 | no | `normalization-provenance` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerRect` | 0 | 4 | 4 | 0 | 3 | 0 | 2 | 1 | no | `normalization-provenance` |
| `@flighthq/spritesheet-formats:upstream/packages/spritesheet-formats/src/texturePackerSchema.ts#TexturePackerSize` | 2 | 2 | 3 | 0 | 3 | 0 | 2 | 1 | no | `normalization-provenance` |
| `@flighthq/texture-formats:upstream/packages/texture-formats/src/byteReader.ts#ByteReader` | 28 | 2 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteArrayFrame` | 1 | 7 | 1 | 3 | 1 | 0 | 1 | 0 | no | `normalization-provenance` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteBaseFrame` | 0 | 6 | 1 | 3 | 1 | 0 | 1 | 0 | no | `normalization-provenance` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteHashDocument` | 0 | 2 | 0 | 2 | 1 | 0 | 1 | 0 | no | `normalization-provenance` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteHashFrame` | 0 | 6 | 0 | 3 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteRect` | 6 | 4 | 6 | 0 | 2 | 0 | 2 | 0 | no | `normalization-provenance` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts#TextureAtlasAsepriteSize` | 2 | 2 | 4 | 0 | 2 | 0 | 2 | 0 | no | `normalization-provenance` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerPivot` | 2 | 2 | 2 | 0 | 2 | 0 | 2 | 0 | no | `normalization-provenance` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerRect` | 8 | 4 | 4 | 0 | 2 | 0 | 2 | 0 | no | `normalization-provenance` |
| `@flighthq/textureatlas-formats:upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts#TextureAtlasPackerSize` | 2 | 2 | 3 | 0 | 2 | 0 | 2 | 0 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/AnimationClip.ts#AnimationClip` | 8 | 2 | 1 | 0 | 1 | 0 | 2 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/App.ts#App` | 7 | 6 | 0 | 6 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Application.ts#Application` | 57 | 13 | 0 | 8 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ApplicationWindow.ts#ApplicationWindow` | 139 | 36 | 6 | 16 | 1 | 0 | 7 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/ApplicationWindow.ts#WindowBounds` | 24 | 4 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetEntry` | 19 | 4 | 1 | 0 | 0 | 1 | 1 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLibrary` | 9 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLibraryRuntime` | 25 | 4 | 1 | 3 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLoaderAdapter` | 0 | 2 | 1 | 0 | 0 | 1 | 2 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLoadProgress` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/AudioBus.ts#AudioBus` | 16 | 4 | 0 | 0 | 0 | 3 | 1 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/AudioBus.ts#AudioMixer` | 6 | 2 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/AudioResource.ts#AudioChannel` | 40 | 8 | 0 | 2 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/AudioResource.ts#AudioResource` | 17 | 1 | 1 | 0 | 0 | 0 | 2 | 2 | yes | — |
| `@flighthq/types:upstream/packages/types/src/BitmapFont.ts#BitmapFont` | 12 | 5 | 0 | 3 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/BitmapFont.ts#BitmapFontKerningData` | 3 | 3 | 1 | 0 | 0 | 1 | 1 | 0 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Camera.ts#OrthographicProjection` | 6 | 3 | 1 | 0 | 1 | 0 | 2 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/Camera.ts#PerspectiveProjection` | 7 | 3 | 1 | 0 | 1 | 0 | 2 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/Camera2D.ts#Camera2D` | 17 | 6 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Clipboard.ts#ClipboardBookmark` | 0 | 2 | 0 | 0 | 0 | 2 | 0 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Clipboard.ts#ClipboardWriteItem` | 5 | 2 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ClipboardWatch.ts#ClipboardWatch` | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Connectivity.ts#Connectivity` | 5 | 5 | 0 | 5 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Connectivity.ts#ConnectivityReachability` | 8 | 2 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Device.ts#DeviceInfo` | 50 | 25 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Device.ts#SafeAreaInsets` | 16 | 4 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/DeviceCapabilities.ts#DeviceCapabilities` | 6 | 3 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/DeviceDisplayMetrics.ts#DeviceDisplayMetrics` | 14 | 7 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#FileDialogHandle` | 12 | 3 | 0 | 0 | 0 | 14 | 1 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Dialog.ts#MessageDialogResult` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/DragForce.ts#DragForce` | 3 | 2 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileEntry` | 2 | 3 | 0 | 0 | 0 | 8 | 0 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FilePermissions` | 0 | 3 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileStat` | 0 | 5 | 0 | 0 | 0 | 1 | 0 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileSystemUsage` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/FileSystem.ts#FileWatchEvent` | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/FontResource.ts#FontResource` | 9 | 2 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Geolocation.ts#GeoPosition` | 0 | 9 | 1 | 0 | 0 | 4 | 0 | 2 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Geolocation.ts#GeoPositionResult` | 0 | 2 | 0 | 1 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlas` | 6 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlasRuntime` | 72 | 15 | 1 | 6 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlasShelf` | 6 | 3 | 1 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphEntry` | 39 | 8 | 2 | 0 | 0 | 1 | 2 | 3 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphMetrics` | 11 | 3 | 3 | 0 | 0 | 0 | 3 | 3 | yes | — |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphRasterizedBitmap` | 17 | 6 | 1 | 0 | 0 | 1 | 1 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphSource` | 0 | 4 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Haptics.ts#HapticsCapabilities` | 10 | 5 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ImageResourceCompressed.ts#ImageResourceCompressed` | 4 | 2 | 2 | 0 | 9 | 0 | 15 | 12 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/InputGamepadData.ts#InputGamepadAxisData` | 7 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/InputGamepadData.ts#InputGamepadButtonData` | 8 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/InputGamepadData.ts#InputGamepadConnectData` | 10 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/InputTextData.ts#InputTextData` | 5 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcBackendCapabilities` | 0 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcChannel` | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcMessageEvent` | 2 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcTarget` | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/IpcSignals.ts#IpcSignals` | 3 | 2 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Lifecycle.ts#AppLifecycle` | 8 | 7 | 0 | 7 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/MediaSession.ts#MediaSessionMetadata` | 4 | 4 | 0 | 1 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/MediaSession.ts#MediaSessionPositionState` | 0 | 3 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/MenuSignals.ts#MenuSignals` | 5 | 4 | 0 | 4 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#MeshSubset` | 23 | 2 | 2 | 0 | 3 | 1 | 5 | 3 | no | `container-transfer`, `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#VertexAttribute` | 32 | 3 | 1 | 0 | 3 | 0 | 5 | 5 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#VertexAttributeLayout` | 53 | 2 | 2 | 1 | 3 | 0 | 5 | 4 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/NodeSignals.ts#NodeSignals` | 14 | 5 | 1 | 5 | 1 | 0 | 0 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#NotificationChannel` | 0 | 2 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Notification.ts#ScheduledNotification` | 0 | 3 | 0 | 2 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ParsedAccelerator.ts#ParsedAccelerator` | 0 | 2 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ParticleConfigIssue.ts#ParticleConfigIssue` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ParticleCurve.ts#ColorKeyframe` | 22 | 4 | 0 | 0 | 0 | 1 | 1 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/ParticleCurve.ts#CurveKeyframe` | 11 | 2 | 0 | 0 | 0 | 1 | 1 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitter.ts#ParticleEmitterData` | 405 | 9 | 1 | 1 | 1 | 0 | 2 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitterSignals.ts#ParticleEmitterSignals` | 6 | 3 | 0 | 3 | 0 | 2 | 0 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitterState.ts#ParticleEmitterState` | 236 | 13 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ParticleObjectsState.ts#ParticleObjectsState` | 36 | 10 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Power.ts#Power` | 37 | 10 | 0 | 10 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Power.ts#PowerStatus` | 21 | 8 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/PowerBatteryHealth.ts#PowerBatteryHealth` | 0 | 5 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Protocol.ts#ParsedProtocolUrl` | 0 | 4 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Protocol.ts#ProtocolHandler` | 2 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ResourceLoaderItemSignals.ts#ResourceLoaderItemSignals` | 8 | 4 | 0 | 4 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ResourceLoadHandle.ts#ResourceLoadHandle` | 2 | 2 | 0 | 0 | 0 | 1 | 0 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Scene.ts#SceneRuntime` | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/SceneResourceRef.ts#EmbeddedSceneResourceRef` | 2 | 4 | 2 | 0 | 2 | 0 | 4 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/SceneResourceRef.ts#ExternalSceneResourceRef` | 2 | 5 | 2 | 0 | 2 | 0 | 4 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/ScreenChangeEvent.ts#ScreenChangeEvent` | 4 | 3 | 0 | 2 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ScreenMode.ts#ScreenMode` | 10 | 5 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ScreenSignals.ts#ScreenSignals` | 3 | 3 | 0 | 3 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#AmbientLightReading` | 3 | 4 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#MotionReading` | 38 | 6 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#OrientationReading` | 49 | 8 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#PressureReading` | 0 | 5 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#ProximityReading` | 0 | 6 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#QuaternionReading` | 32 | 7 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#RotationRateReading` | 5 | 6 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#SensorReading` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Sensors.ts#Sensors` | 11 | 11 | 0 | 11 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Share.ts#ShareResult` | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ShareSignals.ts#ShareSignals` | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ShortcutEvent.ts#ShortcutEvent` | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/ShortcutSignals.ts#ShortcutSignals` | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Signal.ts#SignalData` | 30 | 4 | 1 | 0 | 4 | 0 | 26 | 28 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/Spatial.ts#SpatialAabb` | 34 | 4 | 0 | 0 | 0 | 1 | 1 | 0 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/SpritesheetAnimationData.ts#SpritesheetAnimationData` | 38 | 8 | 1 | 0 | 0 | 1 | 2 | 6 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/SpritesheetData.ts#SpritesheetData` | 33 | 6 | 4 | 2 | 0 | 0 | 1 | 5 | yes | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetFrame.ts#SpritesheetFrame` | 12 | 6 | 1 | 0 | 1 | 0 | 2 | 2 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/SpritesheetFrameData.ts#SpritesheetFrameData` | 102 | 12 | 1 | 0 | 0 | 0 | 2 | 6 | yes | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetPlayer.ts#SpritesheetPlayer` | 65 | 9 | 0 | 4 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/SpritesheetValidationDiagnostic.ts#SpritesheetValidationDiagnostic` | 0 | 4 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/StatusBar.ts#StatusBar` | 1 | 1 | 0 | 1 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageMigration` | 4 | 2 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageNamespace` | 6 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageQuota` | 0 | 2 | 0 | 0 | 0 | 3 | 0 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageSignals` | 2 | 1 | 0 | 1 | 0 | 0 | 0 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/TextMetrics.ts#TextMetrics` | 6 | 3 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Tray.ts#TrayEventData` | 0 | 10 | 0 | 1 | 0 | 0 | 0 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/TurbulenceForce.ts#TurbulenceForce` | 4 | 3 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/TweenManager.ts#TweenManager` | 16 | 3 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#AppUpdater` | 10 | 10 | 0 | 10 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdateProgress` | 0 | 5 | 1 | 0 | 1 | 0 | 0 | 1 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdaterError` | 0 | 2 | 1 | 0 | 1 | 0 | 0 | 1 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/Updater.ts#UpdaterSignatureConfig` | 0 | 2 | 0 | 0 | 0 | 0 | 1 | 0 | yes | — |
| `@flighthq/types:upstream/packages/types/src/VideoResource.ts#VideoChannel` | 44 | 8 | 0 | 2 | 0 | 0 | 1 | 1 | yes | — |
| `@flighthq/types:upstream/packages/types/src/VideoResource.ts#VideoResource` | 33 | 1 | 2 | 0 | 1 | 0 | 3 | 3 | no | `normalization-provenance` |
| `@flighthq/types:upstream/packages/types/src/Webcam.ts#WebcamPhoto` | 0 | 4 | 0 | 0 | 0 | 4 | 0 | 1 | no | `container-transfer` |
| `@flighthq/types:upstream/packages/types/src/Webcam.ts#WebcamVideo` | 0 | 3 | 0 | 0 | 0 | 4 | 0 | 1 | no | `container-transfer` |
| `@flighthq/xml:upstream/packages/xml/src/xmlParse.ts#XmlElement` | 41 | 4 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
