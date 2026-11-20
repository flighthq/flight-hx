package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/scene2d-gl")
extern class Scene2DGl {
  public static function areGlColorAdjustmentGuardsEnabled(state:flight.esm.types.render_gl.Types.GlRenderState):Bool;
  public static function createGlCacheState(ownerState:flight.esm.types.render_gl.Types.GlRenderState, ?options:flight.esm.types.render_gl.Types.GlRenderStateOptions):flight.esm.types.render_gl.Types.GlRenderState;
  public static function createGlVelocityTarget(state:flight.esm.types.render_gl.Types.GlRenderState, width:Float, height:Float):flight.esm.types.render_gl.Types.GlTextureRenderTarget;
  public static function enableGlClipSupport(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function enableGlColorAdjustmentGuards(state:flight.esm.types.render_gl.Types.GlRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableGlRenderCache(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function enableGlStrokePathTessellation(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function enableGlTextInput():Void;
  public static function explainGlScene2DCoverage(out:Array<flight.esm.types.render_contract.Types.SceneCoverageEntry>, state:flight.esm.types.render_gl.Types.GlRenderState, usage:flight.esm.types.scene2d_contract.Types.Scene2DKindUsage, catalog:flight.esm.types.render_contract.Types.SceneCoverageCatalog):Void;
  public static function getGlShapeRasterizer(state:flight.esm.types.render_gl.Types.GlRenderState):Null<flight.esm.types.render_contract.Types.ShapeRasterizer>;
  public static final glBitmapTextRenderer:flight.esm.types.render.Types.SpriteRenderer;
  public static final glMeshShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glMorphShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static function glNode2DVelocityWriter(context:flight.esm.types.render_gl.Types.GlVelocityContext, node:Dynamic):Void;
  public static final glParticleEmitter2DRenderer:flight.esm.types.render.Types.SpriteRenderer;
  public static function glParticleEmitter2DVelocityWriter(context:flight.esm.types.render_gl.Types.GlVelocityContext, node:Dynamic):Void;
  public static final glQuadBatchRenderer:flight.esm.types.render.Types.SpriteRenderer;
  public static final glRasterShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glRenderCacheRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glRenderInfrastructure:Dynamic;
  public static final glRichTextRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glScale9ShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glScale9SpriteRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glScene2DRenderPreset:flight.esm.types.render_gl.Types.GlRenderRegistries;
  public static final glScene2DRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glSpriteRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glTextLabelRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final glTilemapRenderer:flight.esm.types.render.Types.SpriteRenderer;
  public static function hasGlScene2DCoverage(state:flight.esm.types.render_gl.Types.GlRenderState, usage:flight.esm.types.scene2d_contract.Types.Scene2DKindUsage):Bool;
  public static function refreshGlRenderCache(ownerState:flight.esm.types.render_gl.Types.GlRenderState, cacheState:flight.esm.types.render_gl.Types.GlRenderState, cache:flight.esm.types.render_contract.Types.RenderCache, source:flight.esm.types.scene2d_contract.Types.Node2D, ?options:Null<flight.esm.types.render_contract.Types.RenderCacheRefreshOptions>):Bool;
  public static function registerGlColorAdjustmentMaterialFeature(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlShapeRasterizer(state:flight.esm.types.render_gl.Types.GlRenderState, rasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>):Void;
  public static function registerGlStandardMaterial(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlVelocityWriter(state:flight.esm.types.render_gl.Types.GlRenderState, kind:String, writer:flight.esm.types.render_gl.Types.GlVelocityWriter):Void;
  public static function renderGlScene2D(pass:flight.esm.types.render_gl.Types.GlRenderPass, source:flight.esm.types.scene2d_contract.Types.Node2D, ?renderTransform:Null<flight.esm.types.geometry.Types.Matrix>):Void;
  public static function renderGlVelocity<Fields>(state:flight.esm.types.render_gl.Types.GlRenderState, root:flight.esm.types.node.Types.Transform2DNode<Fields>, field:flight.esm.types.velocity.Types.VelocityField, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget):Void;
  public static final standardGlQuadMaterialRenderer:flight.esm.types.render_gl.Types.GlQuadMaterialRenderer;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
