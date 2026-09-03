# Entity Factory Closure Audit

Upstream commit: `98a7a58a934f55555a561a308cc23c1363c45652`

This audit inventories exact calls to Flight's production `createEntity` helper. A ready site has either a declared concrete Entity identity or a closed local object shape that receives a private generated identity, plus a constructible field set. Source-order differences are normalized after preserving initializer evaluation order. It reports closure prerequisites; it does not activate named-schema class emission.

| Metric | Count |
| --- | ---: |
| Production createEntity calls | 368 |
| Exact concrete Entity calls | 178 |
| Exact concrete Entity schemas | 143 |
| Constructor-ready Entity calls | 351 |
| Blocked Entity calls | 0 |
| Bare Entity calls | 0 |
| Generic Entity calls | 0 |
| Private local Entity classes | 173 |
| Field-order-normalized calls | 24 |
| Missing-field-initialized calls | 9 |
| Spread-projected calls | 17 |
| Structural Entity calls | 0 |
| Exact non-Entity calls | 17 |
| Unresolved calls | 0 |

## Concrete Entity identities

| Identity | Calls | Ready | Blocked | Factory owners |
| --- | ---: | ---: | ---: | --- |
| `@flighthq/types:interface#Aabb` | 1 | 1 | 0 | `createAabb` |
| `@flighthq/types:interface#AccessibilityBackend` | 1 | 1 | 0 | `createWebAccessibilityBackend` |
| `@flighthq/types:interface#AmbientLight` | 1 | 1 | 0 | `createAmbientLight` |
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
| `@flighthq/types:interface#Application` | 1 | 1 | 0 | `createApplication` |
| `@flighthq/types:interface#ApplicationWindow` | 1 | 1 | 0 | `createApplicationWindow` |
| `@flighthq/types:interface#AreaLight` | 2 | 2 | 0 | `cloneAreaLight`, `createAreaLight` |
| `@flighthq/types:interface#Bitmap` | 8 | 8 | 0 | `cloneBitmap`, `createBitmap`, `createBitmapFromCanvas`, `cropBitmap`, `extendBitmap`, `makeBitmap`, `readBitmap`, `trimBitmap` |
| `@flighthq/types:interface#BoundingSphere` | 1 | 1 | 0 | `createBoundingSphere` |
| `@flighthq/types:interface#Camera3D` | 1 | 1 | 0 | `createCamera3D` |
| `@flighthq/types:interface#CameraShake` | 1 | 1 | 0 | `createCameraShake` |
| `@flighthq/types:interface#CanvasPipeline` | 1 | 1 | 0 | `createCanvasPipeline` |
| `@flighthq/types:interface#CanvasRenderSurface` | 1 | 1 | 0 | `finishCanvasRenderSurface` |
| `@flighthq/types:interface#CanvasRenderSurfaceCreator` | 1 | 1 | 0 | `createWebCanvasRenderSurfaceCreator` |
| `@flighthq/types:interface#CanvasTextureResolvers` | 1 | 1 | 0 | `createCanvasTextureResolvers` |
| `@flighthq/types:interface#CapacitorShareContentBackend` | 1 | 1 | 0 | `createCapacitorShareContentBackend` |
| `@flighthq/types:interface#Capsule` | 1 | 1 | 0 | `createCapsule` |
| `@flighthq/types:interface#ClearcoatPbrExtension` | 1 | 1 | 0 | `createClearcoatPbrExtension` |
| `@flighthq/types:interface#ClipboardTextBackend` | 1 | 1 | 0 | `createTauriClipboardBackend` |
| `@flighthq/types:interface#ColorScaleBias` | 1 | 1 | 0 | `createColorScaleBias` |
| `@flighthq/types:interface#CompressedImage` | 1 | 1 | 0 | `createCompressedImage` |
| `@flighthq/types:interface#Connectivity` | 1 | 1 | 0 | `createConnectivity` |
| `@flighthq/types:interface#DirectionalLight` | 2 | 2 | 0 | `cloneDirectionalLight`, `createDirectionalLight` |
| `@flighthq/types:interface#DownloadedUpdate` | 1 | 1 | 0 | `createDownloadedUpdate` |
| `@flighthq/types:interface#Environment` | 1 | 1 | 0 | `createEnvironment` |
| `@flighthq/types:interface#ExternalTexture` | 2 | 2 | 0 | `createExternalGlTexture`, `createExternalWgpuTexture` |
| `@flighthq/types:interface#FileDialogHandle` | 1 | 1 | 0 | `createFileDialogHandle` |
| `@flighthq/types:interface#FlyCameraController` | 1 | 1 | 0 | `createFlyCameraController` |
| `@flighthq/types:interface#Font` | 1 | 1 | 0 | `createFont` |
| `@flighthq/types:interface#Frustum` | 1 | 1 | 0 | `createFrustum` |
| `@flighthq/types:interface#GlContextState` | 1 | 1 | 0 | `createGlContextState` |
| `@flighthq/types:interface#GlobalShortcut` | 1 | 1 | 0 | `createGlobalShortcut` |
| `@flighthq/types:interface#GlPipeline` | 1 | 1 | 0 | `createGlPipeline` |
| `@flighthq/types:interface#HemisphereLight` | 1 | 1 | 0 | `createHemisphereLight` |
| `@flighthq/types:interface#Image` | 6 | 6 | 0 | `cloneImageResource`, `createImageResource`, `createImageResourceFromCanvas`, `createImageResourceFromImageBitmap`, `createImageResourceFromImageElement`, `createVideoImageResource` |
| `@flighthq/types:interface#InputDropFileBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#InputFocusBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#InputPointerLockBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#InputTargetBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#InputTargetHandle` | 1 | 1 | 0 | `createWebInputTargetHandle` |
| `@flighthq/types:interface#IpcMessageBackend` | 1 | 1 | 0 | `createElectronIpcMessageBackend` |
| `@flighthq/types:interface#IridescencePbrExtension` | 1 | 1 | 0 | `createIridescencePbrExtension` |
| `@flighthq/types:interface#Material` | 2 | 2 | 0 | `cloneMaterial`, `createMaterial` |
| `@flighthq/types:interface#Matrix` | 1 | 1 | 0 | `createMatrix` |
| `@flighthq/types:interface#Matrix3` | 1 | 1 | 0 | `createMatrix3` |
| `@flighthq/types:interface#Matrix4` | 1 | 1 | 0 | `createMatrix4` |
| `@flighthq/types:interface#MediaSessionActionBackend` | 1 | 1 | 0 | `createWebMediaSessionActionBackend` |
| `@flighthq/types:interface#MediaSessionActionSignal` | 1 | 1 | 0 | `createMediaSessionActionSignal` |
| `@flighthq/types:interface#MediaSessionBackend` | 1 | 1 | 0 | `createWebMediaSessionBackend` |
| `@flighthq/types:interface#MeshGeometry` | 1 | 1 | 0 | `createMeshGeometryRuntime` |
| `@flighthq/types:interface#MidiAccess` | 1 | 1 | 0 | `createMidiAccessResource` |
| `@flighthq/types:interface#MidiInputPort` | 1 | 1 | 0 | `createMidiInputPortResource` |
| `@flighthq/types:interface#MidiOutputPort` | 1 | 1 | 0 | `createMidiOutputPortResource` |
| `@flighthq/types:interface#Notification` | 1 | 1 | 0 | `createNotificationResource` |
| `@flighthq/types:interface#Obb` | 1 | 1 | 0 | `createObb` |
| `@flighthq/types:interface#OrbitCameraController` | 1 | 1 | 0 | `createOrbitCameraController` |
| `@flighthq/types:interface#Plane` | 1 | 1 | 0 | `createPlane` |
| `@flighthq/types:interface#PointLight` | 2 | 2 | 0 | `clonePointLight`, `createPointLight` |
| `@flighthq/types:interface#Power` | 1 | 1 | 0 | `createPower` |
| `@flighthq/types:interface#ProtocolHandler` | 1 | 1 | 0 | `createProtocolHandler` |
| `@flighthq/types:interface#Quaternion` | 1 | 1 | 0 | `createQuaternion` |
| `@flighthq/types:interface#Ray3D` | 1 | 1 | 0 | `createRay3D` |
| `@flighthq/types:interface#Rectangle` | 1 | 1 | 0 | `createRectangle` |
| `@flighthq/types:interface#RenderCache` | 1 | 1 | 0 | `createRenderCache` |
| `@flighthq/types:interface#RenderContextBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#RenderProxy` | 1 | 1 | 0 | `createRenderProxy` |
| `@flighthq/types:interface#RenderState` | 1 | 1 | 0 | `createRenderState` |
| `@flighthq/types:interface#RenderSurfaceBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#RenderTarget` | 1 | 1 | 0 | `createRenderTexture` |
| `@flighthq/types:interface#Sampler` | 2 | 2 | 0 | `cloneSampler`, `createSampler` |
| `@flighthq/types:interface#Scene2D` | 1 | 1 | 0 | `createScene2D` |
| `@flighthq/types:interface#Scene2DDocumentImporterRegistry` | 1 | 1 | 0 | `createScene2DDocumentImporterRegistry` |
| `@flighthq/types:interface#Scene3D` | 1 | 1 | 0 | `createScene3D` |
| `@flighthq/types:interface#Scene3DHit` | 1 | 1 | 0 | `createScene3DHit` |
| `@flighthq/types:interface#Scene3DLights` | 1 | 1 | 0 | `createScene3DLights` |
| `@flighthq/types:interface#Scene3DMaterialTextureRegistry` | 1 | 1 | 0 | `createScene3DMaterialTextureRegistry` |
| `@flighthq/types:interface#Scene3DResourceSignals` | 1 | 1 | 0 | `createScene3DResourceSignals` |
| `@flighthq/types:interface#ScheduledNotification` | 1 | 1 | 0 | `createScheduledNotificationResource` |
| `@flighthq/types:interface#ScreenInfo` | 2 | 2 | 0 | `createScreenInfo`, `emptyScreenInfo` |
| `@flighthq/types:interface#ScreenMode` | 1 | 1 | 0 | `createScreenMode` |
| `@flighthq/types:interface#ScreenPermissionChange` | 1 | 1 | 0 | `createScreenPermissionChange` |
| `@flighthq/types:interface#ScreenSignals` | 1 | 1 | 0 | `createScreenSignals` |
| `@flighthq/types:interface#ShadedMaterial` | 1 | 1 | 0 | `createShadedMaterial` |
| `@flighthq/types:interface#ShareContentBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#ShareFilesBackend` | 1 | 1 | 0 | `<module>` |
| `@flighthq/types:interface#ShareSignals` | 1 | 1 | 0 | `enableShareSignals` |
| `@flighthq/types:interface#SheenPbrExtension` | 1 | 1 | 0 | `createSheenPbrExtension` |
| `@flighthq/types:interface#ShellBeepBackend` | 1 | 1 | 0 | `makeElectronShellCapabilities` |
| `@flighthq/types:interface#ShellExternalBackend` | 3 | 3 | 0 | `<module>`, `makeElectronShellCapabilities`, `makeTauriShellCapabilities` |
| `@flighthq/types:interface#ShellPathOpenBackend` | 2 | 2 | 0 | `makeElectronShellCapabilities`, `makeTauriShellCapabilities` |
| `@flighthq/types:interface#ShellPathRevealBackend` | 2 | 2 | 0 | `makeElectronShellCapabilities`, `makeTauriShellCapabilities` |
| `@flighthq/types:interface#ShellShortcutLinkBackend` | 1 | 1 | 0 | `createElectronShellShortcutLinkBackend` |
| `@flighthq/types:interface#ShellTrashBackend` | 1 | 1 | 0 | `makeElectronShellCapabilities` |
| `@flighthq/types:interface#ShortcutQueryBackend` | 2 | 2 | 0 | `createElectronShortcutQueryBackend`, `createTauriShortcutQueryBackend` |
| `@flighthq/types:interface#ShortcutTriggerBackend` | 2 | 2 | 0 | `createElectronShortcutTriggerBackend`, `createTauriShortcutTriggerBackend` |
| `@flighthq/types:interface#Skeleton2D` | 2 | 2 | 0 | `cloneSkeleton2D`, `createSkeleton2D` |
| `@flighthq/types:interface#Skeleton3D` | 3 | 3 | 0 | `cloneSkeleton3D`, `cloneSkeleton3DJointHierarchy`, `createSkeleton3D` |
| `@flighthq/types:interface#SpecularPbrExtension` | 1 | 1 | 0 | `createSpecularPbrExtension` |
| `@flighthq/types:interface#SpotLight` | 2 | 2 | 0 | `cloneSpotLight`, `createSpotLight` |
| `@flighthq/types:interface#Spritesheet` | 2 | 2 | 0 | `cloneSpritesheet`, `createSpritesheet` |
| `@flighthq/types:interface#SpritesheetAnimation` | 1 | 1 | 0 | `createSpritesheetAnimation` |
| `@flighthq/types:interface#StandardMaterial` | 1 | 1 | 0 | `createStandardMaterial` |
| `@flighthq/types:interface#StorageSignals` | 1 | 1 | 0 | `createStorageSignals` |
| `@flighthq/types:interface#Texture2D` | 2 | 2 | 0 | `cloneTexture`, `createTexture2D` |
| `@flighthq/types:interface#TextureAtlas` | 1 | 1 | 0 | `createTextureAtlas` |
| `@flighthq/types:interface#TextureAtlasRegion` | 1 | 1 | 0 | `createTextureAtlasRegion` |
| `@flighthq/types:interface#Transform2D` | 1 | 1 | 0 | `createTransform2D` |
| `@flighthq/types:interface#Transform3D` | 1 | 1 | 0 | `createTransform3D` |
| `@flighthq/types:interface#TransmissionVolumePbrExtension` | 1 | 1 | 0 | `createTransmissionVolumePbrExtension` |
| `@flighthq/types:interface#UpdaterCommandBackend` | 1 | 1 | 0 | `createElectronUpdaterBackend` |
| `@flighthq/types:interface#Vector2` | 1 | 1 | 0 | `createVector2` |
| `@flighthq/types:interface#Vector3` | 1 | 1 | 0 | `createVector3` |
| `@flighthq/types:interface#Vector4` | 1 | 1 | 0 | `createVector4` |
| `@flighthq/types:interface#Viewport` | 1 | 1 | 0 | `createViewport` |
| `@flighthq/types:interface#WebWindowStoragePersistenceCapabilities` | 1 | 1 | 0 | `createWebWindowStoragePersistenceCapabilities` |
| `@flighthq/types:interface#WebWorkerStoragePersistenceCapabilities` | 1 | 1 | 0 | `createWebWorkerStoragePersistenceCapabilities` |
| `@flighthq/types:interface#WgpuDeviceState` | 1 | 1 | 0 | `createWgpuDeviceState` |
| `@flighthq/types:interface#WgpuPipeline` | 1 | 1 | 0 | `createWgpuPipeline` |
| `@flighthq/types:interface#WrappedDiffusePbrExtension` | 1 | 1 | 0 | `createWrappedDiffusePbrExtension` |
| `@flighthq/types:type#CapacitorCommonAppCapabilities` | 1 | 1 | 0 | `createCapacitorAppCapabilities` |
| `@flighthq/types:type#CapacitorNotificationCapabilities` | 1 | 1 | 0 | `createCapacitorNotificationCapabilities` |
| `@flighthq/types:type#CapacitorProtocolCapabilities` | 1 | 1 | 0 | `createCapacitorProtocolCapabilities` |
| `@flighthq/types:type#ElectronCommonAppCapabilities` | 1 | 1 | 0 | `createElectronAppCapabilities` |
| `@flighthq/types:type#ElectronProtocolCapabilities` | 1 | 1 | 0 | `createElectronProtocolCapabilities` |
| `@flighthq/types:type#TauriAppCapabilities` | 1 | 1 | 0 | `createTauriAppCapabilities` |
| `@flighthq/types:type#TauriNotificationCapabilities` | 1 | 1 | 0 | `createTauriNotificationCapabilities` |
| `@flighthq/types:type#WebPageNotificationCapabilities` | 1 | 1 | 0 | `createWebPageNotificationCapabilities` |
| `@flighthq/types:type#WebServiceWorkerNotificationCapabilities` | 1 | 1 | 0 | `createWebServiceWorkerNotificationCapabilities` |

## Sites

| Source | Factory | Destination | Route | Argument | Fields | Status | Normalizations | Blockers |
| --- | --- | --- | --- | --- | ---: | :---: | --- | --- |
| `upstream/packages/animation/src/animationBlend.ts:87:10` | `createAnimationSampleAccumulator` | `@flighthq/types:interface#AnimationSampleAccumulator` | `contextual` | `object` | 4 | ready | — | — |
| `upstream/packages/animation/src/animationBlendTree.ts:60:10` | `createAnimationBlendTree` | `@flighthq/types:interface#AnimationBlendTree` | `contextual` | `object` | 4 | ready | — | — |
| `upstream/packages/animation/src/animationBlendTree.ts:70:10` | `createAnimationBlendTreeInput` | `@flighthq/types:interface#AnimationBlendTreeInput` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/animation/src/animationClip.ts:14:10` | `cloneAnimationClip` | `@flighthq/types:interface#AnimationClip` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/animation/src/animationClip.ts:19:10` | `createAnimationChannel` | `@flighthq/types:interface#AnimationChannel` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/animation/src/animationClip.ts:38:10` | `createAnimationClip` | `@flighthq/types:interface#AnimationClip` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/animation/src/animationClip.ts:43:10` | `createAnimationClipEvent` | `@flighthq/types:interface#AnimationClipEvent` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/animation/src/animationCrossfade.ts:37:10` | `createAnimationCrossfade` | `@flighthq/types:interface#AnimationCrossfade` | `contextual` | `object` | 9 | ready | — | — |
| `upstream/packages/animation/src/animationLayerStack.ts:68:10` | `createAnimationLayerStack` | `@flighthq/types:interface#AnimationLayerStack` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/animation/src/animationLayerStack.ts:160:10` | `createAnimationLayer` | `@flighthq/types:interface#AnimationLayer` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/animation/src/animationPlayer.ts:109:10` | `cloneAnimationPlayer` | `@flighthq/types:interface#AnimationPlayer` | `contextual` | `object` | 10 | ready | — | — |
| `upstream/packages/animation/src/animationPlayer.ts:136:10` | `createAnimationPlayer` | `@flighthq/types:interface#AnimationPlayer` | `contextual` | `object` | 10 | ready | — | — |
| `upstream/packages/animation/src/animationRootMotion.ts:20:21` | `createAnimationRootMotionExtractor` | `@flighthq/types:interface#AnimationRootMotionExtractor` | `returned-variable` | `object` | 10 | ready | — | — |
| `upstream/packages/animation/src/animationStateMachine.ts:47:10` | `createAnimationStateMachine` | `@flighthq/types:interface#AnimationStateMachine` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/animation/src/animationStateMachine.ts:68:10` | `createAnimationStateMachineState` | `@flighthq/types:interface#AnimationStateMachineState` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/animation/src/animationTrack.ts:13:10` | `cloneAnimationTrack` | `@flighthq/types:interface#AnimationTrack` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/animation/src/animationTrack.ts:36:10` | `createAnimationTrack` | `@flighthq/types:interface#AnimationTrack` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/animation/src/animationTrack.ts:130:10` | `trimAnimationTrack` | `@flighthq/types:interface#AnimationTrack` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/app/src/app.ts:134:10` | `createApp` | `@flighthq/types:interface#App` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/application/src/application.ts:65:10` | `createApplication` | `@flighthq/types:interface#Application` | `contextual` | `object` | 13 | ready | — | — |
| `upstream/packages/application/src/applicationRenderView.ts:43:16` | `createApplicationRenderView` | `synthetic-entity:upstream/packages/application/src/applicationRenderView.ts:43:16` | `contextual` | `object` | 4 | ready | `synthetic-class` | — |
| `upstream/packages/application/src/window.ts:251:10` | `createApplicationWindow` | `@flighthq/types:interface#ApplicationWindow` | `contextual` | `object` | 36 | ready | `field-order` | — |
| `upstream/packages/bitmap/src/bitmap.ts:6:10` | `cloneBitmap` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/bitmap/src/bitmap.ts:74:10` | `createBitmap` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/bitmap/src/bitmapChannel.ts:136:10` | `makeBitmap` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/bitmap/src/bitmapCrop.ts:37:10` | `cropBitmap` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/bitmap/src/bitmapCrop.ts:110:10` | `extendBitmap` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/bitmap/src/bitmapCrop.ts:148:12` | `trimBitmap` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/bitmap/src/bitmapFrom.ts:27:10` | `createBitmapFromCanvas` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/camera-controls/src/cameraShake.ts:10:10` | `createCameraShake` | `@flighthq/types:interface#CameraShake` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/camera-controls/src/flyCameraController.ts:36:10` | `createFlyCameraController` | `@flighthq/types:interface#FlyCameraController` | `contextual` | `object` | 8 | ready | — | — |
| `upstream/packages/camera-controls/src/orbitCameraController.ts:42:10` | `createOrbitCameraController` | `@flighthq/types:interface#OrbitCameraController` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/camera/src/camera.ts:20:10` | `createCamera3D` | `@flighthq/types:interface#Camera3D` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/connectivity/src/connectivity.ts:50:10` | `createConnectivity` | `@flighthq/types:interface#Connectivity` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/dialog/src/fileDialog.ts:26:18` | `createFileDialogHandle` | `@flighthq/types:interface#FileDialogHandle` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/entity/src/clone.ts:12:10` | `cloneEntity` | `local-entity` | `contextual` | `object` | 0 | ready | `runtime-class-clone` | — |
| `upstream/packages/entity/src/host.ts:8:10` | `createHost` | `synthetic-entity:upstream/packages/entity/src/host.ts:8:10` | `contextual` | `object` | 26 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/font/src/font.ts:5:10` | `createFont` | `@flighthq/types:interface#Font` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/font/src/glyphOutlineSource.ts:21:10` | `createGlyphRasterizerBackendFromGlyphOutlineSource` | `synthetic-entity:upstream/packages/font/src/glyphOutlineSource.ts:21:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/geometry/src/aabb.ts:67:10` | `createAabb` | `@flighthq/types:interface#Aabb` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/geometry/src/boundingSphere.ts:48:10` | `createBoundingSphere` | `@flighthq/types:interface#BoundingSphere` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/geometry/src/capsule.ts:24:10` | `createCapsule` | `@flighthq/types:interface#Capsule` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/geometry/src/frustum.ts:20:10` | `createFrustum` | `@flighthq/types:interface#Frustum` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/geometry/src/matrix.ts:149:10` | `createMatrix` | `@flighthq/types:interface#Matrix` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/geometry/src/matrix3.ts:114:24` | `createMatrix3` | `@flighthq/types:interface#Matrix3` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/geometry/src/matrix4.ts:360:24` | `createMatrix4` | `@flighthq/types:interface#Matrix4` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/geometry/src/obb.ts:28:10` | `createObb` | `@flighthq/types:interface#Obb` | `contextual` | `object` | 10 | ready | — | — |
| `upstream/packages/geometry/src/plane.ts:26:10` | `createPlane` | `@flighthq/types:interface#Plane` | `contextual` | `object` | 4 | ready | — | — |
| `upstream/packages/geometry/src/quaternion.ts:41:10` | `createQuaternion` | `@flighthq/types:interface#Quaternion` | `contextual` | `object` | 4 | ready | `field-order` | — |
| `upstream/packages/geometry/src/ray3d.ts:24:10` | `createRay3D` | `@flighthq/types:interface#Ray3D` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/geometry/src/rectangle.ts:53:10` | `createRectangle` | `@flighthq/types:interface#Rectangle` | `contextual` | `object` | 4 | ready | `field-order` | — |
| `upstream/packages/geometry/src/transform2d.ts:18:10` | `createTransform2D` | `@flighthq/types:interface#Transform2D` | `contextual` | `object` | 9 | ready | — | — |
| `upstream/packages/geometry/src/transform3d.ts:16:10` | `createTransform3D` | `@flighthq/types:interface#Transform3D` | `contextual` | `object` | 3 | ready | `field-order` | — |
| `upstream/packages/geometry/src/vector2.ts:59:10` | `createVector2` | `@flighthq/types:interface#Vector2` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/geometry/src/vector3.ts:83:10` | `createVector3` | `@flighthq/types:interface#Vector3` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/geometry/src/vector4.ts:89:10` | `createVector4` | `@flighthq/types:interface#Vector4` | `contextual` | `object` | 4 | ready | `field-order` | — |
| `upstream/packages/glyphatlas/src/glyphRasterizerBackend.ts:12:10` | `createStubGlyphRasterizerBackend` | `synthetic-entity:upstream/packages/glyphatlas/src/glyphRasterizerBackend.ts:12:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:37:50` | `createCapacitorAppCapabilities` | `@flighthq/types:type#CapacitorCommonAppCapabilities` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:38:15` | `createCapacitorAppCapabilities` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorApp.ts:38:15` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:46:11` | `createCapacitorAppCapabilities` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorApp.ts:46:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:47:14` | `createCapacitorAppCapabilities` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorApp.ts:47:14` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:50:10` | `createCapacitorAppCapabilities` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorApp.ts:50:10` | `contextual` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:52:11` | `createCapacitorAppCapabilities` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorApp.ts:52:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorApp.ts:53:11` | `createCapacitorAppCapabilities` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorApp.ts:53:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorClipboard.ts:15:10` | `createCapacitorClipboardBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorClipboard.ts:15:10` | `contextual` | `object` | 7 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorConnectivity.ts:70:10` | `createCapacitorConnectivityBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorConnectivity.ts:70:10` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorDevice.ts:42:10` | `createCapacitorDeviceBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorDevice.ts:42:10` | `contextual` | `object` | 5 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorDialog.ts:8:10` | `createCapacitorMessageDialogBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorDialog.ts:8:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorDialog.ts:31:10` | `createCapacitorPromptDialogBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorDialog.ts:31:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorFileSystem.ts:14:10` | `createCapacitorFileSystemBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorFileSystem.ts:14:10` | `contextual` | `object` | 14 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorGeolocation.ts:24:10` | `createCapacitorGeolocationBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorGeolocation.ts:24:10` | `contextual` | `object` | 6 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:32:10` | `createCapacitorSoftKeyboardAccessoryBarBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorKeyboard.ts:32:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:46:10` | `createCapacitorSoftKeyboardChangeBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorKeyboard.ts:46:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:83:10` | `createCapacitorSoftKeyboardInfoBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorKeyboard.ts:83:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:98:10` | `createCapacitorSoftKeyboardResizeModeWriteBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorKeyboard.ts:98:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:113:10` | `createCapacitorSoftKeyboardScrollAssistBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorKeyboard.ts:113:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:126:10` | `createCapacitorSoftKeyboardStyleBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorKeyboard.ts:126:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorKeyboard.ts:141:10` | `createCapacitorSoftKeyboardVisibilityBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorKeyboard.ts:141:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorNotification.ts:101:10` | `createCapacitorNotificationCapabilities` | `@flighthq/types:type#CapacitorNotificationCapabilities` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/host-capacitor/src/capacitorProtocol.ts:9:10` | `createCapacitorProtocolCapabilities` | `@flighthq/types:type#CapacitorProtocolCapabilities` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-capacitor/src/capacitorProtocol.ts:10:11` | `createCapacitorProtocolCapabilities` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorProtocol.ts:10:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorRegister.ts:103:10` | `capacitorHost` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorRegister.ts:103:10` | `contextual` | `object` | 26 | ready | `synthetic-class` | — |
| `upstream/packages/host-capacitor/src/capacitorShare.ts:13:10` | `createCapacitorShareContentBackend` | `@flighthq/types:interface#CapacitorShareContentBackend` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/host-capacitor/src/capacitorStatusBar.ts:40:10` | `createCapacitorStatusBarBackend` | `synthetic-entity:upstream/packages/host-capacitor/src/capacitorStatusBar.ts:40:10` | `contextual` | `object` | 5 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:41:49` | `createElectronAppCapabilities` | `@flighthq/types:type#ElectronCommonAppCapabilities` | `contextual` | `object` | 13 | ready | — | — |
| `upstream/packages/host-electron/src/electronApp.ts:42:23` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:42:23` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:43:12` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:43:12` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:44:13` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:44:13` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:49:11` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:49:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:50:16` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:50:16` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:51:11` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:51:11` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:56:11` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:56:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:57:18` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:57:18` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:65:12` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:65:12` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:66:15` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:66:15` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:67:21` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:67:21` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:72:21` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:72:21` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:77:14` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:77:14` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:83:12` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:83:12` | `contextual` | `object` | 10 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/host-electron/src/electronApp.ts:85:17` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:85:17` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:86:25` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:86:25` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:89:14` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:89:14` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:90:13` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:90:13` | `contextual` | `object` | 6 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:100:17` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:100:17` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:105:20` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:105:20` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:106:13` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:106:13` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:108:13` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:108:13` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:113:12` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:113:12` | `contextual` | `object` | 3 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/host-electron/src/electronApp.ts:117:20` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:117:20` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:121:10` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:121:10` | `contextual` | `object` | 1 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/host-electron/src/electronApp.ts:123:12` | `createElectronAppCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:123:12` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:128:10` | `createElectronLoginItemBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:128:10` | `return` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronApp.ts:150:10` | `createElectronRecentDocumentsBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronApp.ts:150:10` | `return` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronClipboard.ts:23:10` | `createElectronClipboardBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronClipboard.ts:23:10` | `contextual` | `object` | 19 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronDialog.ts:18:10` | `createElectronDirectoryOpenDialogBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronDialog.ts:18:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronDialog.ts:40:10` | `createElectronFileOpenDialogBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronDialog.ts:40:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronDialog.ts:67:10` | `createElectronFileSaveDialogBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronDialog.ts:67:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronIpc.ts:13:10` | `createElectronIpcMessageBackend` | `@flighthq/types:interface#IpcMessageBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-electron/src/electronMenu.ts:29:18` | `createElectronMenuBackends` | `@flighthq/types:interface#MenuApplicationBackend` | `contextual` | `object` | 2 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronMenu.ts:44:12` | `createElectronMenuBackends` | `@flighthq/types:interface#MenuPopupBackend` | `contextual` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronMenu.ts:59:13` | `createElectronMenuBackends` | `@flighthq/types:interface#MenuSelectBackend` | `contextual` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronNotification.ts:177:44` | `createElectronNotificationCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronNotification.ts:177:44` | `contextual` | `object` | 6 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronNotification.ts:178:10` | `createElectronNotificationCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronNotification.ts:178:10` | `contextual` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/host-electron/src/electronPlatform.ts:9:10` | `createElectronPlatformBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronPlatform.ts:9:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronPower.ts:44:20` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerBatteryHealthBackend` | `type-argument` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronPower.ts:49:13` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerChangeBackend` | `type-argument` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronPower.ts:59:11` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerIdleBackend` | `type-argument` | `object` | 2 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronPower.ts:69:16` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerKeepAwakeBackend` | `type-argument` | `object` | 4 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronPower.ts:102:18` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerSessionLockBackend` | `type-argument` | `object` | 2 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronPower.ts:112:13` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerStatusBackend` | `type-argument` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronPower.ts:126:17` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerSuspensionBackend` | `type-argument` | `object` | 2 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronPower.ts:146:14` | `createElectronPowerBackends` | `@flighthq/types:interface#PowerThermalBackend` | `type-argument` | `object` | 2 | not-entity | — | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:7:24` | `createElectronProtocolCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronProtocol.ts:7:24` | `variable` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:15:10` | `createElectronProtocolCapabilities` | `@flighthq/types:type#ElectronProtocolCapabilities` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:16:14` | `createElectronProtocolCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronProtocol.ts:16:14` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:25:11` | `createElectronProtocolCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronProtocol.ts:25:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:33:24` | `createElectronProtocolCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronProtocol.ts:33:24` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronProtocol.ts:34:21` | `createElectronProtocolCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronProtocol.ts:34:21` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronRegister.ts:157:10` | `registerElectronBackends` | `synthetic-entity:upstream/packages/host-electron/src/electronRegister.ts:157:10` | `contextual` | `object` | 26 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronScreen.ts:17:17` | `createElectronScreenCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronScreen.ts:17:17` | `variable` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronScreen.ts:36:18` | `createElectronScreenCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronScreen.ts:36:18` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronScreen.ts:71:10` | `emptyScreenInfo` | `@flighthq/types:interface#ScreenInfo` | `contextual` | `object` | 25 | ready | `field-order` | — |
| `upstream/packages/host-electron/src/electronShell.ts:25:34` | `makeElectronShellCapabilities` | `@flighthq/types:interface#ShellBeepBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-electron/src/electronShell.ts:30:42` | `makeElectronShellCapabilities` | `@flighthq/types:interface#ShellExternalBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-electron/src/electronShell.ts:40:42` | `makeElectronShellCapabilities` | `@flighthq/types:interface#ShellPathOpenBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-electron/src/electronShell.ts:50:46` | `makeElectronShellCapabilities` | `@flighthq/types:interface#ShellPathRevealBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-electron/src/electronShell.ts:60:36` | `makeElectronShellCapabilities` | `@flighthq/types:interface#ShellTrashBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-electron/src/electronShell.ts:77:10` | `createElectronShellShortcutLinkBackend` | `@flighthq/types:interface#ShellShortcutLinkBackend` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/host-electron/src/electronShortcut.ts:11:20` | `createElectronShortcutQueryBackend` | `@flighthq/types:interface#ShortcutQueryBackend` | `returned-variable` | `object` | 1 | ready | — | — |
| `upstream/packages/host-electron/src/electronShortcut.ts:32:20` | `createElectronShortcutTriggerBackend` | `@flighthq/types:interface#ShortcutTriggerBackend` | `returned-variable` | `object` | 3 | ready | — | — |
| `upstream/packages/host-electron/src/electronShortcut.ts:46:28` | `subscribe` | `synthetic-entity:upstream/packages/host-electron/src/electronShortcut.ts:46:28` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronStorage.ts:76:10` | `createElectronStorageBackend` | `synthetic-entity:upstream/packages/host-electron/src/electronStorage.ts:76:10` | `contextual` | `object` | 5 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:51:21` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:51:21` | `variable` | `object` | 4 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:114:17` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:114:17` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:134:19` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:134:19` | `variable` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:154:16` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:154:16` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:177:13` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:177:13` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:189:24` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:189:24` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:192:26` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:192:26` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:195:16` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:195:16` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:213:26` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:213:26` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:220:19` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:220:19` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:221:21` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:221:21` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:239:22` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:239:22` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:252:14` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:252:14` | `—` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:280:16` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:280:16` | `—` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronTray.ts:313:22` | `createElectronTrayCapabilities` | `synthetic-entity:upstream/packages/host-electron/src/electronTray.ts:313:22` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-electron/src/electronUpdater.ts:71:10` | `createElectronUpdaterBackend` | `@flighthq/types:interface#UpdaterCommandBackend` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/host-electron/src/electronUpdater.ts:133:24` | `createDownloadedUpdate` | `@flighthq/types:interface#DownloadedUpdate` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:20:10` | `createTauriAppCapabilities` | `@flighthq/types:type#TauriAppCapabilities` | `contextual` | `object` | 7 | ready | `field-order` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:21:13` | `createTauriAppCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriApp.ts:21:13` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:26:11` | `createTauriAppCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriApp.ts:26:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:27:11` | `createTauriAppCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriApp.ts:27:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:28:11` | `createTauriAppCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriApp.ts:28:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:29:15` | `createTauriAppCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriApp.ts:29:15` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:30:11` | `createTauriAppCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriApp.ts:30:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriApp.ts:31:14` | `createTauriAppCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriApp.ts:31:14` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriClipboard.ts:8:10` | `createTauriClipboardBackend` | `@flighthq/types:interface#ClipboardTextBackend` | `contextual` | `object` | 4 | ready | `field-order` | — |
| `upstream/packages/host-tauri/src/tauriDialog.ts:20:10` | `createTauriDirectoryOpenDialogBackend` | `synthetic-entity:upstream/packages/host-tauri/src/tauriDialog.ts:20:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriDialog.ts:43:10` | `createTauriFileOpenDialogBackend` | `synthetic-entity:upstream/packages/host-tauri/src/tauriDialog.ts:43:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriDialog.ts:70:10` | `createTauriFileSaveDialogBackend` | `synthetic-entity:upstream/packages/host-tauri/src/tauriDialog.ts:70:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriMenu.ts:30:18` | `createTauriMenuBackends` | `@flighthq/types:interface#MenuApplicationBackend` | `contextual` | `object` | 2 | not-entity | — | — |
| `upstream/packages/host-tauri/src/tauriMenu.ts:51:12` | `createTauriMenuBackends` | `@flighthq/types:interface#MenuPopupBackend` | `contextual` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-tauri/src/tauriMenu.ts:62:13` | `createTauriMenuBackends` | `@flighthq/types:interface#MenuSelectBackend` | `contextual` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-tauri/src/tauriNotification.ts:15:10` | `createTauriNotificationCapabilities` | `@flighthq/types:type#TauriNotificationCapabilities` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/host-tauri/src/tauriPlatform.ts:17:10` | `createTauriPlatformBackend` | `@flighthq/types:interface#PlatformBackend` | `contextual` | `object` | 1 | not-entity | — | — |
| `upstream/packages/host-tauri/src/tauriRegister.ts:96:10` | `registerTauriBackends` | `synthetic-entity:upstream/packages/host-tauri/src/tauriRegister.ts:96:10` | `contextual` | `object` | 26 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriShell.ts:17:42` | `makeTauriShellCapabilities` | `@flighthq/types:interface#ShellExternalBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-tauri/src/tauriShell.ts:27:42` | `makeTauriShellCapabilities` | `@flighthq/types:interface#ShellPathOpenBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-tauri/src/tauriShell.ts:37:46` | `makeTauriShellCapabilities` | `@flighthq/types:interface#ShellPathRevealBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-tauri/src/tauriShortcut.ts:11:20` | `createTauriShortcutQueryBackend` | `@flighthq/types:interface#ShortcutQueryBackend` | `returned-variable` | `object` | 1 | ready | — | — |
| `upstream/packages/host-tauri/src/tauriShortcut.ts:33:20` | `createTauriShortcutTriggerBackend` | `@flighthq/types:interface#ShortcutTriggerBackend` | `returned-variable` | `object` | 3 | ready | — | — |
| `upstream/packages/host-tauri/src/tauriShortcut.ts:48:28` | `subscribe` | `synthetic-entity:upstream/packages/host-tauri/src/tauriShortcut.ts:48:28` | `variable` | `omitted` | 0 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:39:21` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:39:21` | `variable` | `object` | 4 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:112:17` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:112:17` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:118:16` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:118:16` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:187:26` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:187:26` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:192:17` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:192:17` | `variable` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:208:29` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:208:29` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:211:19` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:211:19` | `variable` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-tauri/src/tauriTray.ts:233:20` | `createTauriTrayCapabilities` | `synthetic-entity:upstream/packages/host-tauri/src/tauriTray.ts:233:20` | `—` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webAccessibility.ts:47:10` | `createWebAccessibilityBackend` | `@flighthq/types:interface#AccessibilityBackend` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/host-web/src/webApp.ts:8:10` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:8:10` | `contextual` | `object` | 7 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:9:12` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:9:12` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:21:12` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:21:12` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:28:13` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:28:13` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:43:11` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:43:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:48:11` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:48:11` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:55:12` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:55:12` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webApp.ts:70:15` | `createWebAppCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webApp.ts:70:15` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webBitmapReadback.ts:7:10` | `createWebBitmapReadbackBackend` | `synthetic-entity:upstream/packages/host-web/src/webBitmapReadback.ts:7:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webBitmapReadback.ts:33:30` | `readBitmap` | `@flighthq/types:interface#Bitmap` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/host-web/src/webCanvasRenderSurface.ts:6:19` | `createWebCanvasRenderSurfaceCreator` | `@flighthq/types:interface#CanvasRenderSurfaceCreator` | `returned-variable` | `object` | 2 | ready | — | — |
| `upstream/packages/host-web/src/webClipboard.ts:113:10` | `createWebClipboardProviderBackend` | `synthetic-entity:upstream/packages/host-web/src/webClipboard.ts:113:10` | `contextual` | `object` | 19 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webConnectivity.ts:17:10` | `createWebConnectivityBackend` | `synthetic-entity:upstream/packages/host-web/src/webConnectivity.ts:17:10` | `contextual` | `object` | 4 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webCursor.ts:5:10` | `createWebCursorBackend` | `synthetic-entity:upstream/packages/host-web/src/webCursor.ts:5:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webDialog.ts:20:46` | `<module>` | `synthetic-entity:upstream/packages/host-web/src/webDialog.ts:20:46` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webDialog.ts:24:41` | `<module>` | `synthetic-entity:upstream/packages/host-web/src/webDialog.ts:24:41` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webDialog.ts:28:41` | `<module>` | `synthetic-entity:upstream/packages/host-web/src/webDialog.ts:28:41` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webFontLoading.ts:6:10` | `createWebFontLoadingBackend` | `synthetic-entity:upstream/packages/host-web/src/webFontLoading.ts:6:10` | `contextual` | `object` | 4 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webGlyphRasterizer.ts:12:10` | `createWebGlyphRasterizerBackend` | `synthetic-entity:upstream/packages/host-web/src/webGlyphRasterizer.ts:12:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webInputTarget.ts:15:40` | `<module>` | `@flighthq/types:interface#InputDropFileBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webInputTarget.ts:33:37` | `<module>` | `@flighthq/types:interface#InputFocusBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webInputTarget.ts:46:43` | `<module>` | `@flighthq/types:interface#InputPointerLockBackend` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/host-web/src/webInputTarget.ts:87:38` | `<module>` | `@flighthq/types:interface#InputTargetBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webInputTarget.ts:100:40` | `<module>` | `@flighthq/types:interface#RenderContextBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webInputTarget.ts:119:40` | `<module>` | `@flighthq/types:interface#RenderSurfaceBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webInputTarget.ts:131:37` | `createWebInputTargetHandle` | `@flighthq/types:interface#InputTargetHandle` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webKeyboard.ts:16:10` | `createWebSoftKeyboardChangeBackend` | `synthetic-entity:upstream/packages/host-web/src/webKeyboard.ts:16:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webKeyboard.ts:39:10` | `createWebSoftKeyboardInfoBackend` | `synthetic-entity:upstream/packages/host-web/src/webKeyboard.ts:39:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webKeyboard.ts:53:10` | `createWebSoftKeyboardVisibilityBackend` | `synthetic-entity:upstream/packages/host-web/src/webKeyboard.ts:53:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webMediasession.ts:123:10` | `createWebMediaSessionActionBackend` | `@flighthq/types:interface#MediaSessionActionBackend` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/host-web/src/webMediasession.ts:322:10` | `createWebMediaSessionBackend` | `@flighthq/types:interface#MediaSessionBackend` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/host-web/src/webMidi.ts:111:18` | `createWebMidiProfile` | `synthetic-entity:upstream/packages/host-web/src/webMidi.ts:111:18` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webMidi.ts:121:34` | `createWebMidiProfile` | `synthetic-entity:upstream/packages/host-web/src/webMidi.ts:121:34` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webMidi.ts:122:22` | `createWebMidiProfile` | `synthetic-entity:upstream/packages/host-web/src/webMidi.ts:122:22` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webMidi.ts:125:10` | `createWebMidiProfile` | `synthetic-entity:upstream/packages/host-web/src/webMidi.ts:125:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webMidi.ts:140:28` | `attachWebMidiEvent` | `synthetic-entity:upstream/packages/host-web/src/webMidi.ts:140:28` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webNotification.ts:48:10` | `createWebPageNotificationCapabilities` | `@flighthq/types:type#WebPageNotificationCapabilities` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/host-web/src/webPower.ts:181:37` | `<module>` | `synthetic-entity:upstream/packages/host-web/src/webPower.ts:181:37` | `variable` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/host-web/src/webProtocol.ts:8:10` | `createWebProtocolCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webProtocol.ts:8:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webProtocol.ts:9:13` | `createWebProtocolCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webProtocol.ts:9:13` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webProtocol.ts:20:19` | `createWebProtocolCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webProtocol.ts:20:19` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webScreen.ts:178:17` | `createWebScreenCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webScreen.ts:178:17` | `variable` | `object` | 4 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webScreen.ts:221:18` | `createWebScreenCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webScreen.ts:221:18` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webScreen.ts:242:26` | `createWebScreenCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webScreen.ts:242:26` | `variable` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webScreen.ts:272:28` | `createWebScreenCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webScreen.ts:272:28` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webServiceWorkerNotification.ts:60:66` | `createWebServiceWorkerNotificationCapabilities` | `@flighthq/types:type#WebServiceWorkerNotificationCapabilities` | `contextual` | `object` | 8 | ready | — | — |
| `upstream/packages/host-web/src/webShare.ts:11:60` | `<module>` | `@flighthq/types:interface#ShareContentBackend` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/host-web/src/webShare.ts:27:56` | `<module>` | `@flighthq/types:interface#ShareFilesBackend` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/host-web/src/webShell.ts:6:62` | `<module>` | `@flighthq/types:interface#ShellExternalBackend` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webStorage.ts:20:34` | `<module>` | `synthetic-entity:upstream/packages/host-web/src/webStorage.ts:20:34` | `variable` | `object` | 7 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:14:30` | `createWebWindowStoragePersistenceCapabilities` | `synthetic-entity:upstream/packages/host-web/src/webStoragePersistence.ts:14:30` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:21:24` | `createWebWindowStoragePersistenceCapabilities` | `@flighthq/types:interface#WebWindowStoragePersistenceCapabilities` | `returned-variable` | `object` | 2 | ready | — | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:31:24` | `createWebWorkerStoragePersistenceCapabilities` | `@flighthq/types:interface#WebWorkerStoragePersistenceCapabilities` | `returned-variable` | `object` | 1 | ready | — | — |
| `upstream/packages/host-web/src/webStoragePersistence.ts:36:19` | `createPersistenceQueryBackend` | `synthetic-entity:upstream/packages/host-web/src/webStoragePersistence.ts:36:19` | `variable` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/image/src/imageResource.ts:8:10` | `cloneImageResource` | `@flighthq/types:interface#Image` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/image/src/imageResource.ts:22:10` | `createCompressedImage` | `@flighthq/types:interface#CompressedImage` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/image/src/imageResource.ts:34:27` | `createImageResource` | `@flighthq/types:interface#Image` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/image/src/imageResourceFrom.ts:18:10` | `createImageResourceFromCanvas` | `@flighthq/types:interface#Image` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/image/src/imageResourceFrom.ts:30:10` | `createImageResourceFromImageBitmap` | `@flighthq/types:interface#Image` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/image/src/imageResourceFrom.ts:42:10` | `createImageResourceFromImageElement` | `@flighthq/types:interface#Image` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/image/src/imageResourceReference.ts:73:10` | `decodeEmbeddedImageResourceReference` | `synthetic-entity:upstream/packages/image/src/imageResourceReference.ts:73:10` | `contextual` | `object` | 8 | ready | `synthetic-class` | — |
| `upstream/packages/keyboard/src/keyboard.ts:51:10` | `createSoftKeyboard` | `synthetic-entity:upstream/packages/keyboard/src/keyboard.ts:51:10` | `contextual` | `object` | 3 | ready | `synthetic-class` | — |
| `upstream/packages/lighting/src/ambientLight.ts:13:10` | `createAmbientLight` | `@flighthq/types:interface#AmbientLight` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/lighting/src/areaLight.ts:8:10` | `cloneAreaLight` | `@flighthq/types:interface#AreaLight` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/lighting/src/areaLight.ts:33:10` | `createAreaLight` | `@flighthq/types:interface#AreaLight` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/lighting/src/directionalLight.ts:8:10` | `cloneDirectionalLight` | `@flighthq/types:interface#DirectionalLight` | `contextual` | `object` | 8 | ready | — | — |
| `upstream/packages/lighting/src/directionalLight.ts:25:10` | `createDirectionalLight` | `@flighthq/types:interface#DirectionalLight` | `contextual` | `object` | 8 | ready | — | — |
| `upstream/packages/lighting/src/environment.ts:15:10` | `createEnvironment` | `@flighthq/types:interface#Environment` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/lighting/src/hemisphereLight.ts:18:10` | `createHemisphereLight` | `@flighthq/types:interface#HemisphereLight` | `contextual` | `object` | 4 | ready | — | — |
| `upstream/packages/lighting/src/pointLight.ts:8:10` | `clonePointLight` | `@flighthq/types:interface#PointLight` | `contextual` | `object` | 9 | ready | — | — |
| `upstream/packages/lighting/src/pointLight.ts:26:10` | `createPointLight` | `@flighthq/types:interface#PointLight` | `contextual` | `object` | 9 | ready | — | — |
| `upstream/packages/lighting/src/sceneLights.ts:14:10` | `createScene3DLights` | `@flighthq/types:interface#Scene3DLights` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/lighting/src/spotLight.ts:8:10` | `cloneSpotLight` | `@flighthq/types:interface#SpotLight` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/lighting/src/spotLight.ts:31:28` | `createSpotLight` | `@flighthq/types:interface#SpotLight` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/materials/src/anisotropyPbrExtension.ts:9:10` | `createAnisotropyPbrExtension` | `@flighthq/types:interface#AnisotropyPbrExtension` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/materials/src/clearcoatPbrExtension.ts:9:10` | `createClearcoatPbrExtension` | `@flighthq/types:interface#ClearcoatPbrExtension` | `contextual` | `object` | 10 | ready | — | — |
| `upstream/packages/materials/src/colorScaleBias.ts:50:10` | `createColorScaleBias` | `@flighthq/types:interface#ColorScaleBias` | `contextual` | `object` | 8 | ready | `field-order` | — |
| `upstream/packages/materials/src/iridescencePbrExtension.ts:11:10` | `createIridescencePbrExtension` | `@flighthq/types:interface#IridescencePbrExtension` | `contextual` | `object` | 9 | ready | — | — |
| `upstream/packages/materials/src/material.ts:7:17` | `cloneMaterial` | `@flighthq/types:interface#Material` | `contextual` | `object` | 1 | ready | `missing-field-initialization` | — |
| `upstream/packages/materials/src/material.ts:20:20` | `createMaterial` | `@flighthq/types:interface#Material` | `contextual` | `object` | 1 | ready | `missing-field-initialization` | — |
| `upstream/packages/materials/src/sheenPbrExtension.ts:9:10` | `createSheenPbrExtension` | `@flighthq/types:interface#SheenPbrExtension` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/materials/src/specularPbrExtension.ts:9:10` | `createSpecularPbrExtension` | `@flighthq/types:interface#SpecularPbrExtension` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/materials/src/standardMaterial.ts:6:10` | `createStandardMaterial` | `@flighthq/types:interface#StandardMaterial` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/materials/src/transmissionVolumePbrExtension.ts:11:10` | `createTransmissionVolumePbrExtension` | `@flighthq/types:interface#TransmissionVolumePbrExtension` | `contextual` | `object` | 10 | ready | — | — |
| `upstream/packages/materials/src/wrappedDiffusePbrExtension.ts:11:10` | `createWrappedDiffusePbrExtension` | `@flighthq/types:interface#WrappedDiffusePbrExtension` | `contextual` | `object` | 8 | ready | — | — |
| `upstream/packages/mediasession/src/mediasession.ts:39:10` | `createMediaSessionActionSignal` | `@flighthq/types:interface#MediaSessionActionSignal` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/menu/src/menu.ts:48:10` | `createMenuHighlight` | `@flighthq/types:interface#MenuHighlight` | `contextual` | `object` | 1 | not-entity | — | — |
| `upstream/packages/menu/src/menu.ts:68:10` | `createMenuSelect` | `@flighthq/types:interface#MenuSelect` | `contextual` | `object` | 1 | not-entity | — | — |
| `upstream/packages/mesh/src/meshGeometry.ts:192:20` | `createMeshGeometryRuntime` | `@flighthq/types:interface#MeshGeometry` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/midi/src/midiAccess.ts:21:18` | `createMidiAccessResource` | `@flighthq/types:interface#MidiAccess` | `returned-variable` | `object` | 0 | ready | — | — |
| `upstream/packages/midi/src/midiPort.ts:52:16` | `createMidiInputPortResource` | `@flighthq/types:interface#MidiInputPort` | `returned-variable` | `object` | 1 | ready | `spread-projection` | — |
| `upstream/packages/midi/src/midiPort.ts:61:16` | `createMidiOutputPortResource` | `@flighthq/types:interface#MidiOutputPort` | `returned-variable` | `object` | 1 | ready | `spread-projection` | — |
| `upstream/packages/midi/src/midiSubscription.ts:131:24` | `createMidiSubscription` | `synthetic-entity:upstream/packages/midi/src/midiSubscription.ts:131:24` | `contextual` | `other` | 0 | ready | `synthetic-class`, `forwarded-construction` | — |
| `upstream/packages/node/src/viewport.ts:8:10` | `createViewport` | `@flighthq/types:interface#Viewport` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/notification/src/notification.ts:188:10` | `createNotificationResource` | `@flighthq/types:interface#Notification` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/notification/src/notification.ts:197:10` | `createScheduledNotificationResource` | `@flighthq/types:interface#ScheduledNotification` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/notification/src/notification.ts:314:24` | `createNotificationSubscription` | `synthetic-entity:upstream/packages/notification/src/notification.ts:314:24` | `contextual` | `other` | 0 | ready | `synthetic-class`, `forwarded-construction` | — |
| `upstream/packages/picking/src/pickScene3D.ts:36:10` | `createScene3DHit` | `@flighthq/types:interface#Scene3DHit` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/power/src/power.ts:108:10` | `createPower` | `@flighthq/types:interface#Power` | `contextual` | `object` | 9 | ready | — | — |
| `upstream/packages/protocol/src/protocol.ts:24:10` | `createProtocolHandler` | `@flighthq/types:interface#ProtocolHandler` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/render-gl/src/glExternalTexture.ts:22:18` | `createExternalGlTexture` | `@flighthq/types:interface#ExternalTexture` | `contextual` | `object` | 4 | ready | `missing-field-initialization` | — |
| `upstream/packages/render-gl/src/glPipeline.ts:29:20` | `createGlPipeline` | `@flighthq/types:interface#GlPipeline` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/render-gl/src/glRenderState.ts:51:17` | `createGlContextState` | `@flighthq/types:interface#GlContextState` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/render-gl/src/glRenderTarget.ts:85:18` | `createGlRenderTarget` | `synthetic-entity:upstream/packages/render-gl/src/glRenderTarget.ts:85:18` | `variable` | `object` | 18 | ready | `synthetic-class` | — |
| `upstream/packages/render-wgpu/src/wgpuExternalTexture.ts:21:18` | `createExternalWgpuTexture` | `@flighthq/types:interface#ExternalTexture` | `contextual` | `object` | 4 | ready | `missing-field-initialization` | — |
| `upstream/packages/render-wgpu/src/wgpuPipeline.ts:25:20` | `createWgpuPipeline` | `@flighthq/types:interface#WgpuPipeline` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/render-wgpu/src/wgpuRenderState.ts:55:17` | `createWgpuDeviceState` | `@flighthq/types:interface#WgpuDeviceState` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/render/src/renderCache.ts:18:10` | `createRenderCache` | `@flighthq/types:interface#RenderCache` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/render/src/renderProxy.ts:36:10` | `createRenderProxy` | `@flighthq/types:interface#RenderProxy` | `contextual` | `object` | 22 | ready | `field-order` | — |
| `upstream/packages/render/src/renderState.ts:12:17` | `createRenderState` | `@flighthq/types:interface#RenderState` | `contextual` | `object` | 12 | ready | — | — |
| `upstream/packages/scene2d-canvas/src/canvasPipeline.ts:7:20` | `createCanvasPipeline` | `@flighthq/types:interface#CanvasPipeline` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/scene2d-canvas/src/canvasRenderSurface.ts:49:19` | `finishCanvasRenderSurface` | `@flighthq/types:interface#CanvasRenderSurface` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/scene2d-canvas/src/canvasTestSupport.ts:23:19` | `<anonymous>` | `synthetic-entity:upstream/packages/scene2d-canvas/src/canvasTestSupport.ts:23:19` | `variable` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-canvas/src/canvasTextLabel.ts:25:10` | `createCanvasTextLabelData` | `synthetic-entity:upstream/packages/scene2d-canvas/src/canvasTextLabel.ts:25:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-canvas/src/canvasTextureResolver.ts:48:21` | `createCanvasTextureResolvers` | `@flighthq/types:interface#CanvasTextureResolvers` | `contextual` | `object` | 3 | ready | `missing-field-initialization` | — |
| `upstream/packages/scene2d-dom/src/domRichText.ts:38:10` | `createDomRichTextData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domRichText.ts:38:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domScale9Shape.ts:31:10` | `createDomScale9ShapeData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domScale9Shape.ts:31:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domShape.ts:25:10` | `createDomShapeData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domShape.ts:25:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-dom/src/domTextLabel.ts:26:10` | `createDomTextData` | `synthetic-entity:upstream/packages/scene2d-dom/src/domTextLabel.ts:26:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-gl/src/glRichText.ts:43:10` | `createGlRichTextData` | `synthetic-entity:upstream/packages/scene2d-gl/src/glRichText.ts:43:10` | `contextual` | `object` | 1 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-gl/src/glScale9Shape.ts:50:10` | `createGlScale9ShapeData` | `synthetic-entity:upstream/packages/scene2d-gl/src/glScale9Shape.ts:50:10` | `contextual` | `object` | 7 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-gl/src/glShapeData.ts:28:10` | `createGlShapeData` | `synthetic-entity:upstream/packages/scene2d-gl/src/glShapeData.ts:28:10` | `contextual` | `object` | 7 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-gl/src/glTextLabel.ts:50:10` | `createGlTextLabelData` | `synthetic-entity:upstream/packages/scene2d-gl/src/glTextLabel.ts:50:10` | `contextual` | `object` | 5 | ready | `synthetic-class` | — |
| `upstream/packages/scene2d-resources/src/scene2DDocumentImporterRegistry.ts:26:10` | `createScene2DDocumentImporterRegistry` | `@flighthq/types:interface#Scene2DDocumentImporterRegistry` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/scene2d-wgpu/src/wgpuRendererData.ts:15:10` | `createWgpuRendererData` | `synthetic-entity:upstream/packages/scene2d-wgpu/src/wgpuRendererData.ts:15:10` | `contextual` | `other` | 0 | ready | `synthetic-class`, `forwarded-construction` | — |
| `upstream/packages/scene2d/src/scene2d.ts:18:19` | `createScene2D` | `@flighthq/types:interface#Scene2D` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/scene2d/src/sprite.ts:48:10` | `createSpriteRendererData` | `synthetic-entity:upstream/packages/scene2d/src/sprite.ts:48:10` | `contextual` | `object` | 2 | ready | `synthetic-class` | — |
| `upstream/packages/scene3d-resources/src/sceneMaterialTextureRegistry.ts:17:10` | `createScene3DMaterialTextureRegistry` | `@flighthq/types:interface#Scene3DMaterialTextureRegistry` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/scene3d-resources/src/sceneResourceResolver.ts:42:10` | `createScene3DResourceResolver` | `synthetic-entity:upstream/packages/scene3d-resources/src/sceneResourceResolver.ts:42:10` | `contextual` | `object` | 2 | ready | `synthetic-class`, `computed-symbol-key` | — |
| `upstream/packages/scene3d-resources/src/sceneResourceSignals.ts:8:10` | `createScene3DResourceSignals` | `@flighthq/types:interface#Scene3DResourceSignals` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/scene3d/src/scene.ts:14:10` | `createScene3D` | `@flighthq/types:interface#Scene3D` | `contextual` | `object` | 4 | ready | — | — |
| `upstream/packages/scene3d/src/sceneDocument.ts:109:22` | `<anonymous>` | `synthetic-entity:upstream/packages/scene3d/src/sceneDocument.ts:109:22` | `variable` | `object` | 5 | ready | `synthetic-class` | — |
| `upstream/packages/screen/src/screen.ts:37:10` | `createScreenInfo` | `@flighthq/types:interface#ScreenInfo` | `contextual` | `object` | 25 | ready | `field-order` | — |
| `upstream/packages/screen/src/screen.ts:67:10` | `createScreenMode` | `@flighthq/types:interface#ScreenMode` | `contextual` | `object` | 5 | ready | `field-order` | — |
| `upstream/packages/screen/src/screen.ts:71:10` | `createScreenPermissionChange` | `@flighthq/types:interface#ScreenPermissionChange` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/screen/src/screen.ts:75:10` | `createScreenSignals` | `@flighthq/types:interface#ScreenSignals` | `contextual` | `object` | 3 | ready | — | — |
| `upstream/packages/shading/src/createShadedMaterial.ts:20:20` | `createShadedMaterial` | `@flighthq/types:interface#ShadedMaterial` | `contextual` | `object` | 1 | ready | `missing-field-initialization` | — |
| `upstream/packages/share/src/share.ts:38:10` | `enableShareSignals` | `@flighthq/types:interface#ShareSignals` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/shortcut/src/shortcutExplicitDependency.ts:85:15` | `createGlobalShortcut` | `@flighthq/types:interface#GlobalShortcut` | `contextual` | `object` | 2 | ready | — | — |
| `upstream/packages/skeleton2d/src/skeleton2d.ts:13:10` | `cloneSkeleton2D` | `@flighthq/types:interface#Skeleton2D` | `contextual` | `object` | 5 | ready | `missing-field-initialization` | — |
| `upstream/packages/skeleton2d/src/skeleton2d.ts:152:10` | `createSkeleton2D` | `@flighthq/types:interface#Skeleton2D` | `contextual` | `object` | 5 | ready | `missing-field-initialization` | — |
| `upstream/packages/skeleton3d/src/skeleton3d.ts:15:17` | `cloneSkeleton3D` | `@flighthq/types:interface#Skeleton3D` | `returned-variable` | `object` | 5 | ready | — | — |
| `upstream/packages/skeleton3d/src/skeleton3d.ts:49:10` | `cloneSkeleton3DJointHierarchy` | `@flighthq/types:interface#Skeleton3D` | `contextual` | `object` | 5 | ready | — | — |
| `upstream/packages/skeleton3d/src/skeleton3d.ts:87:20` | `createSkeleton3D` | `@flighthq/types:interface#Skeleton3D` | `returned-variable` | `object` | 5 | ready | — | — |
| `upstream/packages/spatial/src/bvh3D.ts:42:10` | `createBvhSpatialBackend3D` | `synthetic-entity:upstream/packages/spatial/src/bvh3D.ts:42:10` | `contextual` | `object` | 9 | ready | `synthetic-class` | — |
| `upstream/packages/spatial/src/uniformGrid.ts:61:10` | `createUniformGridSpatialBackend2D` | `synthetic-entity:upstream/packages/spatial/src/uniformGrid.ts:61:10` | `contextual` | `object` | 9 | ready | `synthetic-class` | — |
| `upstream/packages/spatial/src/uniformGrid3D.ts:48:10` | `createUniformGridSpatialBackend3D` | `synthetic-entity:upstream/packages/spatial/src/uniformGrid3D.ts:48:10` | `contextual` | `object` | 9 | ready | `synthetic-class` | — |
| `upstream/packages/spritesheet/src/spritesheet.ts:17:10` | `cloneSpritesheet` | `@flighthq/types:interface#Spritesheet` | `contextual` | `object` | 3 | ready | `field-order` | — |
| `upstream/packages/spritesheet/src/spritesheet.ts:25:10` | `createSpritesheet` | `@flighthq/types:interface#Spritesheet` | `contextual` | `object` | 3 | ready | `field-order` | — |
| `upstream/packages/spritesheet/src/spritesheetAnimation.ts:5:10` | `createSpritesheetAnimation` | `@flighthq/types:interface#SpritesheetAnimation` | `contextual` | `object` | 7 | ready | — | — |
| `upstream/packages/storage/src/storage.ts:73:10` | `createStorageSignals` | `@flighthq/types:interface#StorageSignals` | `contextual` | `object` | 1 | ready | — | — |
| `upstream/packages/texture/src/renderTexture.ts:18:13` | `createRenderTexture` | `@flighthq/types:interface#RenderTarget` | `contextual` | `object` | 12 | ready | `missing-field-initialization` | — |
| `upstream/packages/texture/src/sampler.ts:7:10` | `cloneSampler` | `@flighthq/types:interface#Sampler` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/texture/src/sampler.ts:51:10` | `createSampler` | `@flighthq/types:interface#Sampler` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/texture/src/texture.ts:46:14` | `cloneTexture` | `@flighthq/types:interface#Texture2D` | `contextual` | `object` | 2 | ready | `spread-projection` | — |
| `upstream/packages/texture/src/texture.ts:48:14` | `cloneTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:48:14` | `return` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/texture/src/texture.ts:54:14` | `cloneTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:54:14` | `return` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/texture/src/texture.ts:59:14` | `cloneTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:59:14` | `return` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/texture/src/texture.ts:119:17` | `createTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:119:17` | `assignment` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/texture/src/texture.ts:126:17` | `createTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:126:17` | `assignment` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/texture/src/texture.ts:133:17` | `createTexture` | `synthetic-entity:upstream/packages/texture/src/texture.ts:133:17` | `assignment` | `object` | 2 | ready | `synthetic-class`, `spread-projection` | — |
| `upstream/packages/texture/src/texture.ts:153:19` | `createTexture2D` | `@flighthq/types:interface#Texture2D` | `contextual` | `object` | 2 | ready | `spread-projection` | — |
| `upstream/packages/texture/src/videoTexture.ts:97:17` | `createVideoImageResource` | `@flighthq/types:interface#Image` | `contextual` | `object` | 7 | ready | `field-order` | — |
| `upstream/packages/textureatlas/src/textureAtlas.ts:6:10` | `createTextureAtlas` | `@flighthq/types:interface#TextureAtlas` | `contextual` | `object` | 6 | ready | — | — |
| `upstream/packages/textureatlas/src/textureAtlasRegion.ts:121:10` | `createTextureAtlasRegion` | `@flighthq/types:interface#TextureAtlasRegion` | `contextual` | `object` | 15 | ready | `field-order` | — |
| `upstream/packages/tray/src/tray.ts:75:16` | `createTrayIcon` | `synthetic-entity:upstream/packages/tray/src/tray.ts:75:16` | `contextual` | `omitted` | 0 | ready | `synthetic-class` | — |
