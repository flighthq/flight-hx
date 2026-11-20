package flight.esm.effects_canvas;

#if (js && flight_esm)
@:jsRequire("@flighthq/effects-canvas/contract")
extern class Contract {
  public static function acquireCanvasRenderTarget(pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, width:Float, height:Float):flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget;
  @:overload(function(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.BevelEffect):Void {})
  public static function applyBevelEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.BevelEffect):Void;
  public static function applyBlendEffectToCanvas(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects.Types.BlendEffect):Void;
  public static function applyBloomEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.BloomEffect):Void;
  public static function applyBlurEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.BlurEffect):Void;
  public static function applyCanvasEffectsToRenderTexture(ownerState:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, effectState:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTexturePool, source:flight.esm.types.render_contract.Types.RenderTexture, dest:flight.esm.types.render_contract.Types.RenderTexture, scratch:flight.esm.types.render_contract.Types.RenderTexture, effects:Array<flight.esm.types.effects.Types.Effect>):Bool;
  public static function applyCanvasGradientRampLookup(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, ramp:js.lib.Uint8ClampedArray, ?bias:Float, ?scale:Float):Void;
  public static function applyColorLutPassToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, lut:flight.esm.types.adjustments_contract.Types.ColorLut):Void;
  public static function applyColorMatrixPassToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, matrix:js.lib.Float32Array):Void;
  public static function applyColorMatrixToImageDataBytes(data:js.lib.Uint8ClampedArray, pixelCount:Float, matrix:js.lib.Float32Array):Void;
  public static function applyCompositeEffectToCanvas(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.CompositeEffect):Void;
  @:overload(function(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.DropShadowEffect):Void {})
  public static function applyDropShadowEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.DropShadowEffect):Void;
  public static function applyFilmGrainEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.FilmGrainEffect):Void;
  @:overload(function(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.GradientBevelEffect):Void {})
  public static function applyGradientBevelEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.GradientBevelEffect):Void;
  @:overload(function(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.GradientGlowEffect):Void {})
  public static function applyGradientGlowEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.GradientGlowEffect):Void;
  @:overload(function(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.InnerGlowEffect):Void {})
  public static function applyInnerGlowEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.InnerGlowEffect):Void;
  @:overload(function(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.InnerShadowEffect):Void {})
  public static function applyInnerShadowEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.InnerShadowEffect):Void;
  public static function applyLensDistortionEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.LensDistortionEffect):Void;
  @:overload(function(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.OuterGlowEffect):Void {})
  public static function applyOuterGlowEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.OuterGlowEffect):Void;
  public static function applyPixelateEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, effect:flight.esm.types.effects_contract.Types.PixelateEffect):Void;
  public static function applyPosterizeEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.PosterizeEffect):Void;
  public static function applyScanlinesEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.ScanlinesEffect):Void;
  public static function applyTiltShiftEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.TiltShiftEffect):Void;
  public static function applyVignetteEffectToCanvas(source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, effect:flight.esm.types.effects_contract.Types.VignetteEffect):Void;
  public static function beginCanvasEffectPass(pass:flight.esm.types.scene2d_canvas.Types.CanvasRenderPass, pipeline:flight.esm.types.effects_canvas.Types.CanvasEffectState, ?clear:flight.esm.types.render_contract.Types.RenderTargetClear):flight.esm.types.scene2d_canvas.Types.CanvasRenderPass;
  public static function buildCanvasGradientRamp(colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>):js.lib.Uint8ClampedArray;
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
  public static function clearCanvasTarget(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget):Void;
  public static function clipCanvasBevelBand(band:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, bevelType:Null<String>):Void;
  public static function compositeCanvasImage(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, ?dx:Float, ?dy:Float, ?compositeOperation:String):Void;
  public static function compositeCanvasSourceMode(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, sourceMode:flight.esm.types.effects_canvas.Types.CanvasEffectSourceMode):Void;
  public static function computeDropShadowEffectCss(effect:flight.esm.types.effects_contract.Types.DropShadowEffect):Null<String>;
  public static function computeOuterGlowEffectCss(effect:flight.esm.types.effects_contract.Types.OuterGlowEffect):Null<String>;
  public static function createCanvasEffectState(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, ?options:flight.esm.types.effects.Types.EffectStateOptions):flight.esm.types.effects_canvas.Types.CanvasEffectState;
  public static function createCanvasTextureRenderTargetPool(canvasHost:flight.esm.types.surface.Types.HostCanvasCapability):flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool;
  public static function destroyCanvasEffectState(_state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, pipeline:flight.esm.types.effects_canvas.Types.CanvasEffectState):Void;
  public static function drawCanvasAccumulationPass(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, samples:Float, perSampleTransform:((ctx:js.html.CanvasRenderingContext2D, index:Float, total:Float) -> Void)):Void;
  public static function drawCanvasEffectPass(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, filter:String, ?compositeOperation:String):Void;
  public static function drawCanvasImageDataPass(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, transform:((data:js.lib.Uint8ClampedArray, pixelCount:Float) -> Void)):Void;
  public static function drawCanvasInvertedTintedAlphaMask(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, color:Float, alpha:Float, strength:Float, ?offsetX:Float, ?offsetY:Float):Void;
  public static function drawCanvasTintedAlphaMask(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, color:Float, alpha:Float, strength:Float):Void;
  public static function endCanvasEffectPass(scenePass:flight.esm.types.scene2d_canvas.Types.CanvasRenderPass, pipeline:flight.esm.types.effects_canvas.Types.CanvasEffectState, operations:Array<Dynamic>):Void;
  public static function getCanvasBlendEffectBackdrop(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, backdropKey:Null<String>):Null<flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget>;
  public static function getCanvasBlendEffectCompositeOperation(mode:String):String;
  public static function getCanvasCompositeEffectOperation(operator_:String):String;
  public static function getCanvasEffectRunner(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, kind:String):Null<flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner>;
  public static function hasCanvasEffectRunner(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, kind:String):Bool;
  public static function initializeCanvasRenderTargetPool(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool>, canvasHost:flight.esm.types.surface.Types.HostCanvasCapability):Void;
  public static function passthroughCanvasEffectPass(dest:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget, source:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget):Void;
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
  public static function releaseCanvasRenderTarget(pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, target:flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget):Void;
  public static function unregisterCanvasBlendEffectBackdrop(state:flight.esm.types.scene2d_canvas.Types.CanvasRenderState, backdropKey:String):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
