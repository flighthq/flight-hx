// Derived by tools/derive-cairo-aliases.mjs from the generated canvas surface. Do not edit.
package flight;

import Math as HxMath;
import flight._internal._Runtime;
import flight._EffectsCanvas as Facade_EffectsCanvas_flight__EffectsCanvas;
import flight.types.Adjustment;
import flight.types.AdvancedBlendMode;
import flight.types.BevelEffect;
import flight.types.CanvasRenderEffectPipeline;
import flight.types.CanvasRenderEffectRunner;
import flight.types.CanvasRenderState;
import flight.types.CanvasRenderTarget;
import flight.types.CanvasRenderTexturePool;
import flight.types.CompositeOperator;
import flight.types.RenderEffect;
import flight.types.RenderEffectPipelineOptions;
import flight.types.RenderTexture;

class EffectsCairo {
  public static inline function applyCairoGradientRampLookup(dest:CanvasRenderTarget, source:CanvasRenderTarget, ramp:flight._internal._UInt8ClampedArray, ?bias:Float, ?scale:Float):Void { flight.EffectsCanvas.applyCanvasGradientRampLookup(dest, source, ramp, bias, scale); }
  public static inline function applyCairoRenderEffectsToRenderTexture(ownerState:CanvasRenderState, effectState:CanvasRenderState, pool:CanvasRenderTexturePool, source:RenderTexture, dest:RenderTexture, scratch:RenderTexture, effects:Array<RenderEffect>):Bool { return flight.EffectsCanvas.applyCanvasRenderEffectsToRenderTexture(ownerState, effectState, pool, source, dest, scratch, effects); }
  public static inline function beginCairoRenderEffectPipeline(state:CanvasRenderState, pipeline:CanvasRenderEffectPipeline):Void { flight.EffectsCanvas.beginCanvasRenderEffectPipeline(state, pipeline); }
  public static inline function buildCairoGradientRamp(colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>):flight._internal._UInt8ClampedArray { return flight.EffectsCanvas.buildCanvasGradientRamp(colors, alphas, ratios); }
  public static inline function clipCairoBevelBand(band:CanvasRenderTarget, source:CanvasRenderTarget, bevelType:flight._internal._IndexedAccess<BevelEffect, String>):Void { flight.EffectsCanvas.clipCanvasBevelBand(band, source, bevelType); }
  public static inline function createCairoRenderEffectPipeline(state:CanvasRenderState, ?options:RenderEffectPipelineOptions):CanvasRenderEffectPipeline { return flight.EffectsCanvas.createCanvasRenderEffectPipeline(state, options); }
  public static inline function endCairoRenderEffectPipeline(state:CanvasRenderState, pipeline:CanvasRenderEffectPipeline, operations:Array<flight._internal._Union2<RenderEffect, Adjustment>>):Void { flight.EffectsCanvas.endCanvasRenderEffectPipeline(state, pipeline, operations); }
  public static inline function getCairoBlendEffectBackdrop(state:CanvasRenderState, backdropKey:Null<String>):Null<CanvasRenderTarget> { return flight.EffectsCanvas.getCanvasBlendEffectBackdrop(state, backdropKey); }
  public static inline function getCairoBlendEffectCompositeOperation(mode:AdvancedBlendMode):flight._internal.dom.GlobalCompositeOperation { return flight.EffectsCanvas.getCanvasBlendEffectCompositeOperation(mode); }
  public static inline function getCairoCompositeEffectOperation(operator_:CompositeOperator):flight._internal.dom.GlobalCompositeOperation { return flight.EffectsCanvas.getCanvasCompositeEffectOperation(operator_); }
  public static inline function registerCairoBevelEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasBevelEffect(state); }
  public static inline function registerCairoBlendEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasBlendEffect(state); }
  public static inline function registerCairoBlendEffectBackdrop(state:CanvasRenderState, backdropKey:String, target:CanvasRenderTarget):Void { flight.EffectsCanvas.registerCanvasBlendEffectBackdrop(state, backdropKey, target); }
  public static inline function registerCairoBloomEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasBloomEffect(state); }
  public static inline function registerCairoBlurEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasBlurEffect(state); }
  public static inline function registerCairoCompositeEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasCompositeEffect(state); }
  public static inline function registerCairoDropShadowEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasDropShadowEffect(state); }
  public static inline function registerCairoFilmGrainEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasFilmGrainEffect(state); }
  public static inline function registerCairoGradientBevelEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasGradientBevelEffect(state); }
  public static inline function registerCairoGradientGlowEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasGradientGlowEffect(state); }
  public static inline function registerCairoInnerGlowEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasInnerGlowEffect(state); }
  public static inline function registerCairoInnerShadowEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasInnerShadowEffect(state); }
  public static inline function registerCairoLensDistortionEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasLensDistortionEffect(state); }
  public static inline function registerCairoOuterGlowEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasOuterGlowEffect(state); }
  public static inline function registerCairoPixelateEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasPixelateEffect(state); }
  public static inline function registerCairoPosterizeEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasPosterizeEffect(state); }
  public static inline function registerCairoRenderEffect(state:CanvasRenderState, kind:String, runner:CanvasRenderEffectRunner):Void { flight.EffectsCanvas.registerCanvasRenderEffect(state, kind, runner); }
  public static inline function registerCairoScanlinesEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasScanlinesEffect(state); }
  public static inline function registerCairoTiltShiftEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasTiltShiftEffect(state); }
  public static inline function registerCairoVignetteEffect(state:CanvasRenderState):Void { flight.EffectsCanvas.registerCanvasVignetteEffect(state); }
  public static inline function unregisterCairoBlendEffectBackdrop(state:CanvasRenderState, backdropKey:String):Bool { return flight.EffectsCanvas.unregisterCanvasBlendEffectBackdrop(state, backdropKey); }
  public static var defaultCairoBevelEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBevelEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasBevelEffectRunner;
  public static var defaultCairoBlendEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBlendEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasBlendEffectRunner;
  public static var defaultCairoBloomEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBloomEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasBloomEffectRunner;
  public static var defaultCairoBlurEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBlurEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasBlurEffectRunner;
  public static var defaultCairoCompositeEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoCompositeEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasCompositeEffectRunner;
  public static var defaultCairoDropShadowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoDropShadowEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasDropShadowEffectRunner;
  public static var defaultCairoFilmGrainEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoFilmGrainEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasFilmGrainEffectRunner;
  public static var defaultCairoGradientBevelEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoGradientBevelEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasGradientBevelEffectRunner;
  public static var defaultCairoGradientGlowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoGradientGlowEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasGradientGlowEffectRunner;
  public static var defaultCairoInnerGlowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoInnerGlowEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasInnerGlowEffectRunner;
  public static var defaultCairoInnerShadowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoInnerShadowEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasInnerShadowEffectRunner;
  public static var defaultCairoLensDistortionEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoLensDistortionEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasLensDistortionEffectRunner;
  public static var defaultCairoOuterGlowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoOuterGlowEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasOuterGlowEffectRunner;
  public static var defaultCairoPixelateEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoPixelateEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasPixelateEffectRunner;
  public static var defaultCairoPosterizeEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoPosterizeEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasPosterizeEffectRunner;
  public static var defaultCairoScanlinesEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoScanlinesEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasScanlinesEffectRunner;
  public static var defaultCairoTiltShiftEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoTiltShiftEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasTiltShiftEffectRunner;
  public static var defaultCairoVignetteEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoVignetteEffectRunner():CanvasRenderEffectRunner return flight.EffectsCanvas.defaultCanvasVignetteEffectRunner;
}
