package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/scene2d-wgpu")
extern class Scene2DWgpu {
  public static function areWgpuColorAdjustmentGuardsEnabled(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Bool;
  public static function createWgpuCacheState(ownerState:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, deviceState:flight.esm.types.render_wgpu_contract.Types.WgpuDeviceState, ?options:flight.esm.types.render_wgpu_contract.Types.WgpuRenderStateOptions):flight.esm.types.render_wgpu_contract.Types.WgpuRenderState;
  public static function createWgpuVelocityTarget(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, width:Float, height:Float):flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget;
  public static function enableWgpuClipSupport(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function enableWgpuColorAdjustmentGuards(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableWgpuRenderCache(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function enableWgpuStrokePathTessellation(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function enableWgpuTextInput():Void;
  public static function getWgpuShapeRasterizer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Null<flight.esm.types.render_contract.Types.ShapeRasterizer>;
  public static function refreshWgpuRenderCache(ownerState:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, cacheState:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, cache:flight.esm.types.render_contract.Types.RenderCache, source:flight.esm.types.scene2d_contract.Types.Node2D, ?options:Null<flight.esm.types.render_contract.Types.RenderCacheRefreshOptions>):Bool;
  public static function registerWgpuBitmapTextRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuColorAdjustmentMaterialFeature(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuMeshShapeRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuMorphShapeRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuParticleEmitter2DRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuQuadBatchRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuRasterShapeRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuRenderCacheRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuRichTextRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuScale9ShapeRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuScale9SpriteRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuScene2DRenderPreset(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuScene2DRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuShapeRasterizer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, rasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>):Void;
  public static function registerWgpuShapeRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuSpriteRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuStandardMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuTextLabelRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuTilemapRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuVelocityWriter(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, kind:String, writer:flight.esm.types.render_wgpu_contract.Types.WgpuVelocityWriter):Void;
  public static function renderWgpuScene2D(pass:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPass, source:flight.esm.types.scene2d_contract.Types.Node2D, ?renderTransform:Null<flight.esm.types.geometry.Types.Matrix>):Void;
  public static function renderWgpuVelocity<Fields>(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, root:flight.esm.types.node.Types.Transform2DNode<Fields>, field:flight.esm.types.velocity.Types.VelocityField, target:flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget):Void;
  public static final standardWgpuQuadMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuQuadMaterialRenderer;
  public static final wgpuBitmapTextRenderer:flight.esm.types.render.Types.SpriteRenderer;
  public static final wgpuMeshShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuMorphShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static function wgpuNode2DVelocityWriter(ctx:flight.esm.types.render_wgpu_contract.Types.WgpuVelocityContext, node:Dynamic):Void;
  public static final wgpuParticleEmitter2DRenderer:flight.esm.types.render.Types.SpriteRenderer;
  public static function wgpuParticleEmitter2DVelocityWriter(ctx:flight.esm.types.render_wgpu_contract.Types.WgpuVelocityContext, node:Dynamic):Void;
  public static final wgpuQuadBatchRenderer:flight.esm.types.render.Types.SpriteRenderer;
  public static final wgpuRasterShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuRenderCacheRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuRenderInfrastructure:{ passes:Null<Array<flight.esm.types.render_wgpu_contract.Types.WgpuScene3DPass>>, ?colorAdjustments:Dynamic, materialRenderers:js.lib.Map<String, Dynamic>, effects:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuEffectRegistration>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, textureResolvers:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuTextureResolver>, ?colorAdjustmentFeature:Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeature>, ?colorAdjustmentFeatureGuard:Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeatureGuard>, compressedTextureDecoder:Null<flight.esm.types.render_wgpu_compressed_texture_decoder_contract.Types.WgpuCompressedTextureDecoder>, compressedTextureUpload:Null<flight.esm.types.render_wgpu_contract.Types.WgpuCompressedTextureUploader>, customMaterialShaders:js.lib.Map<String, String>, modifierSnippets:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet>, velocityWriters:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuVelocityWriter>, gpuSkinning:Null<flight.esm.types.render_wgpu_contract.Types.WgpuSkinningAdapter> };
  public static final wgpuRichTextRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuScale9ShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuScale9SpriteRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuScene2DRenderPreset:flight.esm.types.render_wgpu_contract.Types.WgpuRenderRegistries;
  public static final wgpuScene2DRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuShapeRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuSpriteRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuTextLabelRenderer:flight.esm.types.render_contract.Types.Scene2DRenderer;
  public static final wgpuTilemapRenderer:flight.esm.types.render.Types.SpriteRenderer;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
