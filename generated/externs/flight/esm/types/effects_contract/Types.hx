package flight.esm.types.effects_contract;

#if (js && flight_esm)
typedef AdvancedBlendMode = flight.esm.types.effects.Types.AdvancedBlendMode;

typedef AgxToneMapOptions = { ?minEv:Null<Float>, ?maxEv:Null<Float> };

typedef AutoExposureEffect = { kind:String, ?adaptationSpeed:Null<Float>, ?exposureCompensation:Null<Float>, ?maxExposure:Null<Float>, ?minExposure:Null<Float> };

typedef BarrelDistortionEffect = { kind:String, ?amount:Null<Float>, ?scale:Null<Float> };

typedef BevelEffect = { kind:String, ?angle:Null<Float>, ?bevelType:Null<String>, ?blurX:Null<Float>, ?blurY:Null<Float>, ?distance:Null<Float>, ?highlightAlpha:Null<Float>, ?highlightColor:Null<Float>, ?quality:Null<Float>, ?shadowAlpha:Null<Float>, ?shadowColor:Null<Float>, ?sourceMode:Null<String>, ?strength:Null<Float> };

typedef BitmapDisplacementEffect = { kind:String, map:Null<flight.esm.types.texture_contract.Types.Texture2D>, ?componentX:Null<Float>, ?componentY:Null<Float>, ?scaleX:Null<Float>, ?scaleY:Null<Float>, ?edgeMode:Null<String> };

typedef BitmapDisplacementEffectEdgeMode = String;

typedef BlendEffect = flight.esm.types.effects.Types.BlendEffect;

typedef BloomEffect = { kind:String, ?threshold:Null<Float>, ?intensity:Null<Float>, ?radius:Null<Float>, ?passes:Null<Float> };

typedef BlurEffect = { kind:String, ?blurX:Null<Float>, ?blurY:Null<Float> };

typedef BokehDepthOfFieldEffect = { kind:String, ?focusDistance:Null<Float>, ?focusRange:Null<Float>, ?maxBlur:Null<Float> };

typedef CameraMotionBlurEffect = { kind:String, ?intensity:Null<Float>, ?samples:Null<Float> };

typedef ChromaticAberrationEffect = { kind:String, ?intensity:Null<Float>, ?radial:Null<Bool> };

typedef CompositeEffect = { kind:String, ?backdropKey:Null<String> };

typedef CompositeOperator = flight.esm.types.effects.Types.CompositeOperator;

typedef ContactShadowsEffect = { kind:String, ?distance:Null<Float>, ?opacity:Null<Float>, ?samples:Null<Float>, ?smoothness:Null<Float> };

typedef ConvolutionEffect = { kind:String, matrix:Array<Float>, matrixX:Float, matrixY:Float, ?bias:Null<Float>, ?clamp:Null<Bool>, ?color:Null<Float>, ?divisor:Null<Float>, ?preserveAlpha:Null<Bool> };

typedef CrtEffect = { kind:String, ?curvature:Null<Float>, ?scanlineIntensity:Null<Float>, ?vignette:Null<Float>, ?aberration:Null<Float> };

typedef CustomShaderEffect = { kind:String, shaderKey:String, ?uniforms:Dynamic };

typedef DirectionalBlurEffect = { kind:String, ?angle:Null<Float>, ?length:Null<Float>, ?samples:Null<Float> };

typedef DisplacementEffect = { kind:String, ?intensity:Null<Float>, ?frequency:Null<Float>, ?seed:Null<Float> };

typedef DitherEffect = { kind:String, ?levels:Null<Float> };

typedef DropShadowEffect = { kind:String, ?alpha:Null<Float>, ?angle:Null<Float>, ?blurX:Null<Float>, ?blurY:Null<Float>, ?color:Null<Float>, ?distance:Null<Float>, ?quality:Null<Float>, ?sourceMode:Null<String>, ?strength:Null<Float> };

typedef Effect = flight.esm.types.effects.Types.Effect;

typedef EffectCaptureGeometry = flight.esm.types.effects.Types.EffectCaptureGeometry;

typedef EffectFieldRole = String;

typedef EffectFieldRoles = Dynamic;

typedef EffectInput = String;

typedef EffectKindFieldRoles = Dynamic;

typedef EffectPaddingExplanation = flight.esm.types.effects.Types.EffectPaddingExplanation;

typedef EffectPaddingStatus = flight.esm.types.effects.Types.EffectPaddingStatus;

typedef EffectSourceMode = String;

typedef EffectStateOptions = flight.esm.types.effects.Types.EffectStateOptions;

typedef FilmEmulationEffect = { kind:String, ?gateWeave:Null<Float>, ?grainIntensity:Null<Float>, ?halationRadius:Null<Float>, ?halationStrength:Null<Float> };

typedef FilmGrainEffect = { kind:String, ?intensity:Null<Float>, ?size:Null<Float>, ?seed:Null<Float> };

typedef FilmicToneMapOptions = { ?maxBrightness:Null<Float>, ?contrast:Null<Float>, ?linearStart:Null<Float>, ?linearLength:Null<Float>, ?blackTighten:Null<Float>, ?pedestal:Null<Float> };

typedef FxaaEffect = { kind:String, ?edgeThreshold:Null<Float>, ?subpixel:Null<Float> };

typedef GlitchEffect = { kind:String, ?intensity:Null<Float>, ?blockSize:Null<Float>, ?colorShift:Null<Float>, ?seed:Null<Float> };

typedef GodRaysEffect = { kind:String, ?centerX:Null<Float>, ?centerY:Null<Float>, ?density:Null<Float>, ?decay:Null<Float>, ?weight:Null<Float>, ?exposure:Null<Float>, ?samples:Null<Float> };

typedef GradientBevelEffect = { kind:String, alphas:Array<Float>, ?angle:Null<Float>, ?bevelType:Null<String>, ?blurX:Null<Float>, ?blurY:Null<Float>, colors:Array<Float>, ?distance:Null<Float>, ?quality:Null<Float>, ratios:Array<Float>, ?sourceMode:Null<String>, ?strength:Null<Float> };

typedef GradientGlowEffect = { kind:String, alphas:Array<Float>, ?blurX:Null<Float>, ?blurY:Null<Float>, colors:Array<Float>, ?quality:Null<Float>, ratios:Array<Float>, ?sourceMode:Null<String>, ?strength:Null<Float> };

typedef HalftoneEffect = { kind:String, ?scale:Null<Float>, ?angle:Null<Float> };

typedef InnerEffectSourceMode = String;

typedef InnerGlowEffect = { kind:String, ?alpha:Null<Float>, ?blurX:Null<Float>, ?blurY:Null<Float>, ?color:Null<Float>, ?quality:Null<Float>, ?sourceMode:Null<String>, ?strength:Null<Float> };

typedef InnerShadowEffect = { kind:String, ?alpha:Null<Float>, ?angle:Null<Float>, ?blurX:Null<Float>, ?blurY:Null<Float>, ?color:Null<Float>, ?distance:Null<Float>, ?quality:Null<Float>, ?sourceMode:Null<String>, ?strength:Null<Float> };

typedef KuwaharaEffect = { kind:String, ?radius:Null<Float> };

typedef LensDirtEffect = { kind:String, ?intensity:Null<Float>, ?threshold:Null<Float>, ?seed:Null<Float> };

typedef LensDistortionEffect = { kind:String, ?amount:Null<Float>, ?scale:Null<Float> };

typedef LensFlareEffect = { kind:String, ?threshold:Null<Float>, ?intensity:Null<Float>, ?ghosts:Null<Float>, ?halo:Null<Float> };

typedef MedianEffect = { kind:String, ?radius:Null<Float> };

typedef MotionBlurEffect = { kind:String, ?intensity:Null<Float>, ?samples:Null<Float> };

typedef OuterGlowEffect = { kind:String, ?alpha:Null<Float>, ?blurX:Null<Float>, ?blurY:Null<Float>, ?color:Null<Float>, ?quality:Null<Float>, ?sourceMode:Null<String>, ?strength:Null<Float> };

typedef OutlineEffect = { kind:String, ?threshold:Null<Float>, ?thickness:Null<Float>, ?color:Null<Float> };

typedef PanniniProjectionEffect = { kind:String, ?compression:Null<Float>, ?crop:Null<Float> };

typedef PixelateEffect = { kind:String, ?size:Null<Float> };

typedef PosterizeEffect = { kind:String, ?levels:Null<Float> };

typedef RadialBlurEffect = { kind:String, ?centerX:Null<Float>, ?centerY:Null<Float>, ?strength:Null<Float>, ?samples:Null<Float> };

typedef ScanlinesEffect = { kind:String, ?count:Null<Float>, ?intensity:Null<Float> };

typedef ScreenSpaceFogEffect = { kind:String, ?color:Null<Float>, ?near:Null<Float>, ?far:Null<Float>, ?density:Null<Float> };

typedef SharpenEffect = { kind:String, ?amount:Null<Float> };

typedef SketchEffect = { kind:String, ?strength:Null<Float> };

typedef SmaaEffect = { kind:String, ?threshold:Null<Float> };

typedef SsaoEffect = { kind:String, ?radius:Null<Float>, ?intensity:Null<Float>, ?bias:Null<Float>, ?samples:Null<Float> };

typedef SsrEffect = { kind:String, ?maxDistance:Null<Float>, ?resolution:Null<Float>, ?steps:Null<Float> };

typedef TaaEffect = { kind:String, ?feedback:Null<Float> };

typedef TiltShiftEffect = { kind:String, ?center:Null<Float>, ?width:Null<Float>, ?blur:Null<Float> };

typedef ToneMapEffect = { kind:String, ?exposure:Null<Float>, ?white:Null<Float> };

typedef ToneMapOperator = String;

typedef VignetteEffect = { kind:String, ?intensity:Null<Float>, ?radius:Null<Float>, ?softness:Null<Float>, ?color:Null<Float> };

typedef VolumetricLightEffect = { kind:String, ?density:Null<Float>, ?lightColor:Null<Float>, ?lightX:Null<Float>, ?lightY:Null<Float>, ?samples:Null<Float>, ?scattering:Null<Float> };

typedef WhiteBalanceEffect = { kind:String, ?temperature:Null<Float>, ?tint:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
