package flight.esm.types.scene3d_resources_contract;

#if (js && flight_esm)
typedef GltfScene3DDocumentLoadOptions = { ?coreFeatureHandlers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfCoreFeatureHandler>>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, ?extensionHandlers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfExtensionHandler>>, ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.scene3d_resources_contract.Types.Scene3DDocumentLoadProgress>>, ?signal:Null<js.html.AbortSignal> };

typedef LoadScene3DResourcesOptions = { ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.scene3d_resources_contract.Types.Scene3DResourceLoadProgress>>, ?priority:Null<((texture:flight.esm.types.texture_contract.Types.Texture, ref:flight.esm.types.image.Types.ImageResourceReference) -> Float)>, ?select:Null<((texture:flight.esm.types.texture_contract.Types.Texture, ref:flight.esm.types.image.Types.ImageResourceReference) -> Bool)> };

typedef ResolveScene3DResourcesOptions = { ?select:Null<((texture:flight.esm.types.texture_contract.Types.Texture, ref:flight.esm.types.image.Types.ImageResourceReference) -> Bool)> };

typedef Scene3DDocumentLoadOptions = { ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.scene3d_resources_contract.Types.Scene3DDocumentLoadProgress>>, ?signal:Null<js.html.AbortSignal> };

typedef Scene3DDocumentLoadProgress = { loaded:Float, phase:String, total:Float, url:String };

typedef Scene3DMaterialTextureLister = ((material:flight.esm.types.materials_contract.Types.Material, out:Array<flight.esm.types.texture_contract.Types.Texture>) -> Void);

typedef Scene3DMaterialTextureRegistry = { extensionListers:js.lib.Map<String, flight.esm.types.scene3d_resources_contract.Types.Scene3DPbrExtensionTextureLister>, listers:js.lib.Map<String, flight.esm.types.scene3d_resources_contract.Types.Scene3DMaterialTextureLister> };

typedef Scene3DPbrExtensionTextureLister = ((extension:flight.esm.types.materials_contract.Types.PbrExtension, out:Array<flight.esm.types.texture_contract.Types.Texture>) -> Void);

typedef Scene3DResourceEvent = { ref:flight.esm.types.image.Types.ImageResourceReference, texture:flight.esm.types.texture_contract.Types.Texture };

typedef Scene3DResourceInFlight = { controller:js.html.AbortController, promise:js.lib.Promise<Void>, subscribers:js.lib.Set<flight.esm.types.texture_contract.Types.Texture> };

typedef Scene3DResourceLoadProgress = { loaded:Float, total:Float };

typedef Scene3DResourceResolution = { source:flight.esm.types.texture_contract.Types.TextureSource, ref:flight.esm.types.image.Types.ImageResourceReference, textures:Array<flight.esm.types.texture_contract.Types.Texture> };

typedef Scene3DResourceResolver = { fetch:flight.esm.types.image.Types.ImageResourceFetch, ?imageDecode:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities>, registry:flight.esm.types.scene3d_resources_contract.Types.Scene3DMaterialTextureRegistry };

typedef Scene3DResourceResolverOptions = { ?fetch:Null<flight.esm.types.image.Types.ImageResourceFetch>, ?imageDecode:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities>, ?maxConcurrent:Null<Float>, ?registry:Null<flight.esm.types.scene3d_resources_contract.Types.Scene3DMaterialTextureRegistry> };

typedef Scene3DResourceResolverRuntime = { inFlight:js.lib.Map<flight.esm.types.image.Types.ImageResourceReference, flight.esm.types.scene3d_resources_contract.Types.Scene3DResourceInFlight>, loader:flight.esm.types.loader.Types.ResourceLoader, resolved:js.lib.Map<flight.esm.types.image.Types.ImageResourceReference, flight.esm.types.texture_contract.Types.TextureSource>, signals:Null<flight.esm.types.scene3d_resources_contract.Types.Scene3DResourceSignals> };

typedef Scene3DResourceResolverWithRuntime = { fetch:flight.esm.types.image.Types.ImageResourceFetch, ?imageDecode:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities>, registry:flight.esm.types.scene3d_resources_contract.Types.Scene3DMaterialTextureRegistry };

typedef Scene3DResourceRevealOptions = { ?ease:Null<flight.esm.types.easing.Types.EasingFunction>, ?fadeSeconds:Null<Float>, ?from:Null<Float> };

typedef Scene3DResourceSignals = { onResourceFailed:flight.esm.types.signals.Types.Signal<flight.esm.types.scene3d_resources_contract.Types.Scene3DResourceEvent>, onResourceResolved:flight.esm.types.signals.Types.Signal<flight.esm.types.scene3d_resources_contract.Types.Scene3DResourceEvent> };

typedef Scene3DResourceWorkingSet = { ref:flight.esm.types.image.Types.ImageResourceReference, textures:Array<flight.esm.types.texture_contract.Types.Texture> };

typedef Scene3DResources = { resolved:Array<flight.esm.types.scene3d_resources_contract.Types.Scene3DResourceResolution>, scene:flight.esm.types.scene3d_contract.Types.Scene3D, unresolved:Array<flight.esm.types.scene3d_resources_contract.Types.Scene3DResourceWorkingSet> };

typedef UpdateScene3DResourceStreamingOptions = { ?priority:Null<((texture:flight.esm.types.texture_contract.Types.Texture, ref:flight.esm.types.image.Types.ImageResourceReference) -> Float)>, ?select:Null<((texture:flight.esm.types.texture_contract.Types.Texture, ref:flight.esm.types.image.Types.ImageResourceReference) -> Bool)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
