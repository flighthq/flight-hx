package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/effects-canvas")
extern class EffectsCanvas {
  public static function applyCanvasEffectsToRenderTexture(ownerState:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, effectState:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTexturePool, source:flight.esm.types.render_contract.Types.RenderTexture, dest:flight.esm.types.render_contract.Types.RenderTexture, scratch:flight.esm.types.render_contract.Types.RenderTexture, effects:Array<flight.esm.types.effects.Types.Effect>):Bool;
  public static function beginCanvasEffectPass(pass:flight.esm.types.scene2d_canvas.Types.CanvasRenderPass, pipeline:flight.esm.types.effects_canvas.Types.CanvasEffectState, ?clear:flight.esm.types.render_contract.Types.RenderTargetClear):flight.esm.types.scene2d_canvas.Types.CanvasRenderPass;
  public static function canvasBevelEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasBlendEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasBloomEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasBlurEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasCompositeEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasDropShadowEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasFilmGrainEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasGradientBevelEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasGradientGlowEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasInnerGlowEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasInnerShadowEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasLensDistortionEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasOuterGlowEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasPixelateEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasPosterizeEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasScanlinesEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasTiltShiftEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function canvasVignetteEffectRunner(ctx:flight.esm.types.scene2d_canvas.Types.CanvasEffectContext, effect:flight.esm.types.effects.Types.Effect):Void;
  public static function createCanvasEffectState(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, ?options:flight.esm.types.effects.Types.EffectStateOptions):flight.esm.types.effects_canvas.Types.CanvasEffectState;
  public static function destroyCanvasEffectState(_state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, pipeline:flight.esm.types.effects_canvas.Types.CanvasEffectState):Void;
  public static function endCanvasEffectPass(scenePass:flight.esm.types.scene2d_canvas.Types.CanvasRenderPass, pipeline:flight.esm.types.effects_canvas.Types.CanvasEffectState, operations:Array<Dynamic>):Void;
  public static function getCanvasBlendEffectBackdrop(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, backdropKey:Null<String>):Null<flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget>;
  public static function getCanvasBlendEffectCompositeOperation(mode:String):String;
  public static function getCanvasCompositeEffectOperation(operator_:String):String;
  public static function getCanvasEffectRunner(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, kind:String):Null<flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner>;
  public static function hasCanvasEffectRunner(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, kind:String):Bool;
  public static function registerCanvasBevelEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasBlendEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasBlendEffectBackdrop(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, backdropKey:String, target:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget):Void;
  public static function registerCanvasBloomEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasBlurEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasCompositeEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasDropShadowEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, kind:String, runner:flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner):Void;
  public static function registerCanvasFilmGrainEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasGradientBevelEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasGradientGlowEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasInnerGlowEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasInnerShadowEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasLensDistortionEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasOuterGlowEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasPixelateEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasPosterizeEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasScanlinesEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasTiltShiftEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
  public static function registerCanvasVignetteEffect(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
