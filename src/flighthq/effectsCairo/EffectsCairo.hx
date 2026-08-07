// Derived by tools/derive-cairo-aliases.mjs from the generated canvas surface. Do not edit.
package flighthq.effectsCairo;

import Math as HxMath;
import flighthq._internal._Runtime;
import flighthq.effectsCanvas.CanvasBevelEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasBevelEffect;
import flighthq.effectsCanvas.CanvasBlendEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasBlendEffect;
import flighthq.effectsCanvas.CanvasBloomEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasBloomEffect;
import flighthq.effectsCanvas.CanvasBlurEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasBlurEffect;
import flighthq.effectsCanvas.CanvasCompositeEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasCompositeEffect;
import flighthq.effectsCanvas.CanvasDropShadowEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasDropShadowEffect;
import flighthq.effectsCanvas.CanvasFilmGrainEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasFilmGrainEffect;
import flighthq.effectsCanvas.CanvasGradientBevelEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasGradientBevelEffect;
import flighthq.effectsCanvas.CanvasGradientGlowEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasGradientGlowEffect;
import flighthq.effectsCanvas.CanvasGradientRamp as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasGradientRamp;
import flighthq.effectsCanvas.CanvasInnerGlowEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasInnerGlowEffect;
import flighthq.effectsCanvas.CanvasInnerShadowEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasInnerShadowEffect;
import flighthq.effectsCanvas.CanvasOuterGlowEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasOuterGlowEffect;
import flighthq.effectsCanvas.CanvasPixelateEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasPixelateEffect;
import flighthq.effectsCanvas.CanvasRenderEffectPipeline as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasRenderEffectPipeline;
import flighthq.effectsCanvas.CanvasRenderEffectRegistry as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasRenderEffectRegistry;
import flighthq.effectsCanvas.CanvasRenderTextureEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasRenderTextureEffect;
import flighthq.effectsCanvas.CanvasScanlinesEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasScanlinesEffect;
import flighthq.effectsCanvas.CanvasVignetteEffect as Facade_EffectsCanvas_flighthq_effectsCanvas_CanvasVignetteEffect;
import flighthq.types.Adjustment;
import flighthq.types.AdvancedBlendMode;
import flighthq.types.BevelEffect;
import flighthq.types.CanvasRenderEffectPipeline;
import flighthq.types.CanvasRenderEffectPipeline.CanvasRenderEffectRunner;
import flighthq.types.CanvasRenderState;
import flighthq.types.CanvasRenderTarget;
import flighthq.types.CanvasRenderTexture.CanvasRenderTexturePool;
import flighthq.types.CompositeOperator;
import flighthq.types.GlRenderEffectPipeline.RenderEffectPipelineOptions;
import flighthq.types.RenderEffect;
import flighthq.types.RenderTexture;

class EffectsCairo {
  public static inline function applyCairoGradientRampLookup(dest:CanvasRenderTarget, source:CanvasRenderTarget, ramp:flighthq._internal._UInt8ClampedArray, ?bias:Float, ?scale:Float):Void { flighthq.effectsCanvas.EffectsCanvas.applyCanvasGradientRampLookup(dest, source, ramp, bias, scale); }
  public static inline function applyCairoRenderEffectsToRenderTexture(state:CanvasRenderState, pool:CanvasRenderTexturePool, source:RenderTexture, dest:RenderTexture, scratch:RenderTexture, effects:Array<RenderEffect>):Bool { return flighthq.effectsCanvas.EffectsCanvas.applyCanvasRenderEffectsToRenderTexture(state, pool, source, dest, scratch, effects); }
  public static inline function beginCairoRenderEffectPipeline(state:CanvasRenderState, pipeline:CanvasRenderEffectPipeline):Void { flighthq.effectsCanvas.EffectsCanvas.beginCanvasRenderEffectPipeline(state, pipeline); }
  public static inline function buildCairoGradientRamp(colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>):flighthq._internal._UInt8ClampedArray { return flighthq.effectsCanvas.EffectsCanvas.buildCanvasGradientRamp(colors, alphas, ratios); }
  public static inline function clipCairoBevelBand(band:CanvasRenderTarget, source:CanvasRenderTarget, bevelType:flighthq._internal._IndexedAccess<BevelEffect, String>):Void { flighthq.effectsCanvas.EffectsCanvas.clipCanvasBevelBand(band, source, bevelType); }
  public static inline function createCairoRenderEffectPipeline(_state:CanvasRenderState, ?options:RenderEffectPipelineOptions):CanvasRenderEffectPipeline { return flighthq.effectsCanvas.EffectsCanvas.createCanvasRenderEffectPipeline(_state, options); }
  public static inline function endCairoRenderEffectPipeline(state:CanvasRenderState, pipeline:CanvasRenderEffectPipeline, operations:Array<flighthq._internal._Union2<RenderEffect, Adjustment>>):Void { flighthq.effectsCanvas.EffectsCanvas.endCanvasRenderEffectPipeline(state, pipeline, operations); }
  public static inline function getCairoBlendEffectBackdrop(state:CanvasRenderState, backdropKey:Null<String>):Null<CanvasRenderTarget> { return flighthq.effectsCanvas.EffectsCanvas.getCanvasBlendEffectBackdrop(state, backdropKey); }
  public static inline function getCairoBlendEffectCompositeOperation(mode:AdvancedBlendMode):flighthq._internal.dom.GlobalCompositeOperation { return flighthq.effectsCanvas.EffectsCanvas.getCanvasBlendEffectCompositeOperation(mode); }
  public static inline function getCairoCompositeEffectOperation(operator_:CompositeOperator):flighthq._internal.dom.GlobalCompositeOperation { return flighthq.effectsCanvas.EffectsCanvas.getCanvasCompositeEffectOperation(operator_); }
  public static inline function registerCairoBevelEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasBevelEffect(state); }
  public static inline function registerCairoBlendEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasBlendEffect(state); }
  public static inline function registerCairoBlendEffectBackdrop(state:CanvasRenderState, backdropKey:String, target:CanvasRenderTarget):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasBlendEffectBackdrop(state, backdropKey, target); }
  public static inline function registerCairoBloomEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasBloomEffect(state); }
  public static inline function registerCairoBlurEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasBlurEffect(state); }
  public static inline function registerCairoCompositeEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasCompositeEffect(state); }
  public static inline function registerCairoDropShadowEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasDropShadowEffect(state); }
  public static inline function registerCairoFilmGrainEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasFilmGrainEffect(state); }
  public static inline function registerCairoGradientBevelEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasGradientBevelEffect(state); }
  public static inline function registerCairoGradientGlowEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasGradientGlowEffect(state); }
  public static inline function registerCairoInnerGlowEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasInnerGlowEffect(state); }
  public static inline function registerCairoInnerShadowEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasInnerShadowEffect(state); }
  public static inline function registerCairoOuterGlowEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasOuterGlowEffect(state); }
  public static inline function registerCairoPixelateEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasPixelateEffect(state); }
  public static inline function registerCairoRenderEffect(state:CanvasRenderState, kind:String, runner:CanvasRenderEffectRunner):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasRenderEffect(state, kind, runner); }
  public static inline function registerCairoScanlinesEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasScanlinesEffect(state); }
  public static inline function registerCairoVignetteEffect(state:CanvasRenderState):Void { flighthq.effectsCanvas.EffectsCanvas.registerCanvasVignetteEffect(state); }
  public static inline function unregisterCairoBlendEffectBackdrop(state:CanvasRenderState, backdropKey:String):Bool { return flighthq.effectsCanvas.EffectsCanvas.unregisterCanvasBlendEffectBackdrop(state, backdropKey); }
  public static var defaultCairoBevelEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBevelEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasBevelEffectRunner;
  public static var defaultCairoBlendEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBlendEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasBlendEffectRunner;
  public static var defaultCairoBloomEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBloomEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasBloomEffectRunner;
  public static var defaultCairoBlurEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoBlurEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasBlurEffectRunner;
  public static var defaultCairoCompositeEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoCompositeEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasCompositeEffectRunner;
  public static var defaultCairoDropShadowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoDropShadowEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasDropShadowEffectRunner;
  public static var defaultCairoFilmGrainEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoFilmGrainEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasFilmGrainEffectRunner;
  public static var defaultCairoGradientBevelEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoGradientBevelEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasGradientBevelEffectRunner;
  public static var defaultCairoGradientGlowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoGradientGlowEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasGradientGlowEffectRunner;
  public static var defaultCairoInnerGlowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoInnerGlowEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasInnerGlowEffectRunner;
  public static var defaultCairoInnerShadowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoInnerShadowEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasInnerShadowEffectRunner;
  public static var defaultCairoOuterGlowEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoOuterGlowEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasOuterGlowEffectRunner;
  public static var defaultCairoPixelateEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoPixelateEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasPixelateEffectRunner;
  public static var defaultCairoScanlinesEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoScanlinesEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasScanlinesEffectRunner;
  public static var defaultCairoVignetteEffectRunner(get, never):CanvasRenderEffectRunner;
  static inline function get_defaultCairoVignetteEffectRunner():CanvasRenderEffectRunner return flighthq.effectsCanvas.EffectsCanvas.defaultCanvasVignetteEffectRunner;
}
