package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/scene2d-dom")
extern class Scene2DDom {
  public static function applyDomSvgFilterToNode(state:flight.esm.types.scene2d_dom.Types.DomRenderState, node:flight.esm.types.scene2d_contract.Types.Node2D, effect:Dynamic):Void;
  public static function areDomTextureResolverGuardsEnabled(state:flight.esm.types.scene2d_dom.Types.DomRenderState):Bool;
  public static function createDomRenderState(element:js.html.Element, ?options:{ ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?textureResolvers:Null<js.lib.Map<String, flight.esm.types.scene2d_dom.Types.DomTextureResolver>>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> }):flight.esm.types.scene2d_dom.Types.DomRenderState;
  public static function createDomSvgConvolutionFilter(effect:flight.esm.types.effects_contract.Types.ConvolutionEffect):String;
  public static function createDomSvgDisplacementMapFilter(effect:flight.esm.types.effects_contract.Types.DisplacementEffect):String;
  public static final domHtmlViewRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domMorphShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domNativeTextRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domRenderCacheRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domRenderInfrastructure:{ ?pixelRatio:Null<Float>, ?sceneGraphSyncPolicy:Null<String>, ?roundPixels:Null<Bool>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?imageSmoothingEnabled:Null<Bool>, ?shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, ?textureResolvers:Null<js.lib.Map<String, flight.esm.types.scene2d_dom.Types.DomTextureResolver>> };
  public static final domRichTextRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domScale9ShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domScale9SpriteRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domScene2DRenderPreset:{ ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>> };
  public static final domScene2DRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domSpriteRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final domTextLabelRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static function enableDomBlendModeSupport(state:flight.esm.types.scene2d_dom.Types.DomRenderState):Void;
  public static function enableDomClipSupport(state:flight.esm.types.scene2d_dom.Types.DomRenderState):Void;
  public static function enableDomCssFilterSupport(state:flight.esm.types.scene2d_dom.Types.DomRenderState):Void;
  public static function enableDomRasterFilterSupport(state:flight.esm.types.scene2d_dom.Types.DomRenderState):Void;
  public static function enableDomRenderCache(state:flight.esm.types.render_contract.Types.RenderState):Void;
  public static function enableDomTextInput():Void;
  public static function enableDomTextureResolverGuards(state:flight.esm.types.scene2d_dom.Types.DomRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function explainDomImageSource(image:Dynamic):flight.esm.types.scene2d_dom.Types.DomImageSourceKind;
  public static function explainDomTextureResolution(state:flight.esm.types.scene2d_dom.Types.DomRenderState, texture:flight.esm.types.texture_contract.Types.Texture):flight.esm.types.texture_contract.Types.TextureResolutionExplanation;
  public static function getDomShapeRasterizer(state:flight.esm.types.scene2d_dom.Types.DomRenderState):Null<flight.esm.types.render_contract.Types.ShapeRasterizer>;
  public static function getDomSvgFilter(state:flight.esm.types.scene2d_dom.Types.DomRenderState, effect:Dynamic):Null<String>;
  public static function mergeDomRenderOptions(...options:Dynamic):{ ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?textureResolvers:Null<js.lib.Map<String, flight.esm.types.scene2d_dom.Types.DomTextureResolver>>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };
  public static function registerDomBitmapTextureResolver(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, state:flight.esm.types.scene2d_dom.Types.DomRenderState):Void;
  public static function registerDomImageTextureResolver(state:flight.esm.types.scene2d_dom.Types.DomRenderState):Void;
  public static function registerDomShapeRasterizer(state:flight.esm.types.scene2d_dom.Types.DomRenderState, rasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>):Void;
  public static function registerDomTextureResolver(state:flight.esm.types.scene2d_dom.Types.DomRenderState, sourceKind:String, resolver:Null<flight.esm.types.scene2d_dom.Types.DomTextureResolver>):Void;
  public static function removeDomSvgFilterFromNode(state:flight.esm.types.scene2d_dom.Types.DomRenderState, node:flight.esm.types.scene2d_contract.Types.Node2D):Void;
  public static function renderDomScene2D(state:flight.esm.types.scene2d_dom.Types.DomRenderState, source:flight.esm.types.scene2d_contract.Types.Node2D, ?renderTransform:Null<flight.esm.types.geometry.Types.Matrix>):Void;
  public static function setDomCssFilter(state:flight.esm.types.scene2d_dom.Types.DomRenderState, node:flight.esm.types.scene2d_contract.Types.Node2D, filter:Null<String>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
