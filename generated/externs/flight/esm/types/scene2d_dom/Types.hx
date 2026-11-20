package flight.esm.types.scene2d_dom;

#if (js && flight_esm)
typedef DomBlendModeFidelity = String;

typedef DomClipContourEntry = { contours:Array<Array<Float>>, kind:String, winding:flight.esm.types.path.Types.PathWinding };

typedef DomClipEntry = Dynamic;

typedef DomClipHooks = { apply:((state:flight.esm.types.scene2d_dom.Types.DomRenderState, data:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void) };

typedef DomImageSourceKind = String;

typedef DomRenderOptions = { ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?textureResolvers:Null<js.lib.Map<String, flight.esm.types.scene2d_dom.Types.DomTextureResolver>>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef DomRenderRegistries = { shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, textureResolvers:js.lib.Map<String, flight.esm.types.scene2d_dom.Types.DomTextureResolver>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, nodeRenderers:js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator> };

typedef DomRenderState = { applyBlendMode:Null<((element:js.html.Element, blendMode:Null<String>) -> Void)>, domCssFilterResolver:Null<((renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Null<String>)>, element:js.html.Element, allowSmoothing:Bool, currentClipDepth:Float, displayObjectClipHooks:Null<flight.esm.types.render_contract.Types.Scene2DClipHooks>, pixelRatio:Float, canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, renderAlpha:Float, renderBlendMode:Null<String>, sceneGraphSyncPolicy:flight.esm.types.render_contract.Types.Scene3DGraphSyncPolicy, roundPixels:Bool };

typedef DomRenderStateRuntime = { registries:flight.esm.types.scene2d_dom.Types.DomRenderRegistries, currentBlendMode:Null<String>, domClipHooks:Null<flight.esm.types.scene2d_dom.Types.DomClipHooks>, domClipStack:Array<flight.esm.types.scene2d_dom.Types.DomClipEntry>, domCurrentElement:Null<js.html.Element>, domElementMap:Dynamic, ?bitmapElementCache:Dynamic, domNextOrderList:Array<flight.esm.types.render_contract.Types.RenderProxy2D>, domOrderLength:Float, domOrderList:Array<flight.esm.types.render_contract.Types.RenderProxy2D>, currentFrameId:Float, renderAdaptHook:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void)>, renderProxyAdapterMap:Dynamic, renderProxyMap:Dynamic, renderProxySources:js.lib.Set<flight.esm.types.node.Types.NodeAny>, registryMiss:Null<((registry:flight.esm.types.render_contract.Types.RenderRegistryTable, kind:String) -> Void)>, rendererMapId:Float, tempStack:Array<flight.esm.types.node.Types.NodeAny>, binding:Dynamic, ?uid:Null<String> };

typedef DomScene2DRectangle = { bottom:Float, left:Float, right:Float, top:Float };

typedef DomTextInputOverlay = ((state:flight.esm.types.scene2d_dom.Types.DomRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void);

typedef DomTextureResolver = ((state:flight.esm.types.scene2d_dom.Types.DomRenderState, texture:flight.esm.types.texture_contract.Types.Texture) -> Dynamic);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
