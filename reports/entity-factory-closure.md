# Entity Factory Closure Audit

Upstream commit: `32a089f1342d08547fc2359dfd5e8fe9f7e3c12e`

This audit inventories exact calls to Flight's production `createEntity` helper. A ready site has either a declared concrete Entity identity or a closed local object shape that receives a private generated identity, plus a constructible field set. Source-order differences are normalized after preserving initializer evaluation order. It reports closure prerequisites; it does not activate named-schema class emission.

| Metric | Count |
| --- | ---: |
| Production createEntity calls | 836 |
| Exact concrete Entity calls | 730 |
| Exact concrete Entity schemas | 567 |
| Constructor-ready Entity calls | 836 |
| Blocked Entity calls | 0 |
| Bare Entity calls | 0 |
| Generic Entity calls | 0 |
| Private local Entity classes | 106 |
| Field-order-normalized calls | 0 |
| Missing-field-initialized calls | 0 |
| Spread-projected calls | 0 |
| Structural Entity calls | 0 |
| Exact non-Entity calls | 0 |
| Unresolved calls | 0 |

## Concrete Entity identities

| Identity | Calls | Ready | Blocked | Factory owners |
| --- | ---: | ---: | ---: | --- |
| `@flighthq/types:interface#Aabb` | 1 | 1 | 0 | `createAabb` |
| `@flighthq/types:interface#AccessibilityBackend` | 1 | 1 | 0 | `createWebAccessibilityBackend` |
| `@flighthq/types:interface#AddNodeChildCommand` | 1 | 1 | 0 | `createAddNodeChildCommand` |
| `@flighthq/types:interface#AmbientLight` | 1 | 1 | 0 | `createAmbientLight` |
| `@flighthq/types:interface#AmbientLightReading` | 1 | 1 | 0 | `createAmbientLightReading` |
| `@flighthq/types:interface#AnimatedNormalModifier` | 1 | 1 | 0 | `createAnimatedNormalModifier` |
| `@flighthq/types:interface#AnimationBlendTree` | 1 | 1 | 0 | `createAnimationBlendTree` |
| `@flighthq/types:interface#AnimationBlendTreeInput` | 1 | 1 | 0 | `createAnimationBlendTreeInput` |
| `@flighthq/types:interface#AnimationChannel` | 1 | 1 | 0 | `createAnimationChannel` |
| `@flighthq/types:interface#AnimationClip` | 2 | 2 | 0 | `cloneAnimationClip`, `createAnimationClip` |
| `@flighthq/types:interface#AnimationClipEvent` | 1 | 1 | 0 | `createAnimationClipEvent` |
| `@flighthq/types:interface#AnimationCrossfade` | 1 | 1 | 0 | `createAnimationCrossfade` |
| `@flighthq/types:interface#AnimationLayer` | 1 | 1 | 0 | `createAnimationLayer` |
| `@flighthq/types:interface#AnimationLayerStack` | 1 | 1 | 0 | `createAnimationLayerStack` |
| `@flighthq/types:interface#AnimationPlayer` | 2 | 2 | 0 | `cloneAnimationPlayer`, `createAnimationPlayer` |
| `@flighthq/types:interface#AnimationRootMotionExtractor` | 1 | 1 | 0 | `createAnimationRootMotionExtractor` |
| `@flighthq/types:interface#AnimationSampleAccumulator` | 1 | 1 | 0 | `createAnimationSampleAccumulator` |
| `@flighthq/types:interface#AnimationStateMachine` | 1 | 1 | 0 | `createAnimationStateMachine` |
| `@flighthq/types:interface#AnimationStateMachineState` | 1 | 1 | 0 | `createAnimationStateMachineState` |
| `@flighthq/types:interface#AnimationTrack` | 3 | 3 | 0 | `cloneAnimationTrack`, `createAnimationTrack`, `trimAnimationTrack` |
| `@flighthq/types:interface#AnisotropyPbrExtension` | 1 | 1 | 0 | `createAnisotropyPbrExtension` |
| `@flighthq/types:interface#App` | 1 | 1 | 0 | `createApp` |
| `@flighthq/types:interface#AppActivateBackend` | 2 | 2 | 0 | `<anonymous>`, `initializeCapacitorCommonAppCapabilities` |
| `@flighthq/types:interface#AppActivationPolicyBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppAllWindowsClosedBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppBadgeBackend` | 3 | 3 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppDockBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppFocusBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppHideBackend` | 3 | 3 | 0 | `<anonymous>`, `initializeCapacitorAndroidAppCapabilities`, `initializeTauriAppCapabilities` |
| `@flighthq/types:interface#Application` | 1 | 1 | 0 | `createApplication` |
| `@flighthq/types:interface#ApplicationWindow` | 1 | 1 | 0 | `createApplicationWindow` |
| `@flighthq/types:interface#AppLifecycle` | 1 | 1 | 0 | `createAppLifecycle` |
| `@flighthq/types:interface#AppLocaleBackend` | 3 | 3 | 0 | `<anonymous>`, `initializeTauriAppCapabilities` |
| `@flighthq/types:interface#AppLoginItemBackend` | 1 | 1 | 0 | `createElectronLoginItemBackend` |
| `@flighthq/types:interface#AppNameBackend` | 4 | 4 | 0 | `<anonymous>`, `initializeCapacitorCommonAppCapabilities`, `initializeTauriAppCapabilities` |
| `@flighthq/types:interface#AppNameWriteBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppOpenFileBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppPathBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppQuitBackend` | 4 | 4 | 0 | `<anonymous>`, `initializeCapacitorAndroidAppCapabilities`, `initializeTauriAppCapabilities` |
| `@flighthq/types:interface#AppQuitRequestBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppReadyBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppRecentDocumentsBackend` | 1 | 1 | 0 | `createElectronRecentDocumentsBackend` |
| `@flighthq/types:interface#AppRelaunchBackend` | 3 | 3 | 0 | `<anonymous>`, `initializeTauriAppCapabilities` |
| `@flighthq/types:interface#AppSecondInstanceBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppShowBackend` | 2 | 2 | 0 | `<anonymous>`, `initializeTauriAppCapabilities` |
| `@flighthq/types:interface#AppSingleInstanceBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppUserModelIdBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AppVersionBackend` | 3 | 3 | 0 | `<anonymous>`, `initializeCapacitorCommonAppCapabilities`, `initializeTauriAppCapabilities` |
| `@flighthq/types:interface#AppVisibilityQueryBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AreaLight` | 2 | 2 | 0 | `cloneAreaLight`, `createAreaLight` |
| `@flighthq/types:interface#AssetLibrary` | 1 | 1 | 0 | `createAssetLibrary` |
| `@flighthq/types:interface#AudioBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#AudioBus` | 1 | 1 | 0 | `createAudioBus` |
| `@flighthq/types:interface#AudioMixer` | 1 | 1 | 0 | `createAudioMixer` |
| `@flighthq/types:interface#AudioResource` | 2 | 2 | 0 | `cloneAudioResource`, `createAudioResource` |
| `@flighthq/types:interface#AudioResourceFailure` | 3 | 3 | 0 | `<anonymous>`, `createAudioResourceFailure` |
| `@flighthq/types:interface#AutoExposureEffect` | 1 | 1 | 0 | `createAutoExposureEffect` |
| `@flighthq/types:interface#BarrelDistortionEffect` | 1 | 1 | 0 | `createBarrelDistortionEffect` |
| `@flighthq/types:interface#BevelEffect` | 1 | 1 | 0 | `createBevelEffect` |
| `@flighthq/types:interface#BidiClassBackend` | 1 | 1 | 0 | `createCompactBidiClassBackend` |
| `@flighthq/types:interface#Bitmap` | 9 | 9 | 0 | `<anonymous>`, `cloneBitmap`, `createBitmap`, `createBitmapFromCanvas`, `cropBitmap`, `decodeEmbeddedImageResourceReference`, `extendBitmap`, `makeBitmap`, `trimBitmap` |
| `@flighthq/types:interface#BitmapDisplacementEffect` | 1 | 1 | 0 | `createBitmapDisplacementEffect` |
| `@flighthq/types:interface#BitmapFingerprint` | 3 | 3 | 0 | `<anonymous>`, `createBitmapFingerprint`, `parseBitmapFingerprint` |
| `@flighthq/types:interface#BitmapFont` | 1 | 1 | 0 | `createBitmapFont` |
| `@flighthq/types:interface#BitmapTextData` | 1 | 1 | 0 | `createBitmapTextData` |
| `@flighthq/types:interface#BlendEffect` | 1 | 1 | 0 | `createBlendEffect` |
| `@flighthq/types:interface#BloomEffect` | 1 | 1 | 0 | `createBloomEffect` |
| `@flighthq/types:interface#BlurEffect` | 1 | 1 | 0 | `createBlurEffect` |
| `@flighthq/types:interface#BokehDepthOfFieldEffect` | 1 | 1 | 0 | `createBokehDepthOfFieldEffect` |
| `@flighthq/types:interface#BoundingSphere` | 1 | 1 | 0 | `createBoundingSphere` |
| `@flighthq/types:interface#BrightnessContrastAdjustment` | 1 | 1 | 0 | `createBrightnessContrastAdjustment` |
| `@flighthq/types:interface#Camera2D` | 1 | 1 | 0 | `createCamera2D` |
| `@flighthq/types:interface#Camera3D` | 1 | 1 | 0 | `createCamera3D` |
| `@flighthq/types:interface#CameraMotionBlurEffect` | 1 | 1 | 0 | `createCameraMotionBlurEffect` |
| `@flighthq/types:interface#CameraShake` | 1 | 1 | 0 | `createCameraShake` |
| `@flighthq/types:interface#CameraShakeOffset` | 1 | 1 | 0 | `createCameraShakeOffset` |
| `@flighthq/types:interface#CanvasPipeline` | 1 | 1 | 0 | `createCanvasPipeline` |
| `@flighthq/types:interface#CanvasRenderEffectPipeline` | 1 | 1 | 0 | `createCanvasRenderEffectPipeline` |
| `@flighthq/types:interface#CanvasRenderRegistries` | 1 | 1 | 0 | `createEmptyCanvasRegistries` |
| `@flighthq/types:interface#CanvasRenderSurface` | 1 | 1 | 0 | `finishCanvasRenderSurface` |
| `@flighthq/types:interface#CanvasRenderSurfaceCreator` | 2 | 2 | 0 | `<anonymous>`, `createWebCanvasRenderSurfaceCreator` |
| `@flighthq/types:interface#CanvasRenderTarget` | 1 | 1 | 0 | `createCanvasRenderTarget` |
| `@flighthq/types:interface#CanvasRenderTargetPool` | 2 | 2 | 0 | `createCanvasRenderTargetPool`, `createCanvasRenderTexturePool` |
| `@flighthq/types:interface#CanvasRenderTexturePool` | 1 | 1 | 0 | `createCanvasRenderTexturePool` |
| `@flighthq/types:interface#CanvasTextShaperBackend` | 2 | 2 | 0 | `_createSentinelBackend`, `createCanvasTextShaperBackend` |
| `@flighthq/types:interface#CanvasTextureResolvers` | 1 | 1 | 0 | `createCanvasTextureResolvers` |
| `@flighthq/types:interface#CapacitorShareContentBackend` | 1 | 1 | 0 | `createCapacitorShareContentBackend` |
| `@flighthq/types:interface#Capsule` | 1 | 1 | 0 | `createCapsule` |
| `@flighthq/types:interface#ChannelMixerAdjustment` | 1 | 1 | 0 | `createChannelMixerAdjustment` |
| `@flighthq/types:interface#ChromaticAberrationEffect` | 1 | 1 | 0 | `createChromaticAberrationEffect` |
| `@flighthq/types:interface#ClearcoatPbrExtension` | 1 | 1 | 0 | `createClearcoatPbrExtension` |
| `@flighthq/types:interface#ClipboardTextBackend` | 1 | 1 | 0 | `createTauriClipboardBackend` |
| `@flighthq/types:interface#ClipboardWatch` | 1 | 1 | 0 | `createClipboardWatch` |
| `@flighthq/types:interface#ClipRegion` | 5 | 5 | 0 | `cloneClipRegion`, `createClipRegionFromContours`, `createClipRegionFromPath`, `createClipRegionFromRectangle`, `makeEmptyClipRegion` |
| `@flighthq/types:interface#Clock` | 1 | 1 | 0 | `createClock` |
| `@flighthq/types:interface#CollisionContactManifold2D` | 1 | 1 | 0 | `createCollisionContactManifold2D` |
| `@flighthq/types:interface#CollisionContactManifold3D` | 1 | 1 | 0 | `createCollisionContactManifold3D` |
| `@flighthq/types:interface#CollisionDistance3D` | 1 | 1 | 0 | `createCollisionDistance3D` |
| `@flighthq/types:interface#CollisionHeightfield3D` | 1 | 1 | 0 | `createCollisionHeightfield3D` |
| `@flighthq/types:interface#CollisionManifold2D` | 1 | 1 | 0 | `createCollisionManifold2D` |
| `@flighthq/types:interface#CollisionManifold3D` | 1 | 1 | 0 | `createCollisionManifold3D` |
| `@flighthq/types:interface#CollisionRaycastHit2D` | 1 | 1 | 0 | `createCollisionRaycastHit2D` |
| `@flighthq/types:interface#CollisionRaycastHit3D` | 1 | 1 | 0 | `createCollisionRaycastHit3D` |
| `@flighthq/types:interface#CollisionTimeOfImpact2D` | 1 | 1 | 0 | `createCollisionTimeOfImpact2D` |
| `@flighthq/types:interface#CollisionTimeOfImpact3D` | 1 | 1 | 0 | `createCollisionTimeOfImpact3D` |
| `@flighthq/types:interface#CollisionTriangleMesh3D` | 1 | 1 | 0 | `createCollisionTriangleMesh3D` |
| `@flighthq/types:interface#ColorBlindSimulationAdjustment` | 1 | 1 | 0 | `createColorBlindSimulationAdjustment` |
| `@flighthq/types:interface#ColorGradeAdjustment` | 1 | 1 | 0 | `createColorGradeAdjustment` |
| `@flighthq/types:interface#ColorLutCache` | 1 | 1 | 0 | `createColorLutCache` |
| `@flighthq/types:interface#ColorMatrixAdjustment` | 1 | 1 | 0 | `createColorMatrixAdjustment` |
| `@flighthq/types:interface#ColorScaleBias` | 1 | 1 | 0 | `createColorScaleBias` |
| `@flighthq/types:interface#ColorScaleBiasAdjustment` | 1 | 1 | 0 | `createColorScaleBiasAdjustment` |
| `@flighthq/types:interface#CommandHistory` | 1 | 1 | 0 | `createCommandHistory` |
| `@flighthq/types:interface#CompositeCommand` | 1 | 1 | 0 | `createCompositeCommand` |
| `@flighthq/types:interface#CompositeEffect` | 1 | 1 | 0 | `createCompositeEffect` |
| `@flighthq/types:interface#CompressedImageResource` | 1 | 1 | 0 | `createCompressedImageResource` |
| `@flighthq/types:interface#Connectivity` | 1 | 1 | 0 | `createConnectivity` |
| `@flighthq/types:interface#ContactShadowsEffect` | 1 | 1 | 0 | `createContactShadowsEffect` |
| `@flighthq/types:interface#ConvolutionEffect` | 1 | 1 | 0 | `createConvolutionEffect` |
| `@flighthq/types:interface#CrtEffect` | 1 | 1 | 0 | `createCrtEffect` |
| `@flighthq/types:interface#CustomShaderEffect` | 1 | 1 | 0 | `createCustomShaderEffect` |
| `@flighthq/types:interface#DeviceBackend` | 2 | 2 | 0 | `createCapacitorDeviceBackend`, `createWebDeviceBackend` |
| `@flighthq/types:interface#DeviceCapabilities` | 1 | 1 | 0 | `createDeviceCapabilities` |
| `@flighthq/types:interface#DeviceDisplayMetrics` | 1 | 1 | 0 | `createDeviceDisplayMetrics` |
| `@flighthq/types:interface#DeviceInfo` | 1 | 1 | 0 | `createDeviceInfo` |
| `@flighthq/types:interface#DirectionalBlurEffect` | 1 | 1 | 0 | `createDirectionalBlurEffect` |
| `@flighthq/types:interface#DirectionalLight` | 2 | 2 | 0 | `cloneDirectionalLight`, `createDirectionalLight` |
| `@flighthq/types:interface#DirectoryOpenDialogBackend` | 3 | 3 | 0 | `<anonymous>`, `createElectronDirectoryOpenDialogBackend`, `createTauriDirectoryOpenDialogBackend` |
| `@flighthq/types:interface#DisplacementEffect` | 1 | 1 | 0 | `createDisplacementEffect` |
| `@flighthq/types:interface#DissolveModifier` | 1 | 1 | 0 | `createDissolveModifier` |
| `@flighthq/types:interface#DitherEffect` | 1 | 1 | 0 | `createDitherEffect` |
| `@flighthq/types:interface#DownloadedUpdate` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#DropShadowEffect` | 1 | 1 | 0 | `createDropShadowEffect` |
| `@flighthq/types:interface#EmbeddedAudioResourceReference` | 1 | 1 | 0 | `createEmbeddedAudioResourceReference` |
| `@flighthq/types:interface#EmbeddedImageResourceReference` | 1 | 1 | 0 | `createEmbeddedImageResourceReference` |
| `@flighthq/types:interface#EmissiveModifier` | 1 | 1 | 0 | `createEmissiveModifier` |
| `@flighthq/types:interface#Environment` | 1 | 1 | 0 | `createEnvironment` |
| `@flighthq/types:interface#EnvReflectModifier` | 1 | 1 | 0 | `createEnvReflectModifier` |
| `@flighthq/types:interface#ExposureAdjustment` | 1 | 1 | 0 | `createExposureAdjustment` |
| `@flighthq/types:interface#ExternalAudioResourceReference` | 1 | 1 | 0 | `createExternalAudioResourceReference` |
| `@flighthq/types:interface#ExternalImageResourceReference` | 1 | 1 | 0 | `createExternalImageResourceReference` |
| `@flighthq/types:interface#ExternalTexture` | 2 | 2 | 0 | `createExternalGlTexture`, `createExternalWgpuTexture` |
| `@flighthq/types:interface#FileDialogHandle` | 1 | 1 | 0 | `createFileDialogHandle` |
| `@flighthq/types:interface#FileOpenDialogBackend` | 3 | 3 | 0 | `<anonymous>`, `createElectronFileOpenDialogBackend`, `createTauriFileOpenDialogBackend` |
| `@flighthq/types:interface#FileSaveDialogBackend` | 3 | 3 | 0 | `<anonymous>`, `createElectronFileSaveDialogBackend`, `createTauriFileSaveDialogBackend` |
| `@flighthq/types:interface#FilmEmulationEffect` | 1 | 1 | 0 | `createFilmEmulationEffect` |
| `@flighthq/types:interface#FilmGrainEffect` | 1 | 1 | 0 | `createFilmGrainEffect` |
| `@flighthq/types:interface#FlightDocumentRefusalExplanation` | 4 | 4 | 0 | `<anonymous>`, `createDocumentRefusal` |
| `@flighthq/types:interface#FlightDocumentScene2DMaterialization` | 1 | 1 | 0 | `createFlightDocumentScene2DMaterialization` |
| `@flighthq/types:interface#FlightDocumentScene3DMaterialization` | 1 | 1 | 0 | `createFlightDocumentScene3DMaterialization` |
| `@flighthq/types:interface#FlightDocumentTokenResolverRegistry` | 1 | 1 | 0 | `createFlightDocumentTokenResolverRegistry` |
| `@flighthq/types:interface#FlowStack` | 1 | 1 | 0 | `createFlowStack` |
| `@flighthq/types:interface#FlyCameraController` | 1 | 1 | 0 | `createFlyCameraController` |
| `@flighthq/types:interface#FogModifier` | 1 | 1 | 0 | `createFogModifier` |
| `@flighthq/types:interface#FontResource` | 1 | 1 | 0 | `createFontResource` |
| `@flighthq/types:interface#Frustum` | 1 | 1 | 0 | `createFrustum` |
| `@flighthq/types:interface#FxaaEffect` | 1 | 1 | 0 | `createFxaaEffect` |
| `@flighthq/types:interface#GeolocationBackend` | 2 | 2 | 0 | `createCapacitorGeolocationBackend`, `createWebGeolocationBackend` |
| `@flighthq/types:interface#GeoPosition` | 3 | 3 | 0 | `createGeoPosition`, `mapWebPosition`, `toGeoPosition` |
| `@flighthq/types:interface#GlContextState` | 1 | 1 | 0 | `createGlContextState` |
| `@flighthq/types:interface#GlitchEffect` | 1 | 1 | 0 | `createGlitchEffect` |
| `@flighthq/types:interface#GlobalShortcut` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#GlPipeline` | 1 | 1 | 0 | `createGlPipeline` |
| `@flighthq/types:interface#GlRenderEffectPipeline` | 1 | 1 | 0 | `createGlRenderEffectPipeline` |
| `@flighthq/types:interface#GlRenderRegistries` | 1 | 1 | 0 | `createEmptyGlRegistries` |
| `@flighthq/types:interface#GlRenderSurfaceProvider` | 1 | 1 | 0 | `createWebGlRenderSurfaceProvider` |
| `@flighthq/types:interface#GlRenderTarget` | 1 | 1 | 0 | `createGlRenderTarget` |
| `@flighthq/types:interface#GlRenderTargetPool` | 1 | 1 | 0 | `createGlRenderTargetPool` |
| `@flighthq/types:interface#GlRenderTexturePool` | 1 | 1 | 0 | `createGlRenderTexturePool` |
| `@flighthq/types:interface#GlShapeRendererData` | 1 | 1 | 0 | `createGlShapeData` |
| `@flighthq/types:interface#GlSkinPaletteTexture` | 1 | 1 | 0 | `createGlSkinPaletteTexture` |
| `@flighthq/types:interface#GlyphAtlas` | 1 | 1 | 0 | `createGlyphAtlas` |
| `@flighthq/types:interface#GlyphSource` | 2 | 2 | 0 | `createGlyphSourceFromBitmapFont`, `createGlyphSourceFromGlyphAtlas` |
| `@flighthq/types:interface#GodRaysEffect` | 1 | 1 | 0 | `createGodRaysEffect` |
| `@flighthq/types:interface#GradientBevelEffect` | 1 | 1 | 0 | `createGradientBevelEffect` |
| `@flighthq/types:interface#GradientGlowEffect` | 1 | 1 | 0 | `createGradientGlowEffect` |
| `@flighthq/types:interface#GrayscaleAdjustment` | 1 | 1 | 0 | `createGrayscaleAdjustment` |
| `@flighthq/types:interface#HalftoneEffect` | 1 | 1 | 0 | `createHalftoneEffect` |
| `@flighthq/types:interface#HapticsBackend` | 2 | 2 | 0 | `<anonymous>`, `createCapacitorHapticsBackend` |
| `@flighthq/types:interface#HemisphereLight` | 1 | 1 | 0 | `createHemisphereLight` |
| `@flighthq/types:interface#HtmlViewData` | 1 | 1 | 0 | `createHtmlViewData` |
| `@flighthq/types:interface#HueSaturationAdjustment` | 1 | 1 | 0 | `createHueSaturationAdjustment` |
| `@flighthq/types:interface#ImageBackend` | 1 | 1 | 0 | `createWebImageBackend` |
| `@flighthq/types:interface#ImageOpenDialogBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ImageResource` | 6 | 6 | 0 | `cloneImageResource`, `createImageResource`, `createImageResourceFromCanvas`, `createImageResourceFromImageBitmap`, `createImageResourceFromImageElement`, `createVideoImageResource` |
| `@flighthq/types:interface#ImageResourceFailure` | 4 | 4 | 0 | `<anonymous>`, `createImageResourceFailure`, `resolveImageResourceReference` |
| `@flighthq/types:interface#InnerGlowEffect` | 1 | 1 | 0 | `createInnerGlowEffect` |
| `@flighthq/types:interface#InnerShadowEffect` | 1 | 1 | 0 | `createInnerShadowEffect` |
| `@flighthq/types:interface#InputDropFileBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#InputFocusBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#InputKeyRepeatTimer` | 1 | 1 | 0 | `createInputKeyRepeatTimer` |
| `@flighthq/types:interface#InputManager` | 1 | 1 | 0 | `createInputManager` |
| `@flighthq/types:interface#InputPointerLockBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#InputSignals` | 1 | 1 | 0 | `createInputSignals` |
| `@flighthq/types:interface#InputState` | 1 | 1 | 0 | `createInputState` |
| `@flighthq/types:interface#InputTargetBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#InputTargetHandle` | 1 | 1 | 0 | `createWebInputTargetHandle` |
| `@flighthq/types:interface#InteractionSignals` | 1 | 1 | 0 | `createInteractionSignals` |
| `@flighthq/types:interface#InvertAdjustment` | 1 | 1 | 0 | `createInvertAdjustment` |
| `@flighthq/types:interface#IpcHandleBackend` | 1 | 1 | 0 | `createElectronIpcHandleBackend` |
| `@flighthq/types:interface#IpcInvokeBackend` | 1 | 1 | 0 | `createElectronIpcInvokeBackend` |
| `@flighthq/types:interface#IpcMessageBackend` | 1 | 1 | 0 | `createElectronIpcMessageBackend` |
| `@flighthq/types:interface#IpcSendBackend` | 1 | 1 | 0 | `createElectronIpcSendBackend` |
| `@flighthq/types:interface#IridescencePbrExtension` | 1 | 1 | 0 | `createIridescencePbrExtension` |
| `@flighthq/types:interface#KuwaharaEffect` | 1 | 1 | 0 | `createKuwaharaEffect` |
| `@flighthq/types:interface#LassoSelection` | 1 | 1 | 0 | `createLassoSelection` |
| `@flighthq/types:interface#LayoutState` | 1 | 1 | 0 | `createLayoutState` |
| `@flighthq/types:interface#LensDirtEffect` | 1 | 1 | 0 | `createLensDirtEffect` |
| `@flighthq/types:interface#LensDistortionEffect` | 1 | 1 | 0 | `createLensDistortionEffect` |
| `@flighthq/types:interface#LensFlareEffect` | 1 | 1 | 0 | `createLensFlareEffect` |
| `@flighthq/types:interface#LifecycleBackend` | 1 | 1 | 0 | `createWebLifecycleBackend` |
| `@flighthq/types:interface#LiftGammaGainAdjustment` | 1 | 1 | 0 | `createLiftGammaGainAdjustment` |
| `@flighthq/types:interface#LookupTableGradeAdjustment` | 1 | 1 | 0 | `createLookupTableGradeAdjustment` |
| `@flighthq/types:interface#LottieDocumentImportResult` | 2 | 2 | 0 | `createScene2DFromLottieDocument` |
| `@flighthq/types:interface#MarkupTagRegistry` | 1 | 1 | 0 | `createMarkupTagRegistry` |
| `@flighthq/types:interface#Material` | 2 | 2 | 0 | `cloneMaterial`, `createMaterial` |
| `@flighthq/types:interface#Matrix` | 1 | 1 | 0 | `createMatrix` |
| `@flighthq/types:interface#Matrix3` | 1 | 1 | 0 | `createMatrix3` |
| `@flighthq/types:interface#Matrix4` | 1 | 1 | 0 | `createMatrix4` |
| `@flighthq/types:interface#MedianEffect` | 1 | 1 | 0 | `createMedianEffect` |
| `@flighthq/types:interface#MediaSessionActionBackend` | 1 | 1 | 0 | `createWebMediaSessionActionBackend` |
| `@flighthq/types:interface#MediaSessionActionSignal` | 1 | 1 | 0 | `createMediaSessionActionSignal` |
| `@flighthq/types:interface#MediaSessionBackend` | 1 | 1 | 0 | `createWebMediaSessionBackend` |
| `@flighthq/types:interface#MenuApplicationBackend` | 2 | 2 | 0 | `<anonymous>`, `initializeTauriMenuBackends` |
| `@flighthq/types:interface#MenuHighlight` | 1 | 1 | 0 | `createMenuHighlight` |
| `@flighthq/types:interface#MenuHighlightBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#MenuPopupBackend` | 3 | 3 | 0 | `<anonymous>`, `initializeTauriMenuBackends` |
| `@flighthq/types:interface#MenuSelect` | 1 | 1 | 0 | `createMenuSelect` |
| `@flighthq/types:interface#MenuSelectBackend` | 2 | 2 | 0 | `<anonymous>`, `initializeTauriMenuBackends` |
| `@flighthq/types:interface#MenuSignals` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#MeshAttachment2D` | 6 | 6 | 0 | `parseDragonBonesMeshDisplay`, `parseDragonBonesWeightedMesh`, `parseSpineMeshAttachment`, `readSpineBinaryMeshAttachment`, `rejectSpineBinaryMesh` |
| `@flighthq/types:interface#MeshGeometry` | 1 | 1 | 0 | `createMeshGeometryRuntime` |
| `@flighthq/types:interface#MessageDialogBackend` | 4 | 4 | 0 | `createCapacitorMessageDialogBackend`, `createElectronMessageDialogBackend`, `createTauriMessageDialogBackend`, `createWebMessageDialogBackend` |
| `@flighthq/types:interface#MidiAccess` | 1 | 1 | 0 | `createMidiAccessResource` |
| `@flighthq/types:interface#MidiAccessBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#MidiEventAttachment` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#MidiInputPort` | 1 | 1 | 0 | `createMidiInputPortResource` |
| `@flighthq/types:interface#MidiOutputPort` | 1 | 1 | 0 | `createMidiOutputPortResource` |
| `@flighthq/types:interface#MidiPermissionBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ModifierRegistry` | 1 | 1 | 0 | `createModifierRegistry` |
| `@flighthq/types:interface#MorphShapeAnimationTarget` | 1 | 1 | 0 | `createMorphShapeAnimationTarget` |
| `@flighthq/types:interface#MorphShapeData` | 1 | 1 | 0 | `createMorphShapeData` |
| `@flighthq/types:interface#MotionBlurEffect` | 1 | 1 | 0 | `createMotionBlurEffect` |
| `@flighthq/types:interface#MotionPath` | 1 | 1 | 0 | `createMotionPath` |
| `@flighthq/types:interface#MotionReading` | 1 | 1 | 0 | `createMotionReading` |
| `@flighthq/types:interface#MovieClipData` | 1 | 1 | 0 | `createMovieClipData` |
| `@flighthq/types:interface#NativeTextData` | 1 | 1 | 0 | `createNativeTextData` |
| `@flighthq/types:interface#NetBackend` | 1 | 1 | 0 | `createWebNetBackend` |
| `@flighthq/types:interface#NodeInteractionState` | 1 | 1 | 0 | `createNodeInteractionState` |
| `@flighthq/types:interface#NodeSignals` | 1 | 1 | 0 | `createNodeSignals` |
| `@flighthq/types:interface#Notification` | 1 | 1 | 0 | `createNotificationResource` |
| `@flighthq/types:interface#Obb` | 1 | 1 | 0 | `createObb` |
| `@flighthq/types:interface#OrbitCameraController` | 1 | 1 | 0 | `createOrbitCameraController` |
| `@flighthq/types:interface#OrientationReading` | 1 | 1 | 0 | `createOrientationReading` |
| `@flighthq/types:interface#OuterGlowEffect` | 1 | 1 | 0 | `createOuterGlowEffect` |
| `@flighthq/types:interface#OutlineEffect` | 1 | 1 | 0 | `createOutlineEffect` |
| `@flighthq/types:interface#PanniniProjectionEffect` | 1 | 1 | 0 | `createPanniniProjectionEffect` |
| `@flighthq/types:interface#ParticleEmitterConfig` | 1 | 1 | 0 | `createParticleEmitterConfig` |
| `@flighthq/types:interface#ParticleEmitterData` | 1 | 1 | 0 | `createParticleEmitterData` |
| `@flighthq/types:interface#ParticleEmitterSignals` | 1 | 1 | 0 | `createParticleEmitterSignals` |
| `@flighthq/types:interface#ParticleEmitterState` | 1 | 1 | 0 | `createParticleEmitterState` |
| `@flighthq/types:interface#ParticleObjectsState` | 1 | 1 | 0 | `createParticleObjectsState` |
| `@flighthq/types:interface#Path` | 8 | 8 | 0 | `<anonymous>`, `compactStrokePath`, `copyPath`, `createPath`, `createScratchPath` |
| `@flighthq/types:interface#PathBooleanBackend` | 1 | 1 | 0 | `createMartinezPathBooleanBackend` |
| `@flighthq/types:interface#PathMorph` | 2 | 2 | 0 | `<anonymous>`, `createPathMorph` |
| `@flighthq/types:interface#PhotoCaptureDialogBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#Physics2DAbi` | 1 | 1 | 0 | `createReferencePhysics2DAbi` |
| `@flighthq/types:interface#Physics2DAbiBodyBuffer` | 1 | 1 | 0 | `createPhysics2DAbiBodyBuffer` |
| `@flighthq/types:interface#Physics2DAbiCommandBuffer` | 1 | 1 | 0 | `createPhysics2DAbiCommandBuffer` |
| `@flighthq/types:interface#Physics2DAbiContactBuffer` | 1 | 1 | 0 | `createPhysics2DAbiContactBuffer` |
| `@flighthq/types:interface#Physics2DAbiExecutionResult` | 1 | 1 | 0 | `createPhysics2DAbiExecutionResult` |
| `@flighthq/types:interface#Physics2DAbiJointBuffer` | 1 | 1 | 0 | `createPhysics2DAbiJointBuffer` |
| `@flighthq/types:interface#Physics2DAbiQueryBuffer` | 1 | 1 | 0 | `createPhysics2DAbiQueryBuffer` |
| `@flighthq/types:interface#Physics2DCollider` | 2 | 2 | 0 | `createPhysics2DCollider`, `createShapeCastProbe` |
| `@flighthq/types:interface#Physics2DDebugGeometry` | 1 | 1 | 0 | `createPhysics2DDebugGeometry` |
| `@flighthq/types:interface#Physics2DDistanceJoint` | 1 | 1 | 0 | `createPhysics2DDistanceJoint` |
| `@flighthq/types:interface#Physics2DGearJoint` | 1 | 1 | 0 | `createPhysics2DGearJoint` |
| `@flighthq/types:interface#Physics2DJointReaction` | 1 | 1 | 0 | `createPhysics2DJointReaction` |
| `@flighthq/types:interface#Physics2DMouseJoint` | 1 | 1 | 0 | `createPhysics2DMouseJoint` |
| `@flighthq/types:interface#Physics2DPrismaticJoint` | 1 | 1 | 0 | `createPhysics2DPrismaticJoint` |
| `@flighthq/types:interface#Physics2DPulleyJoint` | 1 | 1 | 0 | `createPhysics2DPulleyJoint` |
| `@flighthq/types:interface#Physics2DQueryResult` | 1 | 1 | 0 | `createPhysics2DQueryResult` |
| `@flighthq/types:interface#Physics2DRayResult` | 1 | 1 | 0 | `createPhysics2DRayResult` |
| `@flighthq/types:interface#Physics2DRevoluteJoint` | 1 | 1 | 0 | `createPhysics2DRevoluteJoint` |
| `@flighthq/types:interface#Physics2DRopeJoint` | 1 | 1 | 0 | `createPhysics2DRopeJoint` |
| `@flighthq/types:interface#Physics2DShapeCastResult` | 1 | 1 | 0 | `createPhysics2DShapeCastResult` |
| `@flighthq/types:interface#Physics2DWeldJoint` | 1 | 1 | 0 | `createPhysics2DWeldJoint` |
| `@flighthq/types:interface#Physics2DWheelJoint` | 1 | 1 | 0 | `createPhysics2DWheelJoint` |
| `@flighthq/types:interface#Physics2DWorld` | 1 | 1 | 0 | `createPhysics2DWorld` |
| `@flighthq/types:interface#Physics3DAbi` | 1 | 1 | 0 | `createReferencePhysics3DAbi` |
| `@flighthq/types:interface#Physics3DAbiBodyBuffer` | 1 | 1 | 0 | `createPhysics3DAbiBodyBuffer` |
| `@flighthq/types:interface#Physics3DAbiCommandBuffer` | 1 | 1 | 0 | `createPhysics3DAbiCommandBuffer` |
| `@flighthq/types:interface#Physics3DAbiContactBuffer` | 1 | 1 | 0 | `createPhysics3DAbiContactBuffer` |
| `@flighthq/types:interface#Physics3DAbiExecutionResult` | 1 | 1 | 0 | `createPhysics3DAbiExecutionResult` |
| `@flighthq/types:interface#Physics3DAbiJointBuffer` | 1 | 1 | 0 | `createPhysics3DAbiJointBuffer` |
| `@flighthq/types:interface#Physics3DAbiQueryBuffer` | 1 | 1 | 0 | `createPhysics3DAbiQueryBuffer` |
| `@flighthq/types:interface#Physics3DCollider` | 2 | 2 | 0 | `createPhysics3DCollider`, `createShapeCastProbe` |
| `@flighthq/types:interface#Physics3DConeTwistJoint` | 1 | 1 | 0 | `createPhysics3DConeTwistJoint` |
| `@flighthq/types:interface#Physics3DContact` | 1 | 1 | 0 | `createPhysics3DContact` |
| `@flighthq/types:interface#Physics3DContactConstraint` | 1 | 1 | 0 | `createPhysics3DContactConstraint` |
| `@flighthq/types:interface#Physics3DContactConstraintPoint` | 1 | 1 | 0 | `createPhysics3DContactConstraintPoint` |
| `@flighthq/types:interface#Physics3DContactPoint` | 1 | 1 | 0 | `createPhysics3DContactPoint` |
| `@flighthq/types:interface#Physics3DDebugGeometry` | 1 | 1 | 0 | `createPhysics3DDebugGeometry` |
| `@flighthq/types:interface#Physics3DDistanceJoint` | 1 | 1 | 0 | `createPhysics3DDistanceJoint` |
| `@flighthq/types:interface#Physics3DGeneric6DofJoint` | 1 | 1 | 0 | `createPhysics3DGeneric6DofJoint` |
| `@flighthq/types:interface#Physics3DHingeJoint` | 1 | 1 | 0 | `createPhysics3DHingeJoint` |
| `@flighthq/types:interface#Physics3DJoint` | 1 | 1 | 0 | `createPhysics3DBallAndSocketJoint` |
| `@flighthq/types:interface#Physics3DJointReaction` | 1 | 1 | 0 | `createPhysics3DJointReaction` |
| `@flighthq/types:interface#Physics3DMassData` | 2 | 2 | 0 | `<anonymous>`, `createPhysics3DMassData` |
| `@flighthq/types:interface#Physics3DQueryResult` | 1 | 1 | 0 | `createPhysics3DQueryResult` |
| `@flighthq/types:interface#Physics3DRayResult` | 1 | 1 | 0 | `createPhysics3DRayResult` |
| `@flighthq/types:interface#Physics3DShapeCastResult` | 1 | 1 | 0 | `createPhysics3DShapeCastResult` |
| `@flighthq/types:interface#Physics3DSliderJoint` | 1 | 1 | 0 | `createPhysics3DSliderJoint` |
| `@flighthq/types:interface#Physics3DWorld` | 1 | 1 | 0 | `createPhysics3DWorld` |
| `@flighthq/types:interface#PixelateEffect` | 1 | 1 | 0 | `createPixelateEffect` |
| `@flighthq/types:interface#Plane` | 1 | 1 | 0 | `createPlane` |
| `@flighthq/types:interface#PlatformBackend` | 3 | 3 | 0 | `createElectronPlatformBackend`, `createTauriPlatformBackend`, `createWebPlatformBackend` |
| `@flighthq/types:interface#PlatformInfo` | 1 | 1 | 0 | `createPlatformInfo` |
| `@flighthq/types:interface#PointLight` | 2 | 2 | 0 | `clonePointLight`, `createPointLight` |
| `@flighthq/types:interface#PosterizeEffect` | 1 | 1 | 0 | `createPosterizeEffect` |
| `@flighthq/types:interface#Power` | 1 | 1 | 0 | `createPower` |
| `@flighthq/types:interface#PowerBatteryHealthBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#PowerChangeBackend` | 2 | 2 | 0 | `<anonymous>`, `createWebPowerReadings` |
| `@flighthq/types:interface#PowerIdleBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#PowerKeepAwakeBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#PowerSessionLockBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#PowerStatusBackend` | 2 | 2 | 0 | `<anonymous>`, `createWebPowerReadings` |
| `@flighthq/types:interface#PowerSuspensionBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#PowerThermalBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#PressureReading` | 1 | 1 | 0 | `createPressureReading` |
| `@flighthq/types:interface#PromptDialogBackend` | 2 | 2 | 0 | `createCapacitorPromptDialogBackend`, `createWebPromptDialogBackend` |
| `@flighthq/types:interface#ProtocolDefaultBackend` | 1 | 1 | 0 | `createElectronProtocolCapabilities` |
| `@flighthq/types:interface#ProtocolHandler` | 1 | 1 | 0 | `createProtocolHandler` |
| `@flighthq/types:interface#ProtocolLaunchBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ProtocolOpenBackend` | 2 | 2 | 0 | `createElectronProtocolCapabilities`, `initializeCapacitorProtocolCapabilities` |
| `@flighthq/types:interface#ProtocolRegistrationBackend` | 2 | 2 | 0 | `<anonymous>`, `createElectronProtocolCapabilities` |
| `@flighthq/types:interface#ProtocolRegistrationQueryBackend` | 1 | 1 | 0 | `createElectronProtocolCapabilities` |
| `@flighthq/types:interface#ProtocolUnregistrationBackend` | 1 | 1 | 0 | `createElectronProtocolCapabilities` |
| `@flighthq/types:interface#ProximityReading` | 1 | 1 | 0 | `createProximityReading` |
| `@flighthq/types:interface#QuadBatchData` | 1 | 1 | 0 | `createQuadBatchData` |
| `@flighthq/types:interface#QuadBatchSignals` | 1 | 1 | 0 | `createQuadBatchSignals` |
| `@flighthq/types:interface#Quaternion` | 1 | 1 | 0 | `createQuaternion` |
| `@flighthq/types:interface#QuaternionReading` | 1 | 1 | 0 | `createQuaternionReading` |
| `@flighthq/types:interface#RadialBlurEffect` | 1 | 1 | 0 | `createRadialBlurEffect` |
| `@flighthq/types:interface#Raster2DSurface` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#Raster2DSurfaceProvider` | 1 | 1 | 0 | `createWebRaster2DSurfaceProvider` |
| `@flighthq/types:interface#Ray3D` | 1 | 1 | 0 | `createRay3D` |
| `@flighthq/types:interface#Rectangle` | 1 | 1 | 0 | `createRectangle` |
| `@flighthq/types:interface#RegionAttachment2D` | 3 | 3 | 0 | `parseDragonBonesRegionDisplay`, `parseSpineRegionAttachment`, `readSpineBinaryRegionAttachment` |
| `@flighthq/types:interface#RegistryCatalog` | 1 | 1 | 0 | `createRegistryCatalog` |
| `@flighthq/types:interface#RemoveNodeChildCommand` | 1 | 1 | 0 | `createRemoveNodeChildCommand` |
| `@flighthq/types:interface#RenderCache` | 1 | 1 | 0 | `createRenderCache` |
| `@flighthq/types:interface#RenderContextBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#RenderProxy` | 1 | 1 | 0 | `createRenderProxy` |
| `@flighthq/types:interface#RenderQueue` | 1 | 1 | 0 | `createRenderQueue` |
| `@flighthq/types:interface#RenderState` | 1 | 1 | 0 | `createRenderState` |
| `@flighthq/types:interface#RenderSurfaceBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#RenderTarget` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#RenderViewport2D` | 1 | 1 | 0 | `createRenderViewport2D` |
| `@flighthq/types:interface#ReorderNodeChildCommand` | 1 | 1 | 0 | `createReorderNodeChildCommand` |
| `@flighthq/types:interface#RequirementSet` | 1 | 1 | 0 | `createRequirementSet` |
| `@flighthq/types:interface#ResourceLoaderItemSignals` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#RichTextContent` | 1 | 1 | 0 | `createRichTextContent` |
| `@flighthq/types:interface#RigidBody2D` | 1 | 1 | 0 | `createRigidBody2D` |
| `@flighthq/types:interface#RigidBody3D` | 1 | 1 | 0 | `createRigidBody3D` |
| `@flighthq/types:interface#RimModifier` | 1 | 1 | 0 | `createRimModifier` |
| `@flighthq/types:interface#RiveDocumentImportResult` | 2 | 2 | 0 | `<anonymous>`, `createScene2DFromRiveDocument` |
| `@flighthq/types:interface#RiveObjectGraph` | 1 | 1 | 0 | `createRiveObjectGraph` |
| `@flighthq/types:interface#RiveScene2DDocumentResult` | 1 | 1 | 0 | `createScene2DDocumentFromRiveDocument` |
| `@flighthq/types:interface#RiveSkeleton2DImport` | 1 | 1 | 0 | `createRiveSkeleton2D` |
| `@flighthq/types:interface#RotationRateReading` | 1 | 1 | 0 | `createRotationRateReading` |
| `@flighthq/types:interface#SafeAreaInsets` | 2 | 2 | 0 | `createSafeAreaInsets`, `readInsets` |
| `@flighthq/types:interface#Sampler` | 2 | 2 | 0 | `cloneSampler`, `createSampler` |
| `@flighthq/types:interface#Scale9ShapeData` | 1 | 1 | 0 | `createScale9ShapeData` |
| `@flighthq/types:interface#Scale9SpriteData` | 1 | 1 | 0 | `createScale9SpriteData` |
| `@flighthq/types:interface#ScanlinesEffect` | 1 | 1 | 0 | `createScanlinesEffect` |
| `@flighthq/types:interface#Scene2D` | 1 | 1 | 0 | `createScene2D` |
| `@flighthq/types:interface#Scene2DDocument` | 1 | 1 | 0 | `createScene2DDocument` |
| `@flighthq/types:interface#Scene2DDocumentImporterRegistry` | 1 | 1 | 0 | `createScene2DDocumentImporterRegistry` |
| `@flighthq/types:interface#Scene2DSignals` | 1 | 1 | 0 | `createScene2DSignals` |
| `@flighthq/types:interface#Scene2DSlotReference` | 2 | 2 | 0 | `<anonymous>`, `createScene2DSlotReference` |
| `@flighthq/types:interface#Scene3D` | 1 | 1 | 0 | `createScene3D` |
| `@flighthq/types:interface#Scene3DHit` | 1 | 1 | 0 | `createScene3DHit` |
| `@flighthq/types:interface#Scene3DKindUsage` | 1 | 1 | 0 | `createScene3DKindUsage` |
| `@flighthq/types:interface#Scene3DLights` | 1 | 1 | 0 | `createScene3DLights` |
| `@flighthq/types:interface#Scene3DMaterialTextureRegistry` | 1 | 1 | 0 | `createScene3DMaterialTextureRegistry` |
| `@flighthq/types:interface#Scene3DResourceResolverWithRuntime` | 1 | 1 | 0 | `createScene3DResourceResolver` |
| `@flighthq/types:interface#Scene3DResourceSignals` | 1 | 1 | 0 | `createScene3DResourceSignals` |
| `@flighthq/types:interface#ScheduledNotification` | 1 | 1 | 0 | `createScheduledNotificationResource` |
| `@flighthq/types:interface#ScreenChangeBackend` | 2 | 2 | 0 | `<anonymous>`, `createElectronScreenCapabilities` |
| `@flighthq/types:interface#ScreenDetailsBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ScreenInfo` | 2 | 2 | 0 | `createScreenInfo`, `emptyScreenInfo` |
| `@flighthq/types:interface#ScreenMode` | 1 | 1 | 0 | `createScreenMode` |
| `@flighthq/types:interface#ScreenPermissionChange` | 1 | 1 | 0 | `createScreenPermissionChange` |
| `@flighthq/types:interface#ScreenPermissionChangeBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ScreenQueryBackend` | 2 | 2 | 0 | `<anonymous>`, `createElectronScreenCapabilities` |
| `@flighthq/types:interface#ScreenSignals` | 1 | 1 | 0 | `createScreenSignals` |
| `@flighthq/types:interface#ScreenSpaceFogEffect` | 1 | 1 | 0 | `createScreenSpaceFogEffect` |
| `@flighthq/types:interface#SelectableRichTextManager` | 1 | 1 | 0 | `createSelectableRichTextManager` |
| `@flighthq/types:interface#Sensors` | 1 | 1 | 0 | `createSensors` |
| `@flighthq/types:interface#SensorsBackend` | 1 | 1 | 0 | `createWebSensorsBackend` |
| `@flighthq/types:interface#SepiaAdjustment` | 1 | 1 | 0 | `createSepiaAdjustment` |
| `@flighthq/types:interface#SetNodePropertyCommand` | 3 | 3 | 0 | `createSetNodePropertyCommand`, `createSetNodePropertyCommandBatch`, `merge` |
| `@flighthq/types:interface#ShadedMaterial` | 1 | 1 | 0 | `createShadedMaterial` |
| `@flighthq/types:interface#ShapeData` | 1 | 1 | 0 | `createShapeData` |
| `@flighthq/types:interface#ShareContentBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ShareFilesBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ShareSignals` | 1 | 1 | 0 | `enableShareSignals` |
| `@flighthq/types:interface#SharpenEffect` | 1 | 1 | 0 | `createSharpenEffect` |
| `@flighthq/types:interface#SheenPbrExtension` | 1 | 1 | 0 | `createSheenPbrExtension` |
| `@flighthq/types:interface#ShellBeepBackend` | 1 | 1 | 0 | `makeElectronShellCapabilities` |
| `@flighthq/types:interface#ShellExternalBackend` | 3 | 3 | 0 | `<anonymous>`, `makeTauriShellCapabilities` |
| `@flighthq/types:interface#ShellPathOpenBackend` | 2 | 2 | 0 | `<anonymous>`, `makeTauriShellCapabilities` |
| `@flighthq/types:interface#ShellPathRevealBackend` | 2 | 2 | 0 | `<anonymous>`, `makeTauriShellCapabilities` |
| `@flighthq/types:interface#ShellShortcutLinkBackend` | 1 | 1 | 0 | `createElectronShellShortcutLinkBackend` |
| `@flighthq/types:interface#ShellTrashBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ShortcutQueryBackend` | 2 | 2 | 0 | `createElectronShortcutQueryBackend`, `createTauriShortcutQueryBackend` |
| `@flighthq/types:interface#ShortcutTriggerBackend` | 2 | 2 | 0 | `<anonymous>`, `createTauriShortcutTriggerBackend` |
| `@flighthq/types:interface#SignalScope` | 1 | 1 | 0 | `createSignalScope` |
| `@flighthq/types:interface#Skeleton2D` | 2 | 2 | 0 | `cloneSkeleton2D`, `createSkeleton2D` |
| `@flighthq/types:interface#Skeleton2DAnimationTarget` | 1 | 1 | 0 | `createSkeleton2DBoneAnimationTarget` |
| `@flighthq/types:interface#Skeleton2DSlotAnimationTarget` | 1 | 1 | 0 | `createSkeleton2DSlotAnimationTarget` |
| `@flighthq/types:interface#Skeleton3D` | 4 | 4 | 0 | `<anonymous>`, `cloneSkeleton3D`, `cloneSkeleton3DJointHierarchy`, `createSkeleton3D` |
| `@flighthq/types:interface#SketchEffect` | 1 | 1 | 0 | `createSketchEffect` |
| `@flighthq/types:interface#Skin2D` | 1 | 1 | 0 | `createSkin2D` |
| `@flighthq/types:interface#SmaaEffect` | 1 | 1 | 0 | `createSmaaEffect` |
| `@flighthq/types:interface#Socket` | 1 | 1 | 0 | `createSocket` |
| `@flighthq/types:interface#SocketSignals` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#SoftKeyboardAccessoryBarBackend` | 1 | 1 | 0 | `createCapacitorSoftKeyboardAccessoryBarBackend` |
| `@flighthq/types:interface#SoftKeyboardChangeBackend` | 2 | 2 | 0 | `createCapacitorSoftKeyboardChangeBackend`, `createWebSoftKeyboardChangeBackend` |
| `@flighthq/types:interface#SoftKeyboardInfoBackend` | 2 | 2 | 0 | `createCapacitorSoftKeyboardInfoBackend`, `createWebSoftKeyboardInfoBackend` |
| `@flighthq/types:interface#SoftKeyboardResizeModeWriteBackend` | 1 | 1 | 0 | `createCapacitorSoftKeyboardResizeModeWriteBackend` |
| `@flighthq/types:interface#SoftKeyboardScrollAssistBackend` | 1 | 1 | 0 | `createCapacitorSoftKeyboardScrollAssistBackend` |
| `@flighthq/types:interface#SoftKeyboardStyleBackend` | 1 | 1 | 0 | `createCapacitorSoftKeyboardStyleBackend` |
| `@flighthq/types:interface#SoftKeyboardVisibilityBackend` | 2 | 2 | 0 | `createCapacitorSoftKeyboardVisibilityBackend`, `createWebSoftKeyboardVisibilityBackend` |
| `@flighthq/types:interface#SpatialIndex2D` | 1 | 1 | 0 | `createSpatialIndex2D` |
| `@flighthq/types:interface#SpatialIndex3D` | 1 | 1 | 0 | `createSpatialIndex3D` |
| `@flighthq/types:interface#SpecularPbrExtension` | 1 | 1 | 0 | `createSpecularPbrExtension` |
| `@flighthq/types:interface#SpotLight` | 2 | 2 | 0 | `cloneSpotLight`, `createSpotLight` |
| `@flighthq/types:interface#Spring` | 1 | 1 | 0 | `createSpring` |
| `@flighthq/types:interface#Spring2D` | 1 | 1 | 0 | `createSpring2D` |
| `@flighthq/types:interface#Spring3D` | 1 | 1 | 0 | `createSpring3D` |
| `@flighthq/types:interface#SpringConfig` | 5 | 5 | 0 | `<anonymous>`, `createSpringConfig`, `createSpringConfigFromPhysical` |
| `@flighthq/types:interface#SpriteData` | 1 | 1 | 0 | `createSpriteData` |
| `@flighthq/types:interface#SpriteIdentityRendererData` | 1 | 1 | 0 | `createSpriteRendererData` |
| `@flighthq/types:interface#Spritesheet` | 2 | 2 | 0 | `cloneSpritesheet`, `createSpritesheet` |
| `@flighthq/types:interface#SpritesheetAnimation` | 1 | 1 | 0 | `createSpritesheetAnimation` |
| `@flighthq/types:interface#SpritesheetAnimationData` | 1 | 1 | 0 | `createSpritesheetAnimationData` |
| `@flighthq/types:interface#SpritesheetData` | 1 | 1 | 0 | `createSpritesheetData` |
| `@flighthq/types:interface#SpritesheetFrame` | 1 | 1 | 0 | `createSpritesheetFrame` |
| `@flighthq/types:interface#SpritesheetFrameData` | 1 | 1 | 0 | `createSpritesheetFrameData` |
| `@flighthq/types:interface#SpritesheetPlayer` | 2 | 2 | 0 | `cloneSpritesheetPlayer`, `createSpritesheetPlayer` |
| `@flighthq/types:interface#SsaoEffect` | 1 | 1 | 0 | `createSsaoEffect` |
| `@flighthq/types:interface#SsrEffect` | 1 | 1 | 0 | `createSsrEffect` |
| `@flighthq/types:interface#StandardMaterial` | 1 | 1 | 0 | `createStandardMaterial` |
| `@flighthq/types:interface#StatechartInstance` | 1 | 1 | 0 | `createStatechartInstance` |
| `@flighthq/types:interface#StatechartSignals` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#StatusBar` | 1 | 1 | 0 | `createStatusBar` |
| `@flighthq/types:interface#StatusBarInfo` | 1 | 1 | 0 | `createStatusBarInfo` |
| `@flighthq/types:interface#StorageBackend` | 1 | 1 | 0 | `createElectronStorageBackend` |
| `@flighthq/types:interface#StoragePersistenceQueryBackend` | 1 | 1 | 0 | `createPersistenceQueryBackend` |
| `@flighthq/types:interface#StoragePersistenceRequestBackend` | 1 | 1 | 0 | `createWebWindowStoragePersistenceCapabilities` |
| `@flighthq/types:interface#StorageSignals` | 1 | 1 | 0 | `createStorageSignals` |
| `@flighthq/types:interface#SwfDocumentImport` | 1 | 1 | 0 | `createScene2DImportFromSwf` |
| `@flighthq/types:interface#TaaEffect` | 1 | 1 | 0 | `createTaaEffect` |
| `@flighthq/types:interface#TextFieldSignals` | 1 | 1 | 0 | `createTextFieldSignals` |
| `@flighthq/types:interface#TextFormatRange` | 1 | 1 | 0 | `createTextFormatRange` |
| `@flighthq/types:interface#TextInputManager` | 1 | 1 | 0 | `createTextInputManager` |
| `@flighthq/types:interface#TextLabelData` | 1 | 1 | 0 | `createTextLabelData` |
| `@flighthq/types:interface#TextLayoutGroup` | 1 | 1 | 0 | `createTextLayoutGroup` |
| `@flighthq/types:interface#TextLayoutResult` | 1 | 1 | 0 | `createTextLayoutResult` |
| `@flighthq/types:interface#TextMetrics` | 1 | 1 | 0 | `createTextMetrics` |
| `@flighthq/types:interface#TextSegmenterBackend` | 1 | 1 | 0 | `createWebTextSegmenterBackend` |
| `@flighthq/types:interface#TextShaperCache` | 1 | 1 | 0 | `createTextShaperCache` |
| `@flighthq/types:interface#TextShaperSignals` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#Texture2D` | 2 | 2 | 0 | `cloneTexture`, `createTexture2D` |
| `@flighthq/types:interface#TextureAtlas` | 1 | 1 | 0 | `createTextureAtlas` |
| `@flighthq/types:interface#TextureAtlasRegion` | 1 | 1 | 0 | `createTextureAtlasRegion` |
| `@flighthq/types:interface#TilemapData` | 1 | 1 | 0 | `createTilemapData` |
| `@flighthq/types:interface#TilemapSignals` | 1 | 1 | 0 | `createTilemapSignals` |
| `@flighthq/types:interface#TiltShiftEffect` | 1 | 1 | 0 | `createTiltShiftEffect` |
| `@flighthq/types:interface#Timeline` | 1 | 1 | 0 | `createTimeline` |
| `@flighthq/types:interface#TimelineAudioCue` | 1 | 1 | 0 | `createSwfAudioCue` |
| `@flighthq/types:interface#TimelineSource` | 3 | 3 | 0 | `createSpritesheetTimelineSource`, `createSwfTimelineSource`, `createTimelineSource` |
| `@flighthq/types:interface#TimelineStreamAudioCue` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TintAdjustment` | 1 | 1 | 0 | `createTintAdjustment` |
| `@flighthq/types:interface#TintMaterialData` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#ToneMapEffect` | 1 | 1 | 0 | `createToneMapEffect` |
| `@flighthq/types:interface#ToonModifier` | 1 | 1 | 0 | `createToonModifier` |
| `@flighthq/types:interface#Transform2D` | 1 | 1 | 0 | `createTransform2D` |
| `@flighthq/types:interface#Transform3D` | 1 | 1 | 0 | `createTransform3D` |
| `@flighthq/types:interface#TransmissionVolumePbrExtension` | 1 | 1 | 0 | `createTransmissionVolumePbrExtension` |
| `@flighthq/types:interface#TrayBalloonBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayBalloonEventsBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayBoundsBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayDoubleClickPolicyBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayDropEventsBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayImageBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayInteractionEventsBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayLifecycleBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayMenuBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayMenuSelectionEventsBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayPopupMenuBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayPressedImageBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayTemplateImageBackend` | 2 | 2 | 0 | `<anonymous>`, `createTauriTrayCapabilities` |
| `@flighthq/types:interface#TrayTitleBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TrayTooltipBackend` | 2 | 2 | 0 | `<anonymous>` |
| `@flighthq/types:interface#TweenManager` | 1 | 1 | 0 | `createTweenManager` |
| `@flighthq/types:interface#UpdaterCommandBackend` | 1 | 1 | 0 | `createElectronUpdaterBackend` |
| `@flighthq/types:interface#Vector2` | 1 | 1 | 0 | `createVector2` |
| `@flighthq/types:interface#Vector3` | 1 | 1 | 0 | `createVector3` |
| `@flighthq/types:interface#Vector4` | 1 | 1 | 0 | `createVector4` |
| `@flighthq/types:interface#VelocityField` | 1 | 1 | 0 | `createVelocityField` |
| `@flighthq/types:interface#VertexDisplaceModifier` | 1 | 1 | 0 | `createVertexDisplaceModifier` |
| `@flighthq/types:interface#VideoCaptureDialogBackend` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#VideoResource` | 1 | 1 | 0 | `createVideoResource` |
| `@flighthq/types:interface#Viewport` | 1 | 1 | 0 | `createViewport` |
| `@flighthq/types:interface#VignetteEffect` | 1 | 1 | 0 | `createVignetteEffect` |
| `@flighthq/types:interface#VolumetricLightEffect` | 1 | 1 | 0 | `createVolumetricLightEffect` |
| `@flighthq/types:interface#WebWindowStoragePersistenceCapabilities` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#WebWorkerStoragePersistenceCapabilities` | 1 | 1 | 0 | `createWebWorkerStoragePersistenceCapabilities` |
| `@flighthq/types:interface#WgpuBindGroupLayouts` | 1 | 1 | 0 | `createWgpuBindGroupLayouts` |
| `@flighthq/types:interface#WgpuDeviceState` | 1 | 1 | 0 | `createWgpuDeviceState` |
| `@flighthq/types:interface#WgpuFullscreenPipeline` | 1 | 1 | 0 | `createWgpuFullscreenPipeline` |
| `@flighthq/types:interface#WgpuHostAcquisition` | 2 | 2 | 0 | `<anonymous>`, `createWgpuAcquisitionFromCanvasElement` |
| `@flighthq/types:interface#WgpuHostBackend` | 1 | 1 | 0 | `createWebWgpuHostBackend` |
| `@flighthq/types:interface#WgpuMeshPipeline` | 1 | 1 | 0 | `createWgpuMeshPipeline` |
| `@flighthq/types:interface#WgpuPipeline` | 1 | 1 | 0 | `createWgpuPipeline` |
| `@flighthq/types:interface#WgpuRenderEffectPipeline` | 1 | 1 | 0 | `createWgpuRenderEffectPipeline` |
| `@flighthq/types:interface#WgpuRenderRegistries` | 1 | 1 | 0 | `createEmptyWgpuRegistries` |
| `@flighthq/types:interface#WgpuRenderSurfaceProvider` | 1 | 1 | 0 | `createWebWgpuRenderSurfaceProvider` |
| `@flighthq/types:interface#WgpuRenderTarget` | 1 | 1 | 0 | `createWgpuRenderTarget` |
| `@flighthq/types:interface#WgpuRenderTexturePool` | 1 | 1 | 0 | `createWgpuRenderTexturePool` |
| `@flighthq/types:interface#WgpuTextureEntry` | 7 | 7 | 0 | `<anonymous>`, `bindWgpuTexture`, `createWgpuTextureEntry`, `uploadWgpuBitmapEntry`, `uploadWgpuCompressedImage`, `uploadWgpuImageResourceEntry` |
| `@flighthq/types:interface#WgpuVideoTextureEntry` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:interface#WhiteBalanceEffect` | 1 | 1 | 0 | `createWhiteBalanceEffect` |
| `@flighthq/types:interface#WrappedDiffusePbrExtension` | 1 | 1 | 0 | `createWrappedDiffusePbrExtension` |
| `@flighthq/types:type#CapacitorAndroidAppCapabilities` | 1 | 1 | 0 | `createCapacitorAppCapabilities` |
| `@flighthq/types:type#CapacitorCommonAppCapabilities` | 1 | 1 | 0 | `createCapacitorAppCapabilities` |
| `@flighthq/types:type#CapacitorNotificationCapabilities` | 1 | 1 | 0 | `createCapacitorNotificationCapabilities` |
| `@flighthq/types:type#CapacitorProtocolCapabilities` | 1 | 1 | 0 | `createCapacitorProtocolCapabilities` |
| `@flighthq/types:type#ElectronCommonAppCapabilities` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:type#ElectronLinuxAppCapabilities` | 1 | 1 | 0 | `createElectronAppCapabilities` |
| `@flighthq/types:type#ElectronMacosAppCapabilities` | 1 | 1 | 0 | `createElectronAppCapabilities` |
| `@flighthq/types:type#ElectronMacosNotificationCapabilities` | 1 | 1 | 0 | `createElectronNotificationCapabilities` |
| `@flighthq/types:type#ElectronMenuCapabilities` | 1 | 1 | 0 | `createElectronMenuBackends` |
| `@flighthq/types:type#ElectronNotificationCapabilities` | 1 | 1 | 0 | `createElectronNotificationCapabilities` |
| `@flighthq/types:type#ElectronPowerCapabilities` | 1 | 1 | 0 | `createElectronPowerBackends` |
| `@flighthq/types:type#ElectronProtocolCapabilities` | 1 | 1 | 0 | `createElectronProtocolCapabilities` |
| `@flighthq/types:type#ElectronWindowsAppCapabilities` | 1 | 1 | 0 | `createElectronAppCapabilities` |
| `@flighthq/types:type#FullscreenTargetHandle` | 1 | 1 | 0 | `createWebFullscreenTargetHandle` |
| `@flighthq/types:type#GlBitmapShader` | 3 | 3 | 0 | `<anonymous>`, `createDefaultGlBitmapShader`, `createGlBitmapShader` |
| `@flighthq/types:type#Physics3DFixedJoint` | 1 | 1 | 0 | `createPhysics3DFixedJoint` |
| `@flighthq/types:type#RenderCacheAdapter` | 1 | 1 | 0 | `createRenderCacheAdapter` |
| `@flighthq/types:type#TauriAppCapabilities` | 1 | 1 | 0 | `createTauriAppCapabilities` |
| `@flighthq/types:type#TauriMenuCapabilities` | 1 | 1 | 0 | `createTauriMenuBackends` |
| `@flighthq/types:type#TauriNotificationCapabilities` | 1 | 1 | 0 | `createTauriNotificationCapabilities` |
| `@flighthq/types:type#WebMidiAccessCapabilities` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:type#WebMidiPermissionAccessCapabilities` | 1 | 1 | 0 | `createWebMidiProfile` |
| `@flighthq/types:type#WebPageNotificationCapabilities` | 1 | 1 | 0 | `createWebPageNotificationCapabilities` |
| `@flighthq/types:type#WebPowerCapabilities` | 1 | 1 | 0 | `<anonymous>` |
| `@flighthq/types:type#WebPowerReadingCapabilities` | 1 | 1 | 0 | `createWebPowerReadings` |
| `@flighthq/types:type#WebScreenCapabilities` | 1 | 1 | 0 | `createWebScreenCapabilities` |
| `@flighthq/types:type#WebServiceWorkerNotificationCapabilities` | 1 | 1 | 0 | `createWebServiceWorkerNotificationCapabilities` |
| `@flighthq/types:type#WgpuEffectPipeline` | 7 | 7 | 0 | `createWgpuDualSourceEffectPipeline`, `createWgpuEffectPipeline`, `getApplyPipeline`, `getBitmapDisplacementPipeline`, `getEncodePipeline`, `getLookupPipeline`, `getLutPipeline` |
| `@flighthq/types:type#WgpuRenderTargetPool` | 1 | 1 | 0 | `createWgpuRenderTargetPool` |
| `@flighthq/types:type#WindowResizeTargetHandle` | 1 | 1 | 0 | `createWebWindowResizeTargetHandle` |

## Sites

| Source | Factory | Destination | Route | Argument | Fields | Status | Normalizations | Blockers |
| --- | --- | --- | --- | --- | ---: | :---: | --- | --- |
| `upstream/packages/adjustments/src/brightnessContrastAdjustment.ts:9:15` | `createBrightnessContrastAdjustment` | `@flighthq/types:interface#BrightnessContrastAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/channelMixerAdjustment.ts:12:15` | `createChannelMixerAdjustment` | `@flighthq/types:interface#ChannelMixerAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/colorBlindSimulationAdjustment.ts:14:15` | `createColorBlindSimulationAdjustment` | `@flighthq/types:interface#ColorBlindSimulationAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/colorGradeAdjustment.ts:14:15` | `createColorGradeAdjustment` | `@flighthq/types:interface#ColorGradeAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/colorLutCache.ts:42:15` | `createColorLutCache` | `@flighthq/types:interface#ColorLutCache` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/colorMatrixAdjustment.ts:11:15` | `createColorMatrixAdjustment` | `@flighthq/types:interface#ColorMatrixAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/colorScaleBiasAdjustment.ts:7:15` | `createColorScaleBiasAdjustment` | `@flighthq/types:interface#ColorScaleBiasAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/exposureAdjustment.ts:9:15` | `createExposureAdjustment` | `@flighthq/types:interface#ExposureAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/grayscaleAdjustment.ts:9:15` | `createGrayscaleAdjustment` | `@flighthq/types:interface#GrayscaleAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/hueSaturationAdjustment.ts:14:15` | `createHueSaturationAdjustment` | `@flighthq/types:interface#HueSaturationAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/invertAdjustment.ts:9:15` | `createInvertAdjustment` | `@flighthq/types:interface#InvertAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/liftGammaGainAdjustment.ts:14:15` | `createLiftGammaGainAdjustment` | `@flighthq/types:interface#LiftGammaGainAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/lookupTableGradeAdjustment.ts:15:15` | `createLookupTableGradeAdjustment` | `@flighthq/types:interface#LookupTableGradeAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/sepiaAdjustment.ts:9:15` | `createSepiaAdjustment` | `@flighthq/types:interface#SepiaAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/adjustments/src/tintAdjustment.ts:7:15` | `createTintAdjustment` | `@flighthq/types:interface#TintAdjustment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationBlend.ts:87:15` | `createAnimationSampleAccumulator` | `@flighthq/types:interface#AnimationSampleAccumulator` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationBlendTree.ts:29:15` | `createAnimationBlendTree` | `@flighthq/types:interface#AnimationBlendTree` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationBlendTree.ts:39:15` | `createAnimationBlendTreeInput` | `@flighthq/types:interface#AnimationBlendTreeInput` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationClip.ts:20:15` | `cloneAnimationClip` | `@flighthq/types:interface#AnimationClip` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationClip.ts:28:15` | `createAnimationChannel` | `@flighthq/types:interface#AnimationChannel` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationClip.ts:38:15` | `createAnimationClip` | `@flighthq/types:interface#AnimationClip` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationClip.ts:44:15` | `createAnimationClipEvent` | `@flighthq/types:interface#AnimationClipEvent` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationCrossfade.ts:30:15` | `createAnimationCrossfade` | `@flighthq/types:interface#AnimationCrossfade` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationLayerStack.ts:37:15` | `createAnimationLayerStack` | `@flighthq/types:interface#AnimationLayerStack` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationLayerStack.ts:166:15` | `createAnimationLayer` | `@flighthq/types:interface#AnimationLayer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationPlayer.ts:109:15` | `cloneAnimationPlayer` | `@flighthq/types:interface#AnimationPlayer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationPlayer.ts:134:15` | `createAnimationPlayer` | `@flighthq/types:interface#AnimationPlayer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationRootMotion.ts:10:21` | `createAnimationRootMotionExtractor` | `@flighthq/types:interface#AnimationRootMotionExtractor` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationStateMachine.ts:29:15` | `createAnimationStateMachine` | `@flighthq/types:interface#AnimationStateMachine` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationStateMachine.ts:38:15` | `createAnimationStateMachineState` | `@flighthq/types:interface#AnimationStateMachineState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationTrack.ts:14:15` | `cloneAnimationTrack` | `@flighthq/types:interface#AnimationTrack` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationTrack.ts:34:15` | `createAnimationTrack` | `@flighthq/types:interface#AnimationTrack` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/animation/src/animationTrack.ts:146:15` | `trimAnimationTrack` | `@flighthq/types:interface#AnimationTrack` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/app/src/app.ts:135:15` | `createApp` | `@flighthq/types:interface#App` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/application/src/application.ts:65:15` | `createApplication` | `@flighthq/types:interface#Application` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/application/src/applicationRenderView.ts:41:16` | `createApplicationRenderView` | `synthetic-entity:upstream/packages/application/src/applicationRenderView.ts:41:16` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/application/src/window.ts:252:15` | `createApplicationWindow` | `@flighthq/types:interface#ApplicationWindow` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/assets/src/assetLibrary.ts:78:15` | `createAssetLibrary` | `@flighthq/types:interface#AssetLibrary` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/audio/src/audioResource.ts:9:15` | `cloneAudioResource` | `@flighthq/types:interface#AudioResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/audio/src/audioResource.ts:15:15` | `createAudioResource` | `@flighthq/types:interface#AudioResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/audio/src/audioResourceReference.ts:26:17` | `createAudioResourceFailure` | `@flighthq/types:interface#AudioResourceFailure` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/audio/src/audioResourceReference.ts:32:15` | `createAudioResourceFailure` | `@flighthq/types:interface#AudioResourceFailure` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/audio/src/audioResourceReference.ts:44:15` | `createEmbeddedAudioResourceReference` | `@flighthq/types:interface#EmbeddedAudioResourceReference` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/audio/src/audioResourceReference.ts:55:15` | `createExternalAudioResourceReference` | `@flighthq/types:interface#ExternalAudioResourceReference` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/audio/src/audioResourceReference.ts:154:21` | `<anonymous>` | `@flighthq/types:interface#AudioResourceFailure` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmap.ts:6:15` | `cloneBitmap` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmap.ts:61:15` | `createBitmap` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapChannel.ts:155:15` | `makeBitmap` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapCrop.ts:38:15` | `cropBitmap` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapCrop.ts:104:15` | `extendBitmap` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapCrop.ts:135:17` | `trimBitmap` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapFingerprint.ts:47:19` | `<anonymous>` | `@flighthq/types:interface#BitmapFingerprint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapFingerprint.ts:78:15` | `createBitmapFingerprint` | `@flighthq/types:interface#BitmapFingerprint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapFingerprint.ts:126:15` | `parseBitmapFingerprint` | `@flighthq/types:interface#BitmapFingerprint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmap/src/bitmapFrom.ts:21:15` | `createBitmapFromCanvas` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmapfont/src/bitmapFont.ts:13:15` | `createBitmapFont` | `@flighthq/types:interface#BitmapFont` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmapfont/src/bitmapFontGlyphSource.ts:7:15` | `createGlyphSourceFromBitmapFont` | `@flighthq/types:interface#GlyphSource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/bitmaptext/src/bitmapText.ts:62:15` | `createBitmapTextData` | `@flighthq/types:interface#BitmapTextData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/camera-controls/src/cameraShake.ts:10:15` | `createCameraShake` | `@flighthq/types:interface#CameraShake` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/camera-controls/src/cameraShake.ts:16:15` | `createCameraShakeOffset` | `@flighthq/types:interface#CameraShakeOffset` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/camera-controls/src/flyCameraController.ts:35:15` | `createFlyCameraController` | `@flighthq/types:interface#FlyCameraController` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/camera-controls/src/orbitCameraController.ts:39:15` | `createOrbitCameraController` | `@flighthq/types:interface#OrbitCameraController` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/camera/src/camera.ts:14:15` | `createCamera3D` | `@flighthq/types:interface#Camera3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/camera/src/camera2d.ts:13:15` | `createCamera2D` | `@flighthq/types:interface#Camera2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/camera/src/projection.ts:15:15` | `createOrthographicProjection` | `synthetic-entity:upstream/packages/camera/src/projection.ts:15:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/camera/src/projection.ts:23:15` | `createPerspectiveProjection` | `synthetic-entity:upstream/packages/camera/src/projection.ts:23:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/clip/src/clipRegion.ts:75:15` | `cloneClipRegion` | `@flighthq/types:interface#ClipRegion` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/clip/src/clipRegion.ts:104:15` | `createClipRegionFromContours` | `@flighthq/types:interface#ClipRegion` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/clip/src/clipRegion.ts:118:15` | `createClipRegionFromPath` | `@flighthq/types:interface#ClipRegion` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/clip/src/clipRegion.ts:124:15` | `createClipRegionFromRectangle` | `@flighthq/types:interface#ClipRegion` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/clip/src/clipRegion.ts:516:15` | `makeEmptyClipRegion` | `@flighthq/types:interface#ClipRegion` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/clipboard/src/clipboard.ts:34:15` | `createClipboardWatch` | `@flighthq/types:interface#ClipboardWatch` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/clock/src/clock.ts:40:15` | `createClock` | `@flighthq/types:interface#Clock` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/contactManifold2D.ts:21:15` | `createCollisionContactManifold2D` | `@flighthq/types:interface#CollisionContactManifold2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/contactManifold3D.ts:17:15` | `createCollisionContactManifold3D` | `@flighthq/types:interface#CollisionContactManifold3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/gjkDistance3D.ts:34:15` | `createCollisionDistance3D` | `@flighthq/types:interface#CollisionDistance3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/manifold2D.ts:15:15` | `createCollisionManifold2D` | `@flighthq/types:interface#CollisionManifold2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/manifold3D.ts:16:15` | `createCollisionManifold3D` | `@flighthq/types:interface#CollisionManifold3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/raycastCollisionShape2D.ts:10:15` | `createCollisionRaycastHit2D` | `@flighthq/types:interface#CollisionRaycastHit2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/raycastCollisionShape3D.ts:8:15` | `createCollisionRaycastHit3D` | `@flighthq/types:interface#CollisionRaycastHit3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/sweepCollisionShape2D.ts:11:15` | `createCollisionTimeOfImpact2D` | `@flighthq/types:interface#CollisionTimeOfImpact2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/sweepCollisionShape3D.ts:7:15` | `createCollisionTimeOfImpact3D` | `@flighthq/types:interface#CollisionTimeOfImpact3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/triangleMesh3D.ts:101:15` | `createCollisionHeightfield3D` | `@flighthq/types:interface#CollisionHeightfield3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/collision/src/triangleMesh3D.ts:110:15` | `createCollisionTriangleMesh3D` | `@flighthq/types:interface#CollisionTriangleMesh3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/command.ts:37:15` | `createAddNodeChildCommand` | `@flighthq/types:interface#AddNodeChildCommand` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/command.ts:44:15` | `createCompositeCommand` | `@flighthq/types:interface#CompositeCommand` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/command.ts:52:15` | `createRemoveNodeChildCommand` | `@flighthq/types:interface#RemoveNodeChildCommand` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/command.ts:64:15` | `createReorderNodeChildCommand` | `@flighthq/types:interface#ReorderNodeChildCommand` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/command.ts:83:15` | `createSetNodePropertyCommand` | `@flighthq/types:interface#SetNodePropertyCommand` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/command.ts:102:15` | `createSetNodePropertyCommandBatch` | `@flighthq/types:interface#SetNodePropertyCommand` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/commandBinding.ts:156:17` | `merge` | `@flighthq/types:interface#SetNodePropertyCommand` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/command/src/commandHistory.ts:30:15` | `createCommandHistory` | `@flighthq/types:interface#CommandHistory` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/connectivity/src/connectivity.ts:51:15` | `createConnectivity` | `@flighthq/types:interface#Connectivity` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/device/src/device.ts:13:15` | `createDeviceCapabilities` | `@flighthq/types:interface#DeviceCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/device/src/device.ts:19:15` | `createDeviceDisplayMetrics` | `@flighthq/types:interface#DeviceDisplayMetrics` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/device/src/device.ts:25:15` | `createDeviceInfo` | `@flighthq/types:interface#DeviceInfo` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/device/src/device.ts:31:15` | `createSafeAreaInsets` | `@flighthq/types:interface#SafeAreaInsets` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/dialog/src/dialog.ts:19:15` | `createWebMessageDialogBackend` | `@flighthq/types:interface#MessageDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/dialog/src/dialog.ts:25:15` | `createWebPromptDialogBackend` | `@flighthq/types:interface#PromptDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/dialog/src/fileDialog.ts:25:18` | `createFileDialogHandle` | `@flighthq/types:interface#FileDialogHandle` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-canvas/src/canvasRenderEffectPipeline.ts:73:15` | `createCanvasRenderEffectPipeline` | `@flighthq/types:interface#CanvasRenderEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-canvas/src/canvasRenderEffectPipeline.ts:79:15` | `createCanvasRenderTargetPool` | `@flighthq/types:interface#CanvasRenderTargetPool` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-gl/src/glRenderEffectPipeline.ts:80:15` | `createGlRenderEffectPipeline` | `@flighthq/types:interface#GlRenderEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuBitmapDisplacementEffect.ts:151:19` | `getBitmapDisplacementPipeline` | `@flighthq/types:type#WgpuEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuColorLutPass.ts:98:21` | `getLutPipeline` | `@flighthq/types:type#WgpuEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuEffectPass.ts:234:15` | `createWgpuDualSourceEffectPipeline` | `@flighthq/types:type#WgpuEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuEffectPass.ts:244:15` | `createWgpuEffectPipeline` | `@flighthq/types:type#WgpuEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuGradientBevelEffect.ts:196:21` | `getApplyPipeline` | `@flighthq/types:type#WgpuEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuGradientBevelEffect.ts:219:21` | `getEncodePipeline` | `@flighthq/types:type#WgpuEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuGradientGlowEffect.ts:130:21` | `getLookupPipeline` | `@flighthq/types:type#WgpuEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects-wgpu/src/wgpuRenderEffectPipeline.ts:82:15` | `createWgpuRenderEffectPipeline` | `@flighthq/types:interface#WgpuRenderEffectPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/autoExposureEffect.ts:9:15` | `createAutoExposureEffect` | `@flighthq/types:interface#AutoExposureEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/barrelDistortionEffect.ts:9:15` | `createBarrelDistortionEffect` | `@flighthq/types:interface#BarrelDistortionEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/bevelEffect.ts:18:15` | `createBevelEffect` | `@flighthq/types:interface#BevelEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/bitmapDisplacementEffect.ts:19:15` | `createBitmapDisplacementEffect` | `@flighthq/types:interface#BitmapDisplacementEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/blendEffect.ts:22:15` | `createBlendEffect` | `@flighthq/types:interface#BlendEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/bloomEffect.ts:33:15` | `createBloomEffect` | `@flighthq/types:interface#BloomEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/blurEffect.ts:18:15` | `createBlurEffect` | `@flighthq/types:interface#BlurEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/bokehDepthOfFieldEffect.ts:17:15` | `createBokehDepthOfFieldEffect` | `@flighthq/types:interface#BokehDepthOfFieldEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/cameraMotionBlurEffect.ts:9:15` | `createCameraMotionBlurEffect` | `@flighthq/types:interface#CameraMotionBlurEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/chromaticAberrationEffect.ts:9:15` | `createChromaticAberrationEffect` | `@flighthq/types:interface#ChromaticAberrationEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/compositeEffect.ts:21:15` | `createCompositeEffect` | `@flighthq/types:interface#CompositeEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/contactShadowsEffect.ts:17:15` | `createContactShadowsEffect` | `@flighthq/types:interface#ContactShadowsEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/convolutionEffect.ts:17:15` | `createConvolutionEffect` | `@flighthq/types:interface#ConvolutionEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/crtEffect.ts:7:15` | `createCrtEffect` | `@flighthq/types:interface#CrtEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/customShaderEffect.ts:9:15` | `createCustomShaderEffect` | `@flighthq/types:interface#CustomShaderEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/directionalBlurEffect.ts:17:15` | `createDirectionalBlurEffect` | `@flighthq/types:interface#DirectionalBlurEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/displacementEffect.ts:17:15` | `createDisplacementEffect` | `@flighthq/types:interface#DisplacementEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/ditherEffect.ts:9:15` | `createDitherEffect` | `@flighthq/types:interface#DitherEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/dropShadowEffect.ts:18:15` | `createDropShadowEffect` | `@flighthq/types:interface#DropShadowEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/filmEmulationEffect.ts:9:15` | `createFilmEmulationEffect` | `@flighthq/types:interface#FilmEmulationEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/filmGrainEffect.ts:9:15` | `createFilmGrainEffect` | `@flighthq/types:interface#FilmGrainEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/fxaaEffect.ts:7:15` | `createFxaaEffect` | `@flighthq/types:interface#FxaaEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/glitchEffect.ts:17:15` | `createGlitchEffect` | `@flighthq/types:interface#GlitchEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/godRaysEffect.ts:9:15` | `createGodRaysEffect` | `@flighthq/types:interface#GodRaysEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/gradientBevelEffect.ts:18:15` | `createGradientBevelEffect` | `@flighthq/types:interface#GradientBevelEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/gradientGlowEffect.ts:18:15` | `createGradientGlowEffect` | `@flighthq/types:interface#GradientGlowEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/halftoneEffect.ts:9:15` | `createHalftoneEffect` | `@flighthq/types:interface#HalftoneEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/innerGlowEffect.ts:18:15` | `createInnerGlowEffect` | `@flighthq/types:interface#InnerGlowEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/innerShadowEffect.ts:18:15` | `createInnerShadowEffect` | `@flighthq/types:interface#InnerShadowEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/kuwaharaEffect.ts:9:15` | `createKuwaharaEffect` | `@flighthq/types:interface#KuwaharaEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/lensDirtEffect.ts:9:15` | `createLensDirtEffect` | `@flighthq/types:interface#LensDirtEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/lensDistortionEffect.ts:9:15` | `createLensDistortionEffect` | `@flighthq/types:interface#LensDistortionEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/lensFlareEffect.ts:9:15` | `createLensFlareEffect` | `@flighthq/types:interface#LensFlareEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/medianEffect.ts:17:15` | `createMedianEffect` | `@flighthq/types:interface#MedianEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/motionBlurEffect.ts:9:15` | `createMotionBlurEffect` | `@flighthq/types:interface#MotionBlurEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/outerGlowEffect.ts:18:15` | `createOuterGlowEffect` | `@flighthq/types:interface#OuterGlowEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/outlineEffect.ts:17:15` | `createOutlineEffect` | `@flighthq/types:interface#OutlineEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/panniniProjectionEffect.ts:9:15` | `createPanniniProjectionEffect` | `@flighthq/types:interface#PanniniProjectionEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/pixelateEffect.ts:9:15` | `createPixelateEffect` | `@flighthq/types:interface#PixelateEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/posterizeEffect.ts:9:15` | `createPosterizeEffect` | `@flighthq/types:interface#PosterizeEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/radialBlurEffect.ts:9:15` | `createRadialBlurEffect` | `@flighthq/types:interface#RadialBlurEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/scanlinesEffect.ts:9:15` | `createScanlinesEffect` | `@flighthq/types:interface#ScanlinesEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/screenSpaceFogEffect.ts:9:15` | `createScreenSpaceFogEffect` | `@flighthq/types:interface#ScreenSpaceFogEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/sharpenEffect.ts:9:15` | `createSharpenEffect` | `@flighthq/types:interface#SharpenEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/sketchEffect.ts:9:15` | `createSketchEffect` | `@flighthq/types:interface#SketchEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/smaaEffect.ts:7:15` | `createSmaaEffect` | `@flighthq/types:interface#SmaaEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/ssaoEffect.ts:7:15` | `createSsaoEffect` | `@flighthq/types:interface#SsaoEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/ssrEffect.ts:7:15` | `createSsrEffect` | `@flighthq/types:interface#SsrEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/taaEffect.ts:7:15` | `createTaaEffect` | `@flighthq/types:interface#TaaEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/tiltShiftEffect.ts:17:15` | `createTiltShiftEffect` | `@flighthq/types:interface#TiltShiftEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/toneMapEffect.ts:9:15` | `createToneMapEffect` | `@flighthq/types:interface#ToneMapEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/vignetteEffect.ts:9:15` | `createVignetteEffect` | `@flighthq/types:interface#VignetteEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/volumetricLightEffect.ts:9:15` | `createVolumetricLightEffect` | `@flighthq/types:interface#VolumetricLightEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/effects/src/whiteBalanceEffect.ts:9:15` | `createWhiteBalanceEffect` | `@flighthq/types:interface#WhiteBalanceEffect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/entity/src/host.ts:8:15` | `createHost` | `synthetic-entity:upstream/packages/entity/src/host.ts:8:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/flow/src/flow.ts:16:15` | `createFlowStack` | `@flighthq/types:interface#FlowStack` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/font-formats/src/openTypeGlyphOutlineSource.ts:72:15` | `createGlyphOutlineSourceFromOpenTypeFont` | `synthetic-entity:upstream/packages/font-formats/src/openTypeGlyphOutlineSource.ts:72:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/font/src/fontResource.ts:5:15` | `createFontResource` | `@flighthq/types:interface#FontResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/font/src/glyphOutlineSource.ts:17:15` | `createGlyphRasterizerBackendFromGlyphOutlineSource` | `synthetic-entity:upstream/packages/font/src/glyphOutlineSource.ts:17:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/geolocation/src/geolocation.ts:18:15` | `createGeoPosition` | `@flighthq/types:interface#GeoPosition` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geolocation/src/geolocation.ts:24:15` | `createWebGeolocationBackend` | `@flighthq/types:interface#GeolocationBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geolocation/src/geolocation.ts:159:15` | `mapWebPosition` | `@flighthq/types:interface#GeoPosition` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/aabb.ts:75:15` | `createAabb` | `@flighthq/types:interface#Aabb` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/boundingSphere.ts:56:15` | `createBoundingSphere` | `@flighthq/types:interface#BoundingSphere` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/capsule.ts:25:15` | `createCapsule` | `@flighthq/types:interface#Capsule` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/frustum.ts:22:15` | `createFrustum` | `@flighthq/types:interface#Frustum` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/matrix.ts:150:15` | `createMatrix` | `@flighthq/types:interface#Matrix` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/matrix3.ts:130:15` | `createMatrix3` | `@flighthq/types:interface#Matrix3` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/matrix4.ts:377:15` | `createMatrix4` | `@flighthq/types:interface#Matrix4` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/obb.ts:29:15` | `createObb` | `@flighthq/types:interface#Obb` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/plane.ts:26:15` | `createPlane` | `@flighthq/types:interface#Plane` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/quaternion.ts:48:15` | `createQuaternion` | `@flighthq/types:interface#Quaternion` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/ray3d.ts:28:15` | `createRay3D` | `@flighthq/types:interface#Ray3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/rectangle.ts:53:15` | `createRectangle` | `@flighthq/types:interface#Rectangle` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/transform2d.ts:18:15` | `createTransform2D` | `@flighthq/types:interface#Transform2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/transform3d.ts:26:15` | `createTransform3D` | `@flighthq/types:interface#Transform3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/vector2.ts:59:15` | `createVector2` | `@flighthq/types:interface#Vector2` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/vector3.ts:90:15` | `createVector3` | `@flighthq/types:interface#Vector3` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/geometry/src/vector4.ts:89:15` | `createVector4` | `@flighthq/types:interface#Vector4` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/glyphatlas/src/glyphAtlas.ts:14:15` | `createGlyphAtlas` | `@flighthq/types:interface#GlyphAtlas` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/glyphatlas/src/glyphRasterizerBackend.ts:10:15` | `createStubGlyphRasterizerBackend` | `synthetic-entity:upstream/packages/glyphatlas/src/glyphRasterizerBackend.ts:10:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/glyphatlas/src/glyphSource.ts:9:15` | `createGlyphSourceFromGlyphAtlas` | `@flighthq/types:interface#GlyphSource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:34:18` | `createCapacitorAppCapabilities` | `@flighthq/types:type#CapacitorCommonAppCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:38:19` | `createCapacitorAppCapabilities` | `@flighthq/types:type#CapacitorAndroidAppCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:49:13` | `initializeCapacitorAndroidAppCapabilities` | `@flighthq/types:interface#AppHideBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:53:13` | `initializeCapacitorAndroidAppCapabilities` | `@flighthq/types:interface#AppQuitBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:72:13` | `initializeCapacitorCommonAppCapabilities` | `@flighthq/types:interface#AppActivateBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:80:13` | `initializeCapacitorCommonAppCapabilities` | `@flighthq/types:interface#AppNameBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:83:13` | `initializeCapacitorCommonAppCapabilities` | `@flighthq/types:interface#AppVersionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorClipboard.ts:14:15` | `createCapacitorClipboardBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorClipboard.ts:14:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorConnectivity.ts:16:15` | `createCapacitorConnectivityBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorConnectivity.ts:16:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorDevice.ts:16:15` | `createCapacitorDeviceBackend` | `@flighthq/types:interface#DeviceBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorDialog.ts:10:15` | `createCapacitorMessageDialogBackend` | `@flighthq/types:interface#MessageDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorDialog.ts:16:15` | `createCapacitorPromptDialogBackend` | `@flighthq/types:interface#PromptDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorFileSystem.ts:12:15` | `createCapacitorFileSystemBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorFileSystem.ts:12:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorGeolocation.ts:13:15` | `createCapacitorGeolocationBackend` | `@flighthq/types:interface#GeolocationBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorGeolocation.ts:89:15` | `toGeoPosition` | `@flighthq/types:interface#GeoPosition` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorHaptics.ts:12:15` | `createCapacitorHapticsBackend` | `@flighthq/types:interface#HapticsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:30:15` | `createCapacitorSoftKeyboardAccessoryBarBackend` | `@flighthq/types:interface#SoftKeyboardAccessoryBarBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:36:15` | `createCapacitorSoftKeyboardChangeBackend` | `@flighthq/types:interface#SoftKeyboardChangeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:42:15` | `createCapacitorSoftKeyboardInfoBackend` | `@flighthq/types:interface#SoftKeyboardInfoBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:50:15` | `createCapacitorSoftKeyboardResizeModeWriteBackend` | `@flighthq/types:interface#SoftKeyboardResizeModeWriteBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:58:15` | `createCapacitorSoftKeyboardScrollAssistBackend` | `@flighthq/types:interface#SoftKeyboardScrollAssistBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:64:15` | `createCapacitorSoftKeyboardStyleBackend` | `@flighthq/types:interface#SoftKeyboardStyleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:72:15` | `createCapacitorSoftKeyboardVisibilityBackend` | `@flighthq/types:interface#SoftKeyboardVisibilityBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorNotification.ts:25:15` | `createCapacitorNotificationCapabilities` | `@flighthq/types:type#CapacitorNotificationCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorProtocol.ts:11:15` | `createCapacitorProtocolCapabilities` | `@flighthq/types:type#CapacitorProtocolCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorProtocol.ts:20:23` | `initializeCapacitorProtocolCapabilities` | `@flighthq/types:interface#ProtocolOpenBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorRegister.ts:38:15` | `capacitorHost` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorRegister.ts:38:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorRegister.ts:98:29` | `initializeCapacitorHost` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorRegister.ts:98:29` | `contextual` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorShare.ts:10:15` | `createCapacitorShareContentBackend` | `@flighthq/types:interface#CapacitorShareContentBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-capacitor/src/capacitorStatusBar.ts:31:15` | `createCapacitorStatusBarBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorStatusBar.ts:31:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:67:17` | `<anonymous>` | `@flighthq/types:type#ElectronCommonAppCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:69:17` | `<anonymous>` | `@flighthq/types:interface#AppAllWindowsClosedBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:74:17` | `<anonymous>` | `@flighthq/types:interface#AppFocusBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:79:17` | `<anonymous>` | `@flighthq/types:interface#AppLocaleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:84:17` | `<anonymous>` | `@flighthq/types:interface#AppNameBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:89:17` | `<anonymous>` | `@flighthq/types:interface#AppNameWriteBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:94:17` | `<anonymous>` | `@flighthq/types:interface#AppPathBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:99:17` | `<anonymous>` | `@flighthq/types:interface#AppQuitBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:104:17` | `<anonymous>` | `@flighthq/types:interface#AppQuitRequestBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:109:17` | `<anonymous>` | `@flighthq/types:interface#AppReadyBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:114:17` | `<anonymous>` | `@flighthq/types:interface#AppRelaunchBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:119:17` | `<anonymous>` | `@flighthq/types:interface#AppSecondInstanceBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:124:17` | `<anonymous>` | `@flighthq/types:interface#AppSingleInstanceBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:129:17` | `<anonymous>` | `@flighthq/types:interface#AppVersionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:155:19` | `createElectronAppCapabilities` | `@flighthq/types:type#ElectronMacosAppCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:157:17` | `<anonymous>` | `@flighthq/types:interface#AppActivateBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:162:17` | `<anonymous>` | `@flighthq/types:interface#AppActivationPolicyBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:167:17` | `<anonymous>` | `@flighthq/types:interface#AppBadgeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:172:17` | `<anonymous>` | `@flighthq/types:interface#AppDockBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:177:17` | `<anonymous>` | `@flighthq/types:interface#AppHideBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:182:17` | `<anonymous>` | `@flighthq/types:interface#AppVisibilityQueryBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:188:17` | `<anonymous>` | `@flighthq/types:interface#AppOpenFileBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:194:17` | `<anonymous>` | `@flighthq/types:interface#AppShowBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:216:17` | `createElectronAppCapabilities` | `@flighthq/types:type#ElectronWindowsAppCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:220:17` | `<anonymous>` | `@flighthq/types:interface#AppUserModelIdBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:228:17` | `createElectronAppCapabilities` | `@flighthq/types:type#ElectronLinuxAppCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:230:15` | `<anonymous>` | `@flighthq/types:interface#AppBadgeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:535:15` | `createElectronLoginItemBackend` | `@flighthq/types:interface#AppLoginItemBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronApp.ts:541:15` | `createElectronRecentDocumentsBackend` | `@flighthq/types:interface#AppRecentDocumentsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronClipboard.ts:23:15` | `createElectronClipboardBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronClipboard.ts:23:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronDialog.ts:18:15` | `createElectronDirectoryOpenDialogBackend` | `@flighthq/types:interface#DirectoryOpenDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronDialog.ts:24:15` | `createElectronFileOpenDialogBackend` | `@flighthq/types:interface#FileOpenDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronDialog.ts:30:15` | `createElectronFileSaveDialogBackend` | `@flighthq/types:interface#FileSaveDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronDialog.ts:36:15` | `createElectronMessageDialogBackend` | `@flighthq/types:interface#MessageDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronIpc.ts:18:15` | `createElectronIpcHandleBackend` | `@flighthq/types:interface#IpcHandleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronIpc.ts:24:15` | `createElectronIpcInvokeBackend` | `@flighthq/types:interface#IpcInvokeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronIpc.ts:30:15` | `createElectronIpcMessageBackend` | `@flighthq/types:interface#IpcMessageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronIpc.ts:36:15` | `createElectronIpcSendBackend` | `@flighthq/types:interface#IpcSendBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronIpc.ts:44:15` | `createElectronIpcTargetedSendBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronIpc.ts:44:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronMenu.ts:26:15` | `<anonymous>` | `@flighthq/types:interface#MenuApplicationBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronMenu.ts:31:15` | `<anonymous>` | `@flighthq/types:interface#MenuPopupBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronMenu.ts:36:15` | `<anonymous>` | `@flighthq/types:interface#MenuSelectBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronMenu.ts:40:15` | `createElectronMenuBackends` | `@flighthq/types:type#ElectronMenuCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronNotification.ts:179:17` | `createElectronNotificationCapabilities` | `@flighthq/types:type#ElectronNotificationCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronNotification.ts:183:15` | `createElectronNotificationCapabilities` | `@flighthq/types:type#ElectronMacosNotificationCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPlatform.ts:5:15` | `createElectronPlatformBackend` | `@flighthq/types:interface#PlatformBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:34:15` | `<anonymous>` | `@flighthq/types:interface#PowerBatteryHealthBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:39:15` | `<anonymous>` | `@flighthq/types:interface#PowerChangeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:44:15` | `<anonymous>` | `@flighthq/types:interface#PowerIdleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:49:15` | `<anonymous>` | `@flighthq/types:interface#PowerKeepAwakeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:54:15` | `<anonymous>` | `@flighthq/types:interface#PowerSessionLockBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:59:15` | `<anonymous>` | `@flighthq/types:interface#PowerStatusBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:64:15` | `<anonymous>` | `@flighthq/types:interface#PowerSuspensionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:69:20` | `createElectronPowerBackends` | `@flighthq/types:type#ElectronPowerCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronPower.ts:88:15` | `<anonymous>` | `@flighthq/types:interface#PowerThermalBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:17:24` | `createElectronProtocolCapabilities` | `@flighthq/types:interface#ProtocolRegistrationBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:21:26` | `createElectronProtocolCapabilities` | `@flighthq/types:interface#ProtocolDefaultBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:25:16` | `createElectronProtocolCapabilities` | `@flighthq/types:interface#ProtocolOpenBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:29:29` | `createElectronProtocolCapabilities` | `@flighthq/types:interface#ProtocolRegistrationQueryBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:33:26` | `createElectronProtocolCapabilities` | `@flighthq/types:interface#ProtocolUnregistrationBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:37:15` | `createElectronProtocolCapabilities` | `@flighthq/types:type#ElectronProtocolCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronRegister.ts:126:15` | `registerElectronBackends` | `synthetic-entity:upstream/packages/host-electron/src/electronRegister.ts:126:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronScreen.ts:21:17` | `createElectronScreenCapabilities` | `@flighthq/types:interface#ScreenQueryBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronScreen.ts:24:18` | `createElectronScreenCapabilities` | `@flighthq/types:interface#ScreenChangeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronScreen.ts:117:15` | `emptyScreenInfo` | `@flighthq/types:interface#ScreenInfo` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShell.ts:129:16` | `makeElectronShellCapabilities` | `@flighthq/types:interface#ShellBeepBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShell.ts:132:17` | `<anonymous>` | `@flighthq/types:interface#ShellExternalBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShell.ts:137:17` | `<anonymous>` | `@flighthq/types:interface#ShellPathOpenBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShell.ts:142:17` | `<anonymous>` | `@flighthq/types:interface#ShellPathRevealBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShell.ts:147:17` | `<anonymous>` | `@flighthq/types:interface#ShellTrashBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShell.ts:157:15` | `createElectronShellShortcutLinkBackend` | `@flighthq/types:interface#ShellShortcutLinkBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShortcut.ts:13:20` | `createElectronShortcutQueryBackend` | `@flighthq/types:interface#ShortcutQueryBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShortcut.ts:32:17` | `<anonymous>` | `@flighthq/types:interface#ShortcutTriggerBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronShortcut.ts:46:41` | `<anonymous>` | `synthetic-entity:upstream/packages/host-electron/src/electronShortcut.ts:46:41` | `contextual` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronStorage.ts:22:15` | `createElectronStorageBackend` | `@flighthq/types:interface#StorageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:69:17` | `<anonymous>` | `@flighthq/types:interface#TrayLifecycleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:75:17` | `<anonymous>` | `@flighthq/types:interface#TrayImageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:81:17` | `<anonymous>` | `@flighthq/types:interface#TrayTooltipBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:87:17` | `<anonymous>` | `@flighthq/types:interface#TrayMenuBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:94:19` | `<anonymous>` | `@flighthq/types:interface#TrayBoundsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:100:19` | `<anonymous>` | `@flighthq/types:interface#TrayInteractionEventsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:107:19` | `<anonymous>` | `@flighthq/types:interface#TrayMenuSelectionEventsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:112:19` | `<anonymous>` | `@flighthq/types:interface#TrayPopupMenuBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:122:21` | `<anonymous>` | `@flighthq/types:interface#TrayDoubleClickPolicyBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:127:21` | `<anonymous>` | `@flighthq/types:interface#TrayDropEventsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:132:21` | `<anonymous>` | `@flighthq/types:interface#TrayPressedImageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:137:21` | `<anonymous>` | `@flighthq/types:interface#TrayTemplateImageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:142:21` | `<anonymous>` | `@flighthq/types:interface#TrayTitleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:149:17` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:149:17` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:157:21` | `<anonymous>` | `@flighthq/types:interface#TrayBalloonBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:162:21` | `<anonymous>` | `@flighthq/types:interface#TrayBalloonEventsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronTray.ts:167:17` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:167:17` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:174:15` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:174:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronUpdater.ts:27:15` | `createElectronUpdaterBackend` | `@flighthq/types:interface#UpdaterCommandBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronUpdater.ts:139:19` | `<anonymous>` | `@flighthq/types:interface#DownloadedUpdate` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-electron/src/electronWindow.ts:17:15` | `createElectronWindowBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronWindow.ts:17:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:16:15` | `createTauriAppCapabilities` | `@flighthq/types:type#TauriAppCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:37:23` | `initializeTauriAppCapabilities` | `@flighthq/types:interface#AppHideBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:40:25` | `initializeTauriAppCapabilities` | `@flighthq/types:interface#AppLocaleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:45:23` | `initializeTauriAppCapabilities` | `@flighthq/types:interface#AppNameBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:48:23` | `initializeTauriAppCapabilities` | `@flighthq/types:interface#AppQuitBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:51:27` | `initializeTauriAppCapabilities` | `@flighthq/types:interface#AppRelaunchBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:54:23` | `initializeTauriAppCapabilities` | `@flighthq/types:interface#AppShowBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:57:26` | `initializeTauriAppCapabilities` | `@flighthq/types:interface#AppVersionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriClipboard.ts:7:15` | `createTauriClipboardBackend` | `@flighthq/types:interface#ClipboardTextBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriDialog.ts:20:15` | `createTauriDirectoryOpenDialogBackend` | `@flighthq/types:interface#DirectoryOpenDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriDialog.ts:26:15` | `createTauriFileOpenDialogBackend` | `@flighthq/types:interface#FileOpenDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriDialog.ts:32:15` | `createTauriFileSaveDialogBackend` | `@flighthq/types:interface#FileSaveDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriDialog.ts:38:15` | `createTauriMessageDialogBackend` | `@flighthq/types:interface#MessageDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriMenu.ts:24:15` | `createTauriMenuBackends` | `@flighthq/types:type#TauriMenuCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriMenu.ts:38:30` | `initializeTauriMenuBackends` | `@flighthq/types:interface#MenuApplicationBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriMenu.ts:54:24` | `initializeTauriMenuBackends` | `@flighthq/types:interface#MenuPopupBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriMenu.ts:65:25` | `initializeTauriMenuBackends` | `@flighthq/types:interface#MenuSelectBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriNotification.ts:12:15` | `createTauriNotificationCapabilities` | `@flighthq/types:type#TauriNotificationCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriPlatform.ts:5:15` | `createTauriPlatformBackend` | `@flighthq/types:interface#PlatformBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriRegister.ts:81:15` | `registerTauriBackends` | `synthetic-entity:upstream/packages/host-tauri/src/tauriRegister.ts:81:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriShell.ts:59:20` | `makeTauriShellCapabilities` | `@flighthq/types:interface#ShellExternalBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriShell.ts:61:23` | `makeTauriShellCapabilities` | `@flighthq/types:interface#ShellPathOpenBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriShell.ts:64:25` | `makeTauriShellCapabilities` | `@flighthq/types:interface#ShellPathRevealBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriShortcut.ts:13:20` | `createTauriShortcutQueryBackend` | `@flighthq/types:interface#ShortcutQueryBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriShortcut.ts:21:20` | `createTauriShortcutTriggerBackend` | `@flighthq/types:interface#ShortcutTriggerBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriShortcut.ts:63:39` | `<anonymous>` | `synthetic-entity:upstream/packages/host-tauri/src/tauriShortcut.ts:63:39` | `contextual` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:50:17` | `<anonymous>` | `@flighthq/types:interface#TrayLifecycleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:125:17` | `<anonymous>` | `@flighthq/types:interface#TrayImageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:133:17` | `<anonymous>` | `@flighthq/types:interface#TrayMenuBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:204:19` | `<anonymous>` | `@flighthq/types:interface#TrayMenuSelectionEventsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:211:17` | `<anonymous>` | `@flighthq/types:interface#TrayTitleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:228:17` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:228:17` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:244:17` | `<anonymous>` | `@flighthq/types:interface#TrayInteractionEventsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:249:17` | `<anonymous>` | `@flighthq/types:interface#TrayTooltipBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:268:17` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:268:17` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:282:31` | `createTauriTrayCapabilities` | `@flighthq/types:interface#TrayTemplateImageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:290:15` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:290:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriWindow.ts:19:15` | `createTauriWindowBackend` | `synthetic-entity:upstream/packages/host-tauri/src/tauriWindow.ts:19:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webAccessibility.ts:11:15` | `createWebAccessibilityBackend` | `@flighthq/types:interface#AccessibilityBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webApp.ts:19:15` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:19:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:39:17` | `<anonymous>` | `@flighthq/types:interface#AppBadgeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webApp.ts:44:17` | `<anonymous>` | `@flighthq/types:interface#AppFocusBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webApp.ts:49:17` | `<anonymous>` | `@flighthq/types:interface#AppLocaleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webApp.ts:54:17` | `<anonymous>` | `@flighthq/types:interface#AppNameBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webApp.ts:59:17` | `<anonymous>` | `@flighthq/types:interface#AppQuitBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webApp.ts:64:17` | `<anonymous>` | `@flighthq/types:interface#AppReadyBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webApp.ts:69:17` | `<anonymous>` | `@flighthq/types:interface#AppRelaunchBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webAudio.ts:11:15` | `<anonymous>` | `@flighthq/types:interface#AudioBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webBitmapEncode.ts:5:15` | `createWebBitmapEncodeBackend` | `synthetic-entity:upstream/packages/host-web/src/webBitmapEncode.ts:5:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webBitmapReadback.ts:6:15` | `createWebBitmapReadbackBackend` | `synthetic-entity:upstream/packages/host-web/src/webBitmapReadback.ts:6:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webBitmapReadback.ts:38:19` | `<anonymous>` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webCanvasRenderSurface.ts:6:19` | `createWebCanvasRenderSurfaceCreator` | `@flighthq/types:interface#CanvasRenderSurfaceCreator` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webClipboard.ts:202:16` | `createWebClipboardProviderBackend` | `synthetic-entity:upstream/packages/host-web/src/webClipboard.ts:202:16` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webConnectivity.ts:13:19` | `createWebConnectivityBackend` | `synthetic-entity:upstream/packages/host-web/src/webConnectivity.ts:13:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webCursor.ts:5:15` | `createWebCursorBackend` | `synthetic-entity:upstream/packages/host-web/src/webCursor.ts:5:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webDevice.ts:18:15` | `createWebDeviceBackend` | `@flighthq/types:interface#DeviceBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webDevice.ts:35:21` | `readInsets` | `@flighthq/types:interface#SafeAreaInsets` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webDialog.ts:56:15` | `<anonymous>` | `@flighthq/types:interface#DirectoryOpenDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webDialog.ts:62:15` | `<anonymous>` | `@flighthq/types:interface#FileOpenDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webDialog.ts:68:15` | `<anonymous>` | `@flighthq/types:interface#FileSaveDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webDialog.ts:74:15` | `<anonymous>` | `@flighthq/types:interface#ImageOpenDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webDialog.ts:80:15` | `<anonymous>` | `@flighthq/types:interface#PhotoCaptureDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webDialog.ts:86:15` | `<anonymous>` | `@flighthq/types:interface#VideoCaptureDialogBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webFontLoading.ts:5:15` | `createWebFontLoadingBackend` | `synthetic-entity:upstream/packages/host-web/src/webFontLoading.ts:5:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webGlRenderSurface.ts:8:15` | `createWebGlRenderSurfaceProvider` | `@flighthq/types:interface#GlRenderSurfaceProvider` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webGlyphRasterizer.ts:12:15` | `createWebGlyphRasterizerBackend` | `synthetic-entity:upstream/packages/host-web/src/webGlyphRasterizer.ts:12:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webHaptics.ts:57:15` | `<anonymous>` | `@flighthq/types:interface#HapticsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webImage.ts:6:15` | `createWebImageBackend` | `@flighthq/types:interface#ImageBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:20:15` | `<anonymous>` | `@flighthq/types:interface#InputDropFileBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:40:15` | `<anonymous>` | `@flighthq/types:interface#InputFocusBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:55:15` | `<anonymous>` | `@flighthq/types:interface#InputPointerLockBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:98:15` | `<anonymous>` | `@flighthq/types:interface#InputTargetBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:112:15` | `<anonymous>` | `@flighthq/types:interface#RenderContextBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:133:15` | `<anonymous>` | `@flighthq/types:interface#RenderSurfaceBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:146:18` | `createWebInputTargetHandle` | `@flighthq/types:interface#InputTargetHandle` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webKeyboard.ts:14:15` | `createWebSoftKeyboardChangeBackend` | `@flighthq/types:interface#SoftKeyboardChangeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webKeyboard.ts:20:15` | `createWebSoftKeyboardInfoBackend` | `@flighthq/types:interface#SoftKeyboardInfoBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webKeyboard.ts:26:15` | `createWebSoftKeyboardVisibilityBackend` | `@flighthq/types:interface#SoftKeyboardVisibilityBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMediasession.ts:21:15` | `createWebMediaSessionActionBackend` | `@flighthq/types:interface#MediaSessionActionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMediasession.ts:27:15` | `createWebMediaSessionBackend` | `@flighthq/types:interface#MediaSessionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMenu.ts:31:15` | `<anonymous>` | `@flighthq/types:interface#MenuHighlightBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMenu.ts:37:15` | `<anonymous>` | `@flighthq/types:interface#MenuPopupBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMidi.ts:172:17` | `<anonymous>` | `@flighthq/types:interface#MidiAccessBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMidi.ts:178:19` | `<anonymous>` | `@flighthq/types:type#WebMidiAccessCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMidi.ts:183:17` | `<anonymous>` | `@flighthq/types:interface#MidiPermissionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMidi.ts:187:15` | `createWebMidiProfile` | `@flighthq/types:type#WebMidiPermissionAccessCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webMidi.ts:204:17` | `<anonymous>` | `@flighthq/types:interface#MidiEventAttachment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webNet.ts:15:15` | `createWebNetBackend` | `@flighthq/types:interface#NetBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webNotification.ts:20:15` | `createWebPageNotificationCapabilities` | `@flighthq/types:type#WebPageNotificationCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webPlatform.ts:16:15` | `createWebPlatformBackend` | `@flighthq/types:interface#PlatformBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webPower.ts:30:15` | `<anonymous>` | `@flighthq/types:interface#PowerKeepAwakeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webPower.ts:37:15` | `<anonymous>` | `@flighthq/types:interface#PowerSuspensionBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webPower.ts:52:15` | `createWebPowerReadings` | `@flighthq/types:type#WebPowerReadingCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webPower.ts:53:24` | `createWebPowerReadings` | `@flighthq/types:interface#PowerChangeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webPower.ts:107:24` | `createWebPowerReadings` | `@flighthq/types:interface#PowerStatusBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webPower.ts:216:15` | `<anonymous>` | `@flighthq/types:type#WebPowerCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webProtocol.ts:14:15` | `createWebProtocolCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webProtocol.ts:14:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webProtocol.ts:24:17` | `<anonymous>` | `@flighthq/types:interface#ProtocolLaunchBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webProtocol.ts:29:17` | `<anonymous>` | `@flighthq/types:interface#ProtocolRegistrationBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webRaster2DSurface.ts:6:15` | `createWebRaster2DSurfaceProvider` | `@flighthq/types:interface#Raster2DSurfaceProvider` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webRaster2DSurface.ts:18:21` | `<anonymous>` | `@flighthq/types:interface#Raster2DSurface` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webScreen.ts:188:17` | `<anonymous>` | `@flighthq/types:interface#ScreenQueryBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webScreen.ts:233:17` | `<anonymous>` | `@flighthq/types:interface#ScreenChangeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webScreen.ts:256:17` | `<anonymous>` | `@flighthq/types:interface#ScreenDetailsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webScreen.ts:288:17` | `<anonymous>` | `@flighthq/types:interface#ScreenPermissionChangeBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webScreen.ts:310:15` | `createWebScreenCapabilities` | `@flighthq/types:type#WebScreenCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webServiceWorkerNotification.ts:25:24` | `createWebServiceWorkerNotificationCapabilities` | `@flighthq/types:type#WebServiceWorkerNotificationCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webShare.ts:53:15` | `<anonymous>` | `@flighthq/types:interface#ShareContentBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webShare.ts:59:15` | `<anonymous>` | `@flighthq/types:interface#ShareFilesBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webShell.ts:20:15` | `<anonymous>` | `@flighthq/types:interface#ShellExternalBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webStorage.ts:119:15` | `<anonymous>` | `synthetic-entity:upstream/packages/host-web/src/webStorage.ts:119:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:17:30` | `createWebWindowStoragePersistenceCapabilities` | `@flighthq/types:interface#StoragePersistenceRequestBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:24:17` | `<anonymous>` | `@flighthq/types:interface#WebWindowStoragePersistenceCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:35:24` | `createWebWorkerStoragePersistenceCapabilities` | `@flighthq/types:interface#WebWorkerStoragePersistenceCapabilities` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:48:19` | `createPersistenceQueryBackend` | `@flighthq/types:interface#StoragePersistenceQueryBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webVideoCapability.ts:5:15` | `createWebVideoCapabilityBackend` | `synthetic-entity:upstream/packages/host-web/src/webVideoCapability.ts:5:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webWgpuRenderSurface.ts:8:15` | `createWebWgpuRenderSurfaceProvider` | `@flighthq/types:interface#WgpuRenderSurfaceProvider` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webWindow.ts:30:15` | `<anonymous>` | `synthetic-entity:upstream/packages/host-web/src/webWindow.ts:30:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webWindow.ts:202:18` | `createWebFullscreenTargetHandle` | `@flighthq/types:type#FullscreenTargetHandle` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/host-web/src/webWindow.ts:208:18` | `createWebWindowResizeTargetHandle` | `@flighthq/types:type#WindowResizeTargetHandle` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResource.ts:13:15` | `cloneImageResource` | `@flighthq/types:interface#ImageResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResource.ts:25:15` | `createCompressedImageResource` | `@flighthq/types:interface#CompressedImageResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResource.ts:31:20` | `createImageResource` | `@flighthq/types:interface#ImageResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceFrom.ts:16:15` | `createImageResourceFromCanvas` | `@flighthq/types:interface#ImageResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceFrom.ts:22:15` | `createImageResourceFromImageBitmap` | `@flighthq/types:interface#ImageResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceFrom.ts:28:15` | `createImageResourceFromImageElement` | `@flighthq/types:interface#ImageResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceReference.ts:32:15` | `createEmbeddedImageResourceReference` | `@flighthq/types:interface#EmbeddedImageResourceReference` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceReference.ts:41:15` | `createExternalImageResourceReference` | `@flighthq/types:interface#ExternalImageResourceReference` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceReference.ts:63:15` | `decodeEmbeddedImageResourceReference` | `@flighthq/types:interface#Bitmap` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceReference.ts:79:17` | `createImageResourceFailure` | `@flighthq/types:interface#ImageResourceFailure` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceReference.ts:85:15` | `createImageResourceFailure` | `@flighthq/types:interface#ImageResourceFailure` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/image/src/imageResourceReference.ts:206:19` | `resolveImageResourceReference` | `@flighthq/types:interface#ImageResourceFailure` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/input/src/inputManager.ts:243:15` | `createInputKeyRepeatTimer` | `@flighthq/types:interface#InputKeyRepeatTimer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/input/src/inputManager.ts:249:15` | `createInputManager` | `@flighthq/types:interface#InputManager` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/input/src/inputManager.ts:255:15` | `createInputSignals` | `@flighthq/types:interface#InputSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/input/src/inputManager.ts:261:15` | `createInputState` | `@flighthq/types:interface#InputState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/input/src/inputManager.ts:267:15` | `createWebInputIngressBackend` | `synthetic-entity:upstream/packages/input/src/inputManager.ts:267:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/interaction/src/focusManager.ts:56:15` | `createFocusManager` | `synthetic-entity:upstream/packages/interaction/src/focusManager.ts:56:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/interaction/src/interactionManager.ts:168:15` | `createInteractionManager` | `synthetic-entity:upstream/packages/interaction/src/interactionManager.ts:168:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/interaction/src/interactionManager.ts:174:15` | `createInteractionSignals` | `@flighthq/types:interface#InteractionSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/interaction/src/nodeInteractionState.ts:13:15` | `createNodeInteractionState` | `@flighthq/types:interface#NodeInteractionState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/keyboard/src/keyboard.ts:52:15` | `createSoftKeyboard` | `synthetic-entity:upstream/packages/keyboard/src/keyboard.ts:52:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/layout/src/layoutState.ts:5:15` | `createLayoutState` | `@flighthq/types:interface#LayoutState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lifecycle/src/lifecycle.ts:63:15` | `createAppLifecycle` | `@flighthq/types:interface#AppLifecycle` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lifecycle/src/lifecycle.ts:69:15` | `createWebLifecycleBackend` | `@flighthq/types:interface#LifecycleBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/ambientLight.ts:16:15` | `createAmbientLight` | `@flighthq/types:interface#AmbientLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/areaLight.ts:8:15` | `cloneAreaLight` | `@flighthq/types:interface#AreaLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/areaLight.ts:32:15` | `createAreaLight` | `@flighthq/types:interface#AreaLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/directionalLight.ts:8:15` | `cloneDirectionalLight` | `@flighthq/types:interface#DirectionalLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/directionalLight.ts:29:17` | `createDirectionalLight` | `@flighthq/types:interface#DirectionalLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/environment.ts:12:15` | `createEnvironment` | `@flighthq/types:interface#Environment` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/hemisphereLight.ts:17:15` | `createHemisphereLight` | `@flighthq/types:interface#HemisphereLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/pointLight.ts:8:15` | `clonePointLight` | `@flighthq/types:interface#PointLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/pointLight.ts:29:15` | `createPointLight` | `@flighthq/types:interface#PointLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/sceneLights.ts:5:15` | `createScene3DLights` | `@flighthq/types:interface#Scene3DLights` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/spotLight.ts:8:15` | `cloneSpotLight` | `@flighthq/types:interface#SpotLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/lighting/src/spotLight.ts:33:17` | `createSpotLight` | `@flighthq/types:interface#SpotLight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/loader/src/resourceLoader.ts:184:15` | `createResourceLoader` | `synthetic-entity:upstream/packages/loader/src/resourceLoader.ts:184:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/loader/src/resourceLoader.ts:210:19` | `<anonymous>` | `@flighthq/types:interface#ResourceLoaderItemSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/anisotropyPbrExtension.ts:9:15` | `createAnisotropyPbrExtension` | `@flighthq/types:interface#AnisotropyPbrExtension` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/clearcoatPbrExtension.ts:9:15` | `createClearcoatPbrExtension` | `@flighthq/types:interface#ClearcoatPbrExtension` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/colorScaleBias.ts:50:15` | `createColorScaleBias` | `@flighthq/types:interface#ColorScaleBias` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/iridescencePbrExtension.ts:11:15` | `createIridescencePbrExtension` | `@flighthq/types:interface#IridescencePbrExtension` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/material.ts:7:17` | `cloneMaterial` | `@flighthq/types:interface#Material` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/material.ts:21:20` | `createMaterial` | `@flighthq/types:interface#Material` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/sheenPbrExtension.ts:9:15` | `createSheenPbrExtension` | `@flighthq/types:interface#SheenPbrExtension` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/specularPbrExtension.ts:9:15` | `createSpecularPbrExtension` | `@flighthq/types:interface#SpecularPbrExtension` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/standardMaterial.ts:6:15` | `createStandardMaterial` | `@flighthq/types:interface#StandardMaterial` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/transmissionVolumePbrExtension.ts:11:15` | `createTransmissionVolumePbrExtension` | `@flighthq/types:interface#TransmissionVolumePbrExtension` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/materials/src/wrappedDiffusePbrExtension.ts:11:15` | `createWrappedDiffusePbrExtension` | `@flighthq/types:interface#WrappedDiffusePbrExtension` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/media/src/audioDeviceBackend.ts:20:15` | `createWebAudioDeviceBackend` | `synthetic-entity:upstream/packages/media/src/audioDeviceBackend.ts:20:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/media/src/audioMixer.ts:37:15` | `createAudioBus` | `@flighthq/types:interface#AudioBus` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/media/src/audioMixer.ts:46:17` | `createAudioMixer` | `@flighthq/types:interface#AudioMixer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/mediasession/src/mediasession.ts:40:15` | `createMediaSessionActionSignal` | `@flighthq/types:interface#MediaSessionActionSignal` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/menu/src/menu.ts:48:15` | `createMenuHighlight` | `@flighthq/types:interface#MenuHighlight` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/menu/src/menu.ts:71:15` | `createMenuSelect` | `@flighthq/types:interface#MenuSelect` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/menu/src/menu.ts:133:17` | `<anonymous>` | `@flighthq/types:interface#MenuSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/mesh/src/meshGeometry.ts:206:20` | `createMeshGeometryRuntime` | `@flighthq/types:interface#MeshGeometry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/midi/src/midiAccess.ts:22:15` | `createMidiAccessResource` | `@flighthq/types:interface#MidiAccess` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/midi/src/midiPort.ts:53:15` | `createMidiInputPortResource` | `@flighthq/types:interface#MidiInputPort` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/midi/src/midiPort.ts:64:15` | `createMidiOutputPortResource` | `@flighthq/types:interface#MidiOutputPort` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/midi/src/midiSubscription.ts:146:24` | `createMidiSubscription` | `synthetic-entity:upstream/packages/midi/src/midiSubscription.ts:146:24` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/motionpath/src/motionPath.ts:12:15` | `createMotionPath` | `@flighthq/types:interface#MotionPath` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/movieclip/src/movieClip.ts:44:15` | `createMovieClipData` | `@flighthq/types:interface#MovieClipData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/movieclip/src/spritesheetTimelineSource.ts:21:15` | `createSpritesheetTimelineSource` | `@flighthq/types:interface#TimelineSource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/node/src/node.ts:75:15` | `createNodeSignals` | `@flighthq/types:interface#NodeSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/node/src/nodeOrderList.ts:126:15` | `createNodeOrderList` | `synthetic-entity:upstream/packages/node/src/nodeOrderList.ts:126:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/node/src/viewport.ts:5:15` | `createViewport` | `@flighthq/types:interface#Viewport` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/notification/src/notification.ts:188:15` | `createNotificationResource` | `@flighthq/types:interface#Notification` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/notification/src/notification.ts:198:15` | `createScheduledNotificationResource` | `@flighthq/types:interface#ScheduledNotification` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/notification/src/notification.ts:341:24` | `createNotificationSubscription` | `synthetic-entity:upstream/packages/notification/src/notification.ts:341:24` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/particleemitter/src/particleEmitter.ts:215:15` | `createParticleEmitterData` | `@flighthq/types:interface#ParticleEmitterData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/particles/src/particleEmitterConfig.ts:5:15` | `createParticleEmitterConfig` | `@flighthq/types:interface#ParticleEmitterConfig` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/particles/src/particleEmitterSignals.ts:6:15` | `createParticleEmitterSignals` | `@flighthq/types:interface#ParticleEmitterSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/particles/src/particleEmitterState.ts:9:15` | `createParticleEmitterState` | `@flighthq/types:interface#ParticleEmitterState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/particles/src/particleObjectsState.ts:6:15` | `createParticleObjectsState` | `@flighthq/types:interface#ParticleObjectsState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/path-boolean/src/martinezKernel.ts:11:15` | `createMartinezPathBooleanBackend` | `@flighthq/types:interface#PathBooleanBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/path/src/copyPath.ts:15:17` | `copyPath` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/path/src/path.ts:248:15` | `createPath` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/path/src/pathMorph.ts:16:15` | `createPathMorph` | `@flighthq/types:interface#PathMorph` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/path/src/pathMorphGeometry.ts:62:19` | `<anonymous>` | `@flighthq/types:interface#PathMorph` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d-abi/src/physics2DAbiBuffer.ts:35:15` | `createPhysics2DAbiBodyBuffer` | `@flighthq/types:interface#Physics2DAbiBodyBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d-abi/src/physics2DAbiBuffer.ts:44:15` | `createPhysics2DAbiCommandBuffer` | `@flighthq/types:interface#Physics2DAbiCommandBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d-abi/src/physics2DAbiBuffer.ts:56:15` | `createPhysics2DAbiContactBuffer` | `@flighthq/types:interface#Physics2DAbiContactBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d-abi/src/physics2DAbiBuffer.ts:62:15` | `createPhysics2DAbiExecutionResult` | `@flighthq/types:interface#Physics2DAbiExecutionResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d-abi/src/physics2DAbiBuffer.ts:68:15` | `createPhysics2DAbiJointBuffer` | `@flighthq/types:interface#Physics2DAbiJointBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d-abi/src/physics2DAbiBuffer.ts:74:15` | `createPhysics2DAbiQueryBuffer` | `@flighthq/types:interface#Physics2DAbiQueryBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d-abi/src/referencePhysics2DAbi.ts:107:15` | `createReferencePhysics2DAbi` | `@flighthq/types:interface#Physics2DAbi` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/colliderTransform.ts:24:19` | `createPhysics2DColliderWorldShape` | `synthetic-entity:upstream/packages/physics2d/src/colliderTransform.ts:24:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics2d/src/colliderTransform.ts:30:19` | `createPhysics2DColliderWorldShape` | `synthetic-entity:upstream/packages/physics2d/src/colliderTransform.ts:30:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics2d/src/colliderTransform.ts:35:19` | `createPhysics2DColliderWorldShape` | `synthetic-entity:upstream/packages/physics2d/src/colliderTransform.ts:35:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics2d/src/colliderTransform.ts:40:19` | `createPhysics2DColliderWorldShape` | `synthetic-entity:upstream/packages/physics2d/src/colliderTransform.ts:40:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics2d/src/colliderTransform.ts:45:19` | `createPhysics2DColliderWorldShape` | `synthetic-entity:upstream/packages/physics2d/src/colliderTransform.ts:45:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics2d/src/colliderTransform.ts:50:19` | `createPhysics2DColliderWorldShape` | `synthetic-entity:upstream/packages/physics2d/src/colliderTransform.ts:50:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics2d/src/colliderTransform.ts:55:19` | `createPhysics2DColliderWorldShape` | `synthetic-entity:upstream/packages/physics2d/src/colliderTransform.ts:55:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics2d/src/debugGeometry.ts:30:15` | `createPhysics2DDebugGeometry` | `@flighthq/types:interface#Physics2DDebugGeometry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:62:15` | `createPhysics2DDistanceJoint` | `@flighthq/types:interface#Physics2DDistanceJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:68:15` | `createPhysics2DGearJoint` | `@flighthq/types:interface#Physics2DGearJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:74:15` | `createPhysics2DMouseJoint` | `@flighthq/types:interface#Physics2DMouseJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:82:15` | `createPhysics2DPrismaticJoint` | `@flighthq/types:interface#Physics2DPrismaticJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:88:15` | `createPhysics2DPulleyJoint` | `@flighthq/types:interface#Physics2DPulleyJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:94:15` | `createPhysics2DRevoluteJoint` | `@flighthq/types:interface#Physics2DRevoluteJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:100:15` | `createPhysics2DRopeJoint` | `@flighthq/types:interface#Physics2DRopeJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:106:15` | `createPhysics2DWeldJoint` | `@flighthq/types:interface#Physics2DWeldJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointFactories.ts:112:15` | `createPhysics2DWheelJoint` | `@flighthq/types:interface#Physics2DWheelJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/jointReactions.ts:10:15` | `createPhysics2DJointReaction` | `@flighthq/types:interface#Physics2DJointReaction` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/world.ts:184:15` | `createPhysics2DCollider` | `@flighthq/types:interface#Physics2DCollider` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/world.ts:249:15` | `createPhysics2DWorld` | `@flighthq/types:interface#Physics2DWorld` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/world.ts:264:15` | `createRigidBody2D` | `@flighthq/types:interface#RigidBody2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/worldQueries.ts:42:15` | `createPhysics2DQueryResult` | `@flighthq/types:interface#Physics2DQueryResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/worldQueries.ts:48:15` | `createPhysics2DRayResult` | `@flighthq/types:interface#Physics2DRayResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/worldQueries.ts:54:15` | `createPhysics2DShapeCastResult` | `@flighthq/types:interface#Physics2DShapeCastResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics2d/src/worldQueries.ts:512:15` | `createShapeCastProbe` | `@flighthq/types:interface#Physics2DCollider` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/physics3DAbiBuffer.ts:35:15` | `createPhysics3DAbiBodyBuffer` | `@flighthq/types:interface#Physics3DAbiBodyBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/physics3DAbiBuffer.ts:44:15` | `createPhysics3DAbiCommandBuffer` | `@flighthq/types:interface#Physics3DAbiCommandBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/physics3DAbiBuffer.ts:56:15` | `createPhysics3DAbiContactBuffer` | `@flighthq/types:interface#Physics3DAbiContactBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/physics3DAbiBuffer.ts:62:15` | `createPhysics3DAbiExecutionResult` | `@flighthq/types:interface#Physics3DAbiExecutionResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/physics3DAbiBuffer.ts:68:15` | `createPhysics3DAbiJointBuffer` | `@flighthq/types:interface#Physics3DAbiJointBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/physics3DAbiBuffer.ts:74:15` | `createPhysics3DAbiQueryBuffer` | `@flighthq/types:interface#Physics3DAbiQueryBuffer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/referencePhysics3DAbi.ts:116:15` | `createReferencePhysics3DAbi` | `@flighthq/types:interface#Physics3DAbi` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d-abi/src/referencePhysics3DAbi.ts:492:19` | `<anonymous>` | `@flighthq/types:interface#Physics3DMassData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:20:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:20:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:26:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:26:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:31:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:31:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:46:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:46:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:61:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:61:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:76:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:76:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:81:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:81:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:99:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:99:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/colliderTransform.ts:120:19` | `createPhysics3DColliderWorldShape` | `synthetic-entity:upstream/packages/physics3d/src/colliderTransform.ts:120:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/physics3d/src/contacts.ts:18:15` | `createPhysics3DContact` | `@flighthq/types:interface#Physics3DContact` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/contacts.ts:24:15` | `createPhysics3DContactPoint` | `@flighthq/types:interface#Physics3DContactPoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/debugGeometry.ts:18:15` | `createPhysics3DDebugGeometry` | `@flighthq/types:interface#Physics3DDebugGeometry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointFactories.ts:37:15` | `createPhysics3DBallAndSocketJoint` | `@flighthq/types:interface#Physics3DJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointFactories.ts:45:15` | `createPhysics3DConeTwistJoint` | `@flighthq/types:interface#Physics3DConeTwistJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointFactories.ts:51:15` | `createPhysics3DDistanceJoint` | `@flighthq/types:interface#Physics3DDistanceJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointFactories.ts:57:15` | `createPhysics3DFixedJoint` | `@flighthq/types:type#Physics3DFixedJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointFactories.ts:65:15` | `createPhysics3DGeneric6DofJoint` | `@flighthq/types:interface#Physics3DGeneric6DofJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointFactories.ts:71:15` | `createPhysics3DHingeJoint` | `@flighthq/types:interface#Physics3DHingeJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointFactories.ts:77:15` | `createPhysics3DSliderJoint` | `@flighthq/types:interface#Physics3DSliderJoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/jointReaction.ts:57:15` | `createPhysics3DJointReaction` | `@flighthq/types:interface#Physics3DJointReaction` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/massProperties.ts:373:15` | `createPhysics3DMassData` | `@flighthq/types:interface#Physics3DMassData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/solver.ts:26:15` | `createPhysics3DContactConstraint` | `@flighthq/types:interface#Physics3DContactConstraint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/solver.ts:32:15` | `createPhysics3DContactConstraintPoint` | `@flighthq/types:interface#Physics3DContactConstraintPoint` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/world.ts:258:15` | `createPhysics3DCollider` | `@flighthq/types:interface#Physics3DCollider` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/world.ts:317:15` | `createPhysics3DWorld` | `@flighthq/types:interface#Physics3DWorld` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/world.ts:337:15` | `createRigidBody3D` | `@flighthq/types:interface#RigidBody3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/worldQueries.ts:49:15` | `createPhysics3DQueryResult` | `@flighthq/types:interface#Physics3DQueryResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/worldQueries.ts:55:15` | `createPhysics3DRayResult` | `@flighthq/types:interface#Physics3DRayResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/worldQueries.ts:61:15` | `createPhysics3DShapeCastResult` | `@flighthq/types:interface#Physics3DShapeCastResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/physics3d/src/worldQueries.ts:572:15` | `createShapeCastProbe` | `@flighthq/types:interface#Physics3DCollider` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/picking/src/pickScene3D.ts:35:15` | `createScene3DHit` | `@flighthq/types:interface#Scene3DHit` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/platform/src/platform.ts:32:15` | `createPlatformInfo` | `@flighthq/types:interface#PlatformInfo` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/power/src/power.ts:107:15` | `createPower` | `@flighthq/types:interface#Power` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/protocol/src/protocol.ts:25:15` | `createProtocolHandler` | `@flighthq/types:interface#ProtocolHandler` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/quadbatch/src/quadBatch.ts:197:15` | `createQuadBatchData` | `@flighthq/types:interface#QuadBatchData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/quadbatch/src/quadBatch.ts:210:15` | `createQuadBatchSignals` | `@flighthq/types:interface#QuadBatchSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/quadbatch/src/quadBatch.ts:551:17` | `<anonymous>` | `@flighthq/types:interface#TintMaterialData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/registry-catalog/src/registryCatalog.ts:11:15` | `createRegistryCatalog` | `@flighthq/types:interface#RegistryCatalog` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/registry-codegen/src/registryCodegen.ts:18:15` | `createRegistryCodegenPlan` | `synthetic-entity:upstream/packages/registry-codegen/src/registryCodegen.ts:18:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:56:17` | `concatRegistryTable` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:56:17` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:84:15` | `concatRegistryTable` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:84:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:93:15` | `createKeyedTable` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:93:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:103:15` | `createOrdinalTable` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:103:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:109:15` | `createSlotTable` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:109:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:206:15` | `withoutRegistryTableEntry` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:206:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:220:15` | `withRegistryTableEntry` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:220:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/registry/src/registryTable.ts:238:15` | `withRegistryTableTombstone` | `synthetic-entity:upstream/packages/registry/src/registryTable.ts:238:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/render-gl/src/glExternalTexture.ts:23:18` | `createExternalGlTexture` | `@flighthq/types:interface#ExternalTexture` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glPipeline.ts:7:15` | `createEmptyGlRegistries` | `@flighthq/types:interface#GlRenderRegistries` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glPipeline.ts:13:20` | `createGlPipeline` | `@flighthq/types:interface#GlPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glRenderState.ts:24:17` | `createGlContextState` | `@flighthq/types:interface#GlContextState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glRenderTarget.ts:86:18` | `createGlRenderTarget` | `@flighthq/types:interface#GlRenderTarget` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glRenderTargetPool.ts:82:15` | `createGlRenderTargetPool` | `@flighthq/types:interface#GlRenderTargetPool` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glRenderTexturePool.ts:31:15` | `createGlRenderTexturePool` | `@flighthq/types:interface#GlRenderTexturePool` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glShader.ts:55:15` | `createDefaultGlBitmapShader` | `@flighthq/types:type#GlBitmapShader` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glShader.ts:65:15` | `createGlBitmapShader` | `@flighthq/types:type#GlBitmapShader` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glSkinPaletteTexture.ts:12:15` | `createGlSkinPaletteTexture` | `@flighthq/types:interface#GlSkinPaletteTexture` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-gl/src/glTestHelper.ts:56:19` | `<anonymous>` | `@flighthq/types:type#GlBitmapShader` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuCompressedTexture.ts:194:15` | `uploadWgpuCompressedImage` | `@flighthq/types:interface#WgpuTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuDraw.ts:204:17` | `bindWgpuTexture` | `@flighthq/types:interface#WgpuTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuDraw.ts:260:19` | `<anonymous>` | `@flighthq/types:interface#WgpuVideoTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuDraw.ts:323:15` | `createWgpuTextureEntry` | `@flighthq/types:interface#WgpuTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuDraw.ts:574:15` | `uploadWgpuBitmapEntry` | `@flighthq/types:interface#WgpuTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuDraw.ts:636:15` | `uploadWgpuImageResourceEntry` | `@flighthq/types:interface#WgpuTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuExternalTexture.ts:22:18` | `createExternalWgpuTexture` | `@flighthq/types:interface#ExternalTexture` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuExternalTexture.ts:37:21` | `<anonymous>` | `@flighthq/types:interface#WgpuTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuFullscreenPass.ts:17:15` | `createWgpuFullscreenPipeline` | `@flighthq/types:interface#WgpuFullscreenPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuHost.ts:7:15` | `createWebWgpuHostBackend` | `@flighthq/types:interface#WgpuHostBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuHost.ts:44:27` | `<anonymous>` | `@flighthq/types:interface#WgpuHostAcquisition` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuPipeline.ts:7:15` | `createEmptyWgpuRegistries` | `@flighthq/types:interface#WgpuRenderRegistries` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuPipeline.ts:13:20` | `createWgpuPipeline` | `@flighthq/types:interface#WgpuPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderState.ts:48:17` | `createWgpuAcquisitionFromCanvasElement` | `@flighthq/types:interface#WgpuHostAcquisition` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderState.ts:58:17` | `createWgpuDeviceState` | `@flighthq/types:interface#WgpuDeviceState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderState.ts:89:19` | `<anonymous>` | `synthetic-entity:upstream/packages/render-wgpu/src/wgpuRenderState.ts:89:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderState.ts:110:15` | `createWgpuOffscreenRenderState` | `synthetic-entity:upstream/packages/render-wgpu/src/wgpuRenderState.ts:110:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderTarget.ts:113:15` | `createWgpuRenderTarget` | `@flighthq/types:interface#WgpuRenderTarget` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderTarget.ts:166:19` | `<anonymous>` | `@flighthq/types:interface#WgpuTextureEntry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderTargetPool.ts:50:15` | `createWgpuRenderTargetPool` | `@flighthq/types:type#WgpuRenderTargetPool` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuRenderTexturePool.ts:31:15` | `createWgpuRenderTexturePool` | `@flighthq/types:interface#WgpuRenderTexturePool` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render-wgpu/src/wgpuShader.ts:166:15` | `createWgpuBindGroupLayouts` | `@flighthq/types:interface#WgpuBindGroupLayouts` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render/src/renderCache.ts:21:15` | `createRenderCache` | `@flighthq/types:interface#RenderCache` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render/src/renderCache.ts:27:19` | `createRenderCacheAdapter` | `@flighthq/types:type#RenderCacheAdapter` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render/src/renderProxy.ts:35:15` | `createRenderProxy` | `@flighthq/types:interface#RenderProxy` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render/src/renderQueue.ts:63:15` | `createRenderQueue` | `@flighthq/types:interface#RenderQueue` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render/src/renderState.ts:13:17` | `createRenderState` | `@flighthq/types:interface#RenderState` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/render/src/renderViewport.ts:30:15` | `createRenderViewport2D` | `@flighthq/types:interface#RenderViewport2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/requirements/src/requirementSet.ts:8:15` | `createRequirementSet` | `@flighthq/types:interface#RequirementSet` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene-document/src/flightDocumentText.ts:507:21` | `<anonymous>` | `@flighthq/types:interface#FlightDocumentRefusalExplanation` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene-document/src/sceneDocumentRefusal.ts:267:15` | `createDocumentRefusal` | `@flighthq/types:interface#FlightDocumentRefusalExplanation` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene-document/src/sceneDocumentScene2DMaterialization.ts:60:15` | `createFlightDocumentFromScene2D` | `synthetic-entity:upstream/packages/scene-document/src/sceneDocumentScene2DMaterialization.ts:60:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene-document/src/sceneDocumentScene2DMaterialization.ts:120:15` | `createFlightDocumentScene2DMaterialization` | `@flighthq/types:interface#FlightDocumentScene2DMaterialization` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene-document/src/sceneDocumentScene3DMaterialization.ts:79:15` | `createFlightDocumentFromScene3D` | `synthetic-entity:upstream/packages/scene-document/src/sceneDocumentScene3DMaterialization.ts:79:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene-document/src/sceneDocumentScene3DMaterialization.ts:143:15` | `createFlightDocumentScene3DMaterialization` | `@flighthq/types:interface#FlightDocumentScene3DMaterialization` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasPipeline.ts:7:20` | `createCanvasPipeline` | `@flighthq/types:interface#CanvasPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasPipeline.ts:14:15` | `createEmptyCanvasRegistries` | `@flighthq/types:interface#CanvasRenderRegistries` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasRenderSurface.ts:69:19` | `finishCanvasRenderSurface` | `@flighthq/types:interface#CanvasRenderSurface` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasRenderTarget.ts:65:15` | `createCanvasRenderTarget` | `@flighthq/types:interface#CanvasRenderTarget` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasRenderTexturePool.ts:33:25` | `createCanvasRenderTexturePool` | `@flighthq/types:interface#CanvasRenderTargetPool` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasRenderTexturePool.ts:35:15` | `createCanvasRenderTexturePool` | `@flighthq/types:interface#CanvasRenderTexturePool` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasTestSupport.ts:24:19` | `<anonymous>` | `@flighthq/types:interface#CanvasRenderSurfaceCreator` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-canvas/src/canvasTextLabel.ts:26:15` | `createCanvasTextLabelData` | `synthetic-entity:upstream/packages/scene2d-canvas/src/canvasTextLabel.ts:26:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-canvas/src/canvasTextureResolver.ts:47:21` | `createCanvasTextureResolvers` | `@flighthq/types:interface#CanvasTextureResolvers` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-dom/src/domClipRectangle.ts:72:15` | `createDomScene2DRectangle` | `synthetic-entity:upstream/packages/scene2d-dom/src/domClipRectangle.ts:72:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domRichText.ts:39:15` | `createDomRichTextData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domRichText.ts:39:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domScale9Shape.ts:32:15` | `createDomScale9ShapeData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domScale9Shape.ts:32:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domScale9Sprite.ts:22:15` | `createDomScale9SpriteData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domScale9Sprite.ts:22:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domShape.ts:26:15` | `createDomShapeData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domShape.ts:26:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domTextLabel.ts:27:15` | `createDomTextData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domTextLabel.ts:27:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-formats/src/lottieDocument.ts:113:17` | `createScene2DFromLottieDocument` | `@flighthq/types:interface#LottieDocumentImportResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-formats/src/lottieDocument.ts:136:15` | `createScene2DFromLottieDocument` | `@flighthq/types:interface#LottieDocumentImportResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-formats/src/riveObjectGraph.ts:19:15` | `createRiveObjectGraph` | `@flighthq/types:interface#RiveObjectGraph` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-formats/src/riveScene2D.ts:53:19` | `<anonymous>` | `@flighthq/types:interface#RiveDocumentImportResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-formats/src/riveScene2D.ts:63:15` | `createScene2DFromRiveDocument` | `@flighthq/types:interface#RiveDocumentImportResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-formats/src/riveScene2DDocument.ts:55:21` | `<anonymous>` | `@flighthq/types:interface#Scene2DSlotReference` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-formats/src/riveScene2DDocument.ts:123:15` | `createScene2DDocumentFromRiveDocument` | `@flighthq/types:interface#RiveScene2DDocumentResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-formats/src/riveSkeleton.ts:55:15` | `createRiveSkeleton2D` | `@flighthq/types:interface#RiveSkeleton2DImport` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-gl/src/glRichText.ts:45:15` | `createGlRichTextData` | `synthetic-entity:upstream/packages/scene2d-gl/src/glRichText.ts:45:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-gl/src/glScale9Shape.ts:55:15` | `createGlScale9ShapeData` | `synthetic-entity:upstream/packages/scene2d-gl/src/glScale9Shape.ts:55:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-gl/src/glShapeData.ts:31:15` | `createGlShapeData` | `@flighthq/types:interface#GlShapeRendererData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-gl/src/glTextLabel.ts:53:15` | `createGlTextLabelData` | `synthetic-entity:upstream/packages/scene2d-gl/src/glTextLabel.ts:53:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-resources/src/scene2DDocument.ts:19:15` | `createScene2DDocument` | `@flighthq/types:interface#Scene2DDocument` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-resources/src/scene2DDocument.ts:30:15` | `createScene2DSlotReference` | `@flighthq/types:interface#Scene2DSlotReference` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d-resources/src/scene2DDocumentImporterRegistry.ts:27:15` | `createScene2DDocumentImporterRegistry` | `@flighthq/types:interface#Scene2DDocumentImporterRegistry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d/src/htmlView.ts:28:15` | `createHtmlViewData` | `@flighthq/types:interface#HtmlViewData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d/src/scale9Sprite.ts:31:15` | `createScale9SpriteData` | `@flighthq/types:interface#Scale9SpriteData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d/src/scene2d.ts:25:19` | `createScene2D` | `@flighthq/types:interface#Scene2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d/src/scene2d.ts:39:15` | `createScene2DSignals` | `@flighthq/types:interface#Scene2DSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d/src/sceneKindUsage.ts:14:15` | `createScene2DKindUsage` | `synthetic-entity:upstream/packages/scene2d/src/sceneKindUsage.ts:14:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d/src/sprite.ts:40:15` | `createSpriteData` | `@flighthq/types:interface#SpriteData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene2d/src/sprite.ts:46:15` | `createSpriteRendererData` | `@flighthq/types:interface#SpriteIdentityRendererData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d-resources/src/resolveScene3DResources.ts:156:19` | `<anonymous>` | `@flighthq/types:interface#ImageResourceFailure` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d-resources/src/sceneMaterialTextureRegistry.ts:18:15` | `createScene3DMaterialTextureRegistry` | `@flighthq/types:interface#Scene3DMaterialTextureRegistry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d-resources/src/sceneResourceResolver.ts:37:15` | `createScene3DResourceResolver` | `@flighthq/types:interface#Scene3DResourceResolverWithRuntime` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d-resources/src/sceneResourceSignals.ts:11:15` | `createScene3DResourceSignals` | `@flighthq/types:interface#Scene3DResourceSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d-wgpu/src/wgpuMeshPipeline.ts:120:15` | `createWgpuMeshPipeline` | `@flighthq/types:interface#WgpuMeshPipeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d/src/scene.ts:10:15` | `createScene3D` | `@flighthq/types:interface#Scene3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d/src/sceneDocument.ts:127:19` | `<anonymous>` | `@flighthq/types:interface#Skeleton3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/scene3d/src/sceneKindUsage.ts:16:15` | `createScene3DKindUsage` | `@flighthq/types:interface#Scene3DKindUsage` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/screen/src/screen.ts:38:15` | `createScreenInfo` | `@flighthq/types:interface#ScreenInfo` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/screen/src/screen.ts:44:15` | `createScreenMode` | `@flighthq/types:interface#ScreenMode` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/screen/src/screen.ts:50:15` | `createScreenPermissionChange` | `@flighthq/types:interface#ScreenPermissionChange` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/screen/src/screen.ts:56:15` | `createScreenSignals` | `@flighthq/types:interface#ScreenSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/selection/src/lassoSelection.ts:29:21` | `createLassoSelection` | `@flighthq/types:interface#LassoSelection` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/selection/src/lassoSelection.ts:35:19` | `<anonymous>` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:234:15` | `createAmbientLightReading` | `@flighthq/types:interface#AmbientLightReading` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:240:15` | `createMotionReading` | `@flighthq/types:interface#MotionReading` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:246:15` | `createOrientationReading` | `@flighthq/types:interface#OrientationReading` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:252:15` | `createPressureReading` | `@flighthq/types:interface#PressureReading` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:258:15` | `createProximityReading` | `@flighthq/types:interface#ProximityReading` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:264:15` | `createQuaternionReading` | `@flighthq/types:interface#QuaternionReading` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:270:15` | `createRotationRateReading` | `@flighthq/types:interface#RotationRateReading` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:276:15` | `createSensors` | `@flighthq/types:interface#Sensors` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/sensors/src/sensors.ts:293:15` | `createWebSensorsBackend` | `@flighthq/types:interface#SensorsBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createAnimatedNormalModifier.ts:17:15` | `createAnimatedNormalModifier` | `@flighthq/types:interface#AnimatedNormalModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createDissolveModifier.ts:12:15` | `createDissolveModifier` | `@flighthq/types:interface#DissolveModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createEmissiveModifier.ts:13:15` | `createEmissiveModifier` | `@flighthq/types:interface#EmissiveModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createEnvReflectModifier.ts:12:15` | `createEnvReflectModifier` | `@flighthq/types:interface#EnvReflectModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createFogModifier.ts:13:15` | `createFogModifier` | `@flighthq/types:interface#FogModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createRimModifier.ts:12:15` | `createRimModifier` | `@flighthq/types:interface#RimModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createShadedMaterial.ts:20:15` | `createShadedMaterial` | `@flighthq/types:interface#ShadedMaterial` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createToonModifier.ts:12:15` | `createToonModifier` | `@flighthq/types:interface#ToonModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/createVertexDisplaceModifier.ts:18:15` | `createVertexDisplaceModifier` | `@flighthq/types:interface#VertexDisplaceModifier` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shading/src/modifierRegistry.ts:25:15` | `createModifierRegistry` | `@flighthq/types:interface#ModifierRegistry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/compactStrokePath.ts:22:18` | `compactStrokePath` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/morphShape.ts:53:15` | `createMorphShapeData` | `@flighthq/types:interface#MorphShapeData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/morphShapeAnimation.ts:35:15` | `createMorphShapeAnimationTarget` | `@flighthq/types:interface#MorphShapeAnimationTarget` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/scale9Shape.ts:31:15` | `createScale9ShapeData` | `@flighthq/types:interface#Scale9ShapeData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/shape.ts:51:15` | `createShapeData` | `@flighthq/types:interface#ShapeData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/shapeFill.ts:143:23` | `<anonymous>` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/shapeStroke.ts:59:23` | `<anonymous>` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shape/src/shapeStrokeOutline.ts:78:23` | `<anonymous>` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/share/src/share.ts:39:15` | `enableShareSignals` | `@flighthq/types:interface#ShareSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/shortcut/src/shortcutExplicitDependency.ts:91:19` | `<anonymous>` | `@flighthq/types:interface#GlobalShortcut` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/signals/src/scope.ts:7:15` | `createSignalScope` | `@flighthq/types:interface#SignalScope` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/signals/src/signal.ts:9:15` | `createSignal` | `synthetic-entity:upstream/packages/signals/src/signal.ts:9:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/skeleton2d-formats/src/dragonBonesParse.ts:764:15` | `parseDragonBonesMeshDisplay` | `@flighthq/types:interface#MeshAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/dragonBonesParse.ts:875:15` | `parseDragonBonesWeightedMesh` | `@flighthq/types:interface#MeshAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/dragonBonesParse.ts:908:15` | `parseDragonBonesRegionDisplay` | `@flighthq/types:interface#RegionAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/spineBinaryParse.ts:1012:15` | `rejectSpineBinaryMesh` | `@flighthq/types:interface#MeshAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/spineBinaryParse.ts:1054:15` | `readSpineBinaryMeshAttachment` | `@flighthq/types:interface#MeshAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/spineBinaryParse.ts:1085:15` | `readSpineBinaryRegionAttachment` | `@flighthq/types:interface#RegionAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/spineParse.ts:283:17` | `parseSpineMeshAttachment` | `@flighthq/types:interface#MeshAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/spineParse.ts:296:15` | `parseSpineMeshAttachment` | `@flighthq/types:interface#MeshAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d-formats/src/spineParse.ts:311:15` | `parseSpineRegionAttachment` | `@flighthq/types:interface#RegionAttachment2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d/src/pathConstraint2D.ts:214:15` | `createScratchPath` | `@flighthq/types:interface#Path` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d/src/skeleton2d.ts:13:15` | `cloneSkeleton2D` | `@flighthq/types:interface#Skeleton2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d/src/skeleton2d.ts:155:15` | `createSkeleton2D` | `@flighthq/types:interface#Skeleton2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d/src/skeleton2dAnimationTarget.ts:36:15` | `createSkeleton2DBoneAnimationTarget` | `@flighthq/types:interface#Skeleton2DAnimationTarget` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d/src/skeleton2dAnimationTarget.ts:46:15` | `createSkeleton2DSlotAnimationTarget` | `@flighthq/types:interface#Skeleton2DSlotAnimationTarget` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton2d/src/skeleton2dDrawOrderTarget.ts:26:15` | `createSkeleton2DDrawOrderAnimationTarget` | `synthetic-entity:upstream/packages/skeleton2d/src/skeleton2dDrawOrderTarget.ts:26:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/skeleton2d/src/skin2D.ts:5:15` | `createSkin2D` | `@flighthq/types:interface#Skin2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton3d/src/skeleton3d.ts:21:17` | `cloneSkeleton3D` | `@flighthq/types:interface#Skeleton3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton3d/src/skeleton3d.ts:57:15` | `cloneSkeleton3DJointHierarchy` | `@flighthq/types:interface#Skeleton3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/skeleton3d/src/skeleton3d.ts:98:20` | `createSkeleton3D` | `@flighthq/types:interface#Skeleton3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/socket/src/socket.ts:58:18` | `createSocket` | `@flighthq/types:interface#Socket` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/socket/src/socket.ts:71:15` | `createWebSocketBackend` | `synthetic-entity:upstream/packages/socket/src/socket.ts:71:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/socket/src/socket.ts:105:19` | `<anonymous>` | `@flighthq/types:interface#SocketSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spatial/src/bvh3D.ts:36:15` | `createBvhSpatialBackend3D` | `synthetic-entity:upstream/packages/spatial/src/bvh3D.ts:36:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/spatial/src/spatialIndex.ts:19:15` | `createSpatialIndex2D` | `@flighthq/types:interface#SpatialIndex2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spatial/src/spatialIndex3D.ts:20:15` | `createSpatialIndex3D` | `@flighthq/types:interface#SpatialIndex3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spatial/src/uniformGrid.ts:62:15` | `createUniformGridSpatialBackend2D` | `synthetic-entity:upstream/packages/spatial/src/uniformGrid.ts:62:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/spatial/src/uniformGrid3D.ts:20:15` | `createUniformGridSpatialBackend3D` | `synthetic-entity:upstream/packages/spatial/src/uniformGrid3D.ts:20:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/spring/src/spring.ts:13:15` | `createSpring` | `@flighthq/types:interface#Spring` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spring/src/spring2D.ts:18:15` | `createSpring2D` | `@flighthq/types:interface#Spring2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spring/src/spring3D.ts:26:15` | `createSpring3D` | `@flighthq/types:interface#Spring3D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spring/src/springConfig.ts:9:17` | `<anonymous>` | `@flighthq/types:interface#SpringConfig` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spring/src/springConfig.ts:19:17` | `<anonymous>` | `@flighthq/types:interface#SpringConfig` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spring/src/springConfig.ts:29:17` | `<anonymous>` | `@flighthq/types:interface#SpringConfig` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spring/src/springConfig.ts:37:15` | `createSpringConfig` | `@flighthq/types:interface#SpringConfig` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spring/src/springConfig.ts:43:15` | `createSpringConfigFromPhysical` | `@flighthq/types:interface#SpringConfig` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheet.ts:17:15` | `cloneSpritesheet` | `@flighthq/types:interface#Spritesheet` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheet.ts:25:15` | `createSpritesheet` | `@flighthq/types:interface#Spritesheet` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheetAnimation.ts:5:15` | `createSpritesheetAnimation` | `@flighthq/types:interface#SpritesheetAnimation` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheetData.ts:14:15` | `createSpritesheetAnimationData` | `@flighthq/types:interface#SpritesheetAnimationData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheetData.ts:20:15` | `createSpritesheetData` | `@flighthq/types:interface#SpritesheetData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheetData.ts:26:15` | `createSpritesheetFrameData` | `@flighthq/types:interface#SpritesheetFrameData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheetFrame.ts:5:15` | `createSpritesheetFrame` | `@flighthq/types:interface#SpritesheetFrame` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheetPlayer.ts:28:15` | `cloneSpritesheetPlayer` | `@flighthq/types:interface#SpritesheetPlayer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/spritesheet/src/spritesheetPlayer.ts:42:15` | `createSpritesheetPlayer` | `@flighthq/types:interface#SpritesheetPlayer` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/statechart/src/statechart.ts:45:15` | `createStatechartInstance` | `@flighthq/types:interface#StatechartInstance` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/statechart/src/statechartSignals.ts:10:17` | `<anonymous>` | `@flighthq/types:interface#StatechartSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/statusbar/src/statusbar.ts:42:15` | `createStatusBar` | `@flighthq/types:interface#StatusBar` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/statusbar/src/statusbar.ts:48:15` | `createStatusBarInfo` | `@flighthq/types:interface#StatusBarInfo` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/storage/src/storage.ts:74:15` | `createStorageSignals` | `@flighthq/types:interface#StorageSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/swf/src/swfDocument.ts:151:15` | `createScene2DImportFromSwf` | `@flighthq/types:interface#SwfDocumentImport` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/swf/src/swfDocument.ts:997:15` | `createSwfTimelineSource` | `@flighthq/types:interface#TimelineSource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/swf/src/swfDocument.ts:2817:17` | `<anonymous>` | `@flighthq/types:interface#TimelineStreamAudioCue` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/swf/src/swfDocument.ts:2892:15` | `createSwfAudioCue` | `@flighthq/types:interface#TimelineAudioCue` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/text-markup/src/markupTagRegistry.ts:15:15` | `createMarkupTagRegistry` | `@flighthq/types:interface#MarkupTagRegistry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/text/src/nativeText.ts:47:15` | `createNativeTextData` | `@flighthq/types:interface#NativeTextData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/text/src/richText.ts:161:15` | `createTextFieldSignals` | `@flighthq/types:interface#TextFieldSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/text/src/textLabel.ts:81:15` | `createTextLabelData` | `@flighthq/types:interface#TextLabelData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textbidi/src/bidiClassBackend.ts:13:15` | `createCompactBidiClassBackend` | `@flighthq/types:interface#BidiClassBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textinput/src/selectableRichTextManager.ts:23:15` | `createSelectableRichTextManager` | `@flighthq/types:interface#SelectableRichTextManager` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textinput/src/textInputManager.ts:43:15` | `createTextInputManager` | `@flighthq/types:interface#TextInputManager` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textlayout/src/richTextContent.ts:44:15` | `createRichTextContent` | `@flighthq/types:interface#RichTextContent` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textlayout/src/textFormatRange.ts:5:15` | `createTextFormatRange` | `@flighthq/types:interface#TextFormatRange` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textlayout/src/textLayout.ts:778:15` | `createTextLayoutResult` | `@flighthq/types:interface#TextLayoutResult` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textlayout/src/textLayoutGroup.ts:5:15` | `createTextLayoutGroup` | `@flighthq/types:interface#TextLayoutGroup` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textlayout/src/textMetrics.ts:5:15` | `createTextMetrics` | `@flighthq/types:interface#TextMetrics` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textsegment/src/textSegmenterBackend.ts:17:15` | `createWebTextSegmenterBackend` | `@flighthq/types:interface#TextSegmenterBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textshaper-canvas/src/canvasTextShaper.ts:137:15` | `createCanvasTextShaperBackend` | `@flighthq/types:interface#CanvasTextShaperBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textshaper-canvas/src/canvasTextShaper.ts:197:15` | `_createSentinelBackend` | `@flighthq/types:interface#CanvasTextShaperBackend` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textshaper/src/textShaperCache.ts:23:15` | `createTextShaperCache` | `@flighthq/types:interface#TextShaperCache` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textshaper/src/textShaperRun.ts:26:15` | `createShapedRun` | `synthetic-entity:upstream/packages/textshaper/src/textShaperRun.ts:26:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/textshaper/src/textShaperSignals.ts:17:17` | `<anonymous>` | `@flighthq/types:interface#TextShaperSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/texture/src/renderTexture.ts:25:19` | `<anonymous>` | `@flighthq/types:interface#RenderTarget` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/texture/src/sampler.ts:7:15` | `cloneSampler` | `@flighthq/types:interface#Sampler` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/texture/src/sampler.ts:48:15` | `createSampler` | `@flighthq/types:interface#Sampler` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/texture/src/texture.ts:47:19` | `cloneTexture` | `@flighthq/types:interface#Texture2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/texture/src/texture.ts:54:19` | `cloneTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:54:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/texture/src/texture.ts:61:19` | `cloneTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:61:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/texture/src/texture.ts:68:19` | `cloneTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:68:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/texture/src/texture.ts:129:19` | `createTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:129:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/texture/src/texture.ts:137:19` | `createTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:137:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/texture/src/texture.ts:145:19` | `createTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:145:19` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/texture/src/texture.ts:173:15` | `createTexture2D` | `@flighthq/types:interface#Texture2D` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/texture/src/videoTexture.ts:120:17` | `createVideoImageResource` | `@flighthq/types:interface#ImageResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textureatlas/src/textureAtlas.ts:6:15` | `createTextureAtlas` | `@flighthq/types:interface#TextureAtlas` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/textureatlas/src/textureAtlasRegion.ts:122:15` | `createTextureAtlasRegion` | `@flighthq/types:interface#TextureAtlasRegion` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/tilemap/src/tilemap.ts:60:15` | `createTilemapData` | `@flighthq/types:interface#TilemapData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/tilemap/src/tilemap.ts:70:15` | `createTilemapSignals` | `@flighthq/types:interface#TilemapSignals` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/tilemap/src/tilemap.ts:255:17` | `<anonymous>` | `@flighthq/types:interface#TintMaterialData` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/timeline/src/timeline.ts:25:15` | `createTimeline` | `@flighthq/types:interface#Timeline` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/timeline/src/timeline.ts:37:15` | `createTimelineSource` | `@flighthq/types:interface#TimelineSource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/tokens/src/flightDocumentSceneTokens.ts:23:15` | `createFlightDocumentTokenResolverRegistry` | `@flighthq/types:interface#FlightDocumentTokenResolverRegistry` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/tokens/src/flightDocumentSceneTokens.ts:158:17` | `<anonymous>` | `@flighthq/types:interface#FlightDocumentRefusalExplanation` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/tokens/src/substituteFlightDocumentSceneTokens.ts:122:17` | `<anonymous>` | `@flighthq/types:interface#FlightDocumentRefusalExplanation` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/tray/src/tray.ts:77:29` | `createTrayIcon` | `synthetic-entity:upstream/packages/tray/src/tray.ts:77:29` | `contextual` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/tray/src/tray.ts:82:17` | `createTrayIcon` | `synthetic-entity:upstream/packages/tray/src/tray.ts:82:17` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/tray/src/tray.ts:87:17` | `createTrayIcon` | `synthetic-entity:upstream/packages/tray/src/tray.ts:87:17` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/tray/src/tray.ts:102:15` | `createTrayIcon` | `synthetic-entity:upstream/packages/tray/src/tray.ts:102:15` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/tween/src/internal.ts:85:15` | `makeTween` | `synthetic-entity:upstream/packages/tween/src/internal.ts:85:15` | `type-argument` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/tween/src/tweenManager.ts:6:15` | `createTweenManager` | `@flighthq/types:interface#TweenManager` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/velocity/src/velocityField.ts:65:15` | `createVelocityField` | `@flighthq/types:interface#VelocityField` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
| `upstream/packages/video/src/videoResource.ts:9:15` | `createVideoResource` | `@flighthq/types:interface#VideoResource` | `type-argument` | `omitted` | 0 | ready | `allocated-construction` | — |
