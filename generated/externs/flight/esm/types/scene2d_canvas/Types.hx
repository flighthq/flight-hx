package flight.esm.types.scene2d_canvas;

#if (js && flight_esm)
typedef CanvasEffectContext = { state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool };

typedef CanvasEffectRunner = ((ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect) -> Void);

typedef CanvasImageSourceKind = String;

typedef CanvasMaterialState = { ?composite:Null<String>, ?filter:Null<String> };

typedef CanvasQuadMaterialRenderer = { getState:((material:flight.esm.types.materials_contract.Types.Material) -> flight.esm.types.scene2d_canvas.Types.CanvasMaterialState) };

typedef CanvasRenderOptions = { ?imageSmoothingEnabled:Null<Bool>, ?imageSmoothingQuality:Null<String>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef CanvasRenderPass = { context:js.html.CanvasRenderingContext2D, saved:flight.esm.types.scene2d_canvas.Types.CanvasSavedPassState, state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, target:flight.esm.types.scene2d_canvas.Types.CanvasRenderTarget, viewport:flight.esm.types.scene2d_canvas.Types.CanvasRenderPassViewport };

typedef CanvasRenderPassViewport = { height:Float, width:Float };

typedef CanvasRenderRegistries = { ?blendModeApplication:Null<((state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, blendMode:Null<String>) -> Void)>, ?materialRenderers:Null<js.lib.Map<String, flight.esm.types.scene2d_canvas.Types.CanvasQuadMaterialRenderer>>, effects:js.lib.Map<String, flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, nodeRenderers:js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator> };

typedef CanvasRenderState = { applyBlendMode:Null<((state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, blendMode:Null<String>) -> Void)>, canvasCssFilterResolver:Null<((state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Null<String>)>, canvas:js.html.CanvasElement, context:js.html.CanvasRenderingContext2D, registries:flight.esm.types.scene2d_canvas.Types.CanvasRenderRegistries, allowSmoothing:Bool, currentClipDepth:Float, displayObjectClipHooks:Null<flight.esm.types.render_contract.Types.Scene2DClipHooks>, pixelRatio:Float, canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, renderAlpha:Float, renderBlendMode:Null<String>, sceneGraphSyncPolicy:flight.esm.types.render_contract.Types.Scene3DGraphSyncPolicy, roundPixels:Bool };

typedef CanvasRenderStateOptions = { ?blendModeApplication:Null<((state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, blendMode:Null<String>) -> Void)>, ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, ?canvasTextureResolvers:Null<flight.esm.types.scene2d_canvas.Types.CanvasTextureResolvers>, ?effects:Null<js.lib.Map<String, flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner>>, ?materialRenderers:Null<js.lib.Map<String, flight.esm.types.scene2d_canvas.Types.CanvasQuadMaterialRenderer>>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?imageSmoothingEnabled:Null<Bool>, ?imageSmoothingQuality:Null<String>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef CanvasRenderStateRuntime = { registries:flight.esm.types.scene2d_canvas.Types.CanvasRenderRegistries, passStack:Array<flight.esm.types.scene2d_canvas.Types.CanvasRenderPass>, currentRenderTarget:Null<flight.esm.types.scene2d_canvas.Types.CanvasRenderTarget>, currentAlpha:Float, currentBlendMode:Null<String>, canvasTextureResolvers:flight.esm.types.scene2d_canvas.Types.CanvasTextureResolvers, ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, imageSmoothingEnabled:Bool, imageSmoothingQuality:String, teardowns:Array<((state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState) -> Void)>, ?canvasBlendEffectBackdrops:Null<js.lib.Map<String, flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget>>, currentFrameId:Float, renderAdaptHook:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void)>, renderProxyAdapterMap:Dynamic, renderProxyMap:Dynamic, renderProxySources:js.lib.Set<flight.esm.types.node.Types.NodeAny>, registryMiss:Null<((registry:flight.esm.types.render_contract.Types.RenderRegistryTable, kind:String) -> Void)>, rendererMapId:Float, tempStack:Array<flight.esm.types.node.Types.NodeAny>, binding:Dynamic, ?uid:Null<String> };

typedef CanvasRenderTarget = { canvas:js.html.CanvasElement, colorAttachments:Float, context:js.html.CanvasRenderingContext2D, height:Float, surface:flight.esm.types.surface.Types.CanvasSurface, surfaceOwnership:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetSurfaceOwnership, width:Float };

typedef CanvasRenderTargetPool = { canvasHost:flight.esm.types.surface.Types.HostCanvasCapability, free:Array<flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget>, inUse:Array<flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget> };

typedef CanvasRenderTargetSurfaceOwnership = String;

typedef CanvasRenderTextureEntry = { status:flight.esm.types.scene2d_canvas.Types.CanvasRenderTextureStatus, target:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget };

typedef CanvasRenderTextureExplanation = { height:Float, status:flight.esm.types.scene2d_canvas.Types.CanvasRenderTextureStatus, width:Float };

typedef CanvasRenderTexturePool = { destroyed:Bool, effectTargets:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, free:Array<flight.esm.types.render_contract.Types.RenderTexture>, leased:js.lib.Set<flight.esm.types.render_contract.Types.RenderTexture>, owner:Null<flight.esm.types.scene2d_canvas.Types.CanvasRenderState> };

typedef CanvasRenderTextureStatus = String;

typedef CanvasSavedBlendMode = Null<String>;

typedef CanvasSavedPassState = { canvas:Null<js.html.CanvasElement>, context:Null<js.html.CanvasRenderingContext2D>, currentAlpha:Float, currentBlendMode:flight.esm.types.scene2d_canvas.Types.CanvasSavedBlendMode, target:Null<flight.esm.types.scene2d_canvas.Types.CanvasRenderTarget> };

typedef CanvasScreenRenderTarget = { surfaceOwnership:String, canvas:js.html.CanvasElement, colorAttachments:Float, context:js.html.CanvasRenderingContext2D, height:Float, surface:flight.esm.types.surface.Types.CanvasSurface, width:Float };

typedef CanvasTextInputOverlay = ((state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void);

typedef CanvasTextureRenderTarget = { surfaceOwnership:String, canvas:js.html.CanvasElement, colorAttachments:Float, context:js.html.CanvasRenderingContext2D, height:Float, surface:flight.esm.types.surface.Types.CanvasSurface, width:Float };

typedef CanvasTextureResolver = ((resolvers:flight.esm.types.scene2d_canvas.Types.CanvasTextureResolvers, texture:flight.esm.types.texture_contract.Types.Texture) -> Dynamic);

typedef CanvasTextureResolvers = { canvasHost:flight.esm.types.surface.Types.HostCanvasCapability, ?registry:Null<js.lib.Map<String, flight.esm.types.scene2d_canvas.Types.CanvasTextureResolver>>, ?bitmapElementCache:Dynamic, ?textureWindowElementCache:Dynamic, ?registryMiss:Null<((registry:flight.esm.types.render_contract.Types.RenderRegistryTable, kind:String) -> Void)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
