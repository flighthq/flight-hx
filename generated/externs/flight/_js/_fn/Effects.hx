package flight._js._fn;

@:jsRequire("@flighthq/effects")
extern class Effects {
	@:native("createAutoExposureEffect")
	public static function createAutoExposureEffect():Dynamic;
	@:native("createBarrelDistortionEffect")
	public static function createBarrelDistortionEffect():Dynamic;
	@:native("createBevelEffect")
	public static function createBevelEffect():Dynamic;
	@:native("getBevelEffectPadding")
	public static function getBevelEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BevelEffect):Void;
	@:native("createBitmapDisplacementEffect")
	public static function createBitmapDisplacementEffect():Dynamic;
	@:native("getBitmapDisplacementEffectPadding")
	public static function getBitmapDisplacementEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BitmapDisplacementEffect):Void;
	@:native("createBlendEffect")
	public static function createBlendEffect():Dynamic;
	@:native("blendNonSeparableRgb")
	public static function blendNonSeparableRgb(out:Dynamic, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void;
	@:native("getAdvancedBlendRgb")
	public static function getAdvancedBlendRgb(out:Dynamic, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void;
	@:native("getSeparableBlendChannel")
	public static function getSeparableBlendChannel(mode:String, cb:Float, cs:Float):Float;
	@:native("isNonSeparableBlendMode")
	public static function isNonSeparableBlendMode(mode:String):Bool;
	@:native("createBloomEffect")
	public static function createBloomEffect():Dynamic;
	@:native("computeBloomBlurRadius")
	public static function computeBloomBlurRadius(effect:flight._js.BloomEffect):Float;
	@:native("computeBloomIntensity")
	public static function computeBloomIntensity(effect:flight._js.BloomEffect):Float;
	@:native("computeBloomThreshold")
	public static function computeBloomThreshold(effect:flight._js.BloomEffect):Float;
	@:native("getBloomEffectPadding")
	public static function getBloomEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BloomEffect):Void;
	@:native("getBlurDownsampleLevel")
	public static function getBlurDownsampleLevel(sigma:Float):Int;
	@:native("getBlurResidualSigma")
	public static function getBlurResidualSigma(sigma:Float, level:Int):Float;
	@:native("createBlurEffect")
	public static function createBlurEffect():Dynamic;
	@:native("getBlurEffectPadding")
	public static function getBlurEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BlurEffect):Void;
	@:native("createBokehDepthOfFieldEffect")
	public static function createBokehDepthOfFieldEffect():Dynamic;
	@:native("getBokehDepthOfFieldEffectPadding")
	public static function getBokehDepthOfFieldEffectPadding(out:flight._js.EffectPadding, effect:flight._js.BokehDepthOfFieldEffect):Void;
	@:native("computeBoxBlurPassRadius")
	public static function computeBoxBlurPassRadius(sigma:Float, passes:Float, pass:Float):Float;
	@:native("computeBoxBlurRadius")
	public static function computeBoxBlurRadius(sigma:Float, passes:Float):Float;
	@:native("computeGaussianSigmaForBlurRadius")
	public static function computeGaussianSigmaForBlurRadius(radius:Float, passes:Float):Float;
	@:native("createCameraMotionBlurEffect")
	public static function createCameraMotionBlurEffect():Dynamic;
	@:native("createChromaticAberrationEffect")
	public static function createChromaticAberrationEffect():Dynamic;
	@:native("computeColorTemperatureRgb")
	public static function computeColorTemperatureRgb(out:Dynamic, kelvin:Float):Void;
	@:native("computeWhiteBalanceMultipliers")
	public static function computeWhiteBalanceMultipliers(out:Dynamic, temperature:Float, tint:Float):Void;
	@:native("createCompositeEffect")
	public static function createCompositeEffect():Dynamic;
	@:native("getCompositeOperatorFactors")
	public static function getCompositeOperatorFactors(out:Dynamic, operator_:String, sourceAlpha:Float, backdropAlpha:Float):Void;
	@:native("createContactShadowsEffect")
	public static function createContactShadowsEffect():Dynamic;
	@:native("getContactShadowsEffectPadding")
	public static function getContactShadowsEffectPadding(out:flight._js.EffectPadding, effect:flight._js.ContactShadowsEffect):Void;
	@:native("createConvolutionEffect")
	public static function createConvolutionEffect():Dynamic;
	@:native("getConvolutionEffectPadding")
	public static function getConvolutionEffectPadding(out:flight._js.EffectPadding, effect:flight._js.ConvolutionEffect):Void;
	@:native("createCrtEffect")
	public static function createCrtEffect():Dynamic;
	@:native("createCustomShaderEffect")
	public static function createCustomShaderEffect():Dynamic;
	@:native("computeDepthOfFieldCoc")
	public static function computeDepthOfFieldCoc(depth:Float, focusDistance:Float, aperture:Float, focalLength:Float):Float;
	@:native("computeLinearDepthFromNonlinear")
	public static function computeLinearDepthFromNonlinear(depth:Float, near:Float, far:Float):Float;
	@:native("computeSsaoSampleKernel")
	public static function computeSsaoSampleKernel(out:Dynamic, samples:Float):Int;
	@:native("createDirectionalBlurEffect")
	public static function createDirectionalBlurEffect():Dynamic;
	@:native("getDirectionalBlurEffectPadding")
	public static function getDirectionalBlurEffectPadding(out:flight._js.EffectPadding, effect:flight._js.DirectionalBlurEffect):Void;
	@:native("createDisplacementEffect")
	public static function createDisplacementEffect():Dynamic;
	@:native("getDisplacementEffectPadding")
	public static function getDisplacementEffectPadding(out:flight._js.EffectPadding, effect:flight._js.DisplacementEffect):Void;
	@:native("createDitherEffect")
	public static function createDitherEffect():Dynamic;
	@:native("createDropShadowEffect")
	public static function createDropShadowEffect():Dynamic;
	@:native("getDropShadowEffectPadding")
	public static function getDropShadowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.DropShadowEffect):Void;
	@:native("computeOutlineEdgeParams")
	public static function computeOutlineEdgeParams(out:Dynamic, effect:flight._js.OutlineEffect):Void;
	@:native("computeOutlineThicknessPx")
	public static function computeOutlineThicknessPx(effect:flight._js.OutlineEffect):Float;
	@:native("computeSketchEdgeParams")
	public static function computeSketchEdgeParams(out:Dynamic, effect:flight._js.SketchEffect):Void;
	@:native("getSobelKernelCoefficients")
	public static function getSobelKernelCoefficients(out:Dynamic):Void;
	@:native("getEffectDefaults")
	public static function getEffectDefaults(out:flight._js.EffectDefaults, kind:String):Void;
	@:native("normalizeEffect")
	public static function normalizeEffect(effect:flight._js.EffectRef, out:flight._js.EffectRef):Bool;
	@:native("canLerpEffects")
	public static function canLerpEffects(a:flight._js.EffectRef, b:flight._js.EffectRef):Bool;
	@:native("getDirectionalEffectPadding")
	public static function getDirectionalEffectPadding(out:flight._js.EffectPadding, blurX:Float, blurY:Float, offsetX:Float, offsetY:Float):Void;
	@:native("getGaussianEffectPadding")
	public static function getGaussianEffectPadding(out:flight._js.EffectPadding, blurX:Float, blurY:Float):Void;
	@:native("validateEffectList")
	public static function validateEffectList(effects:Dynamic, available:Dynamic):Null<Dynamic>;
	@:native("createFilmEmulationEffect")
	public static function createFilmEmulationEffect():Dynamic;
	@:native("createFilmGrainEffect")
	public static function createFilmGrainEffect():Dynamic;
	@:native("createFxaaEffect")
	public static function createFxaaEffect():Dynamic;
	@:native("computeGaussianKernelWeights")
	public static function computeGaussianKernelWeights(out:Dynamic, sigma:Float):Void;
	@:native("getGaussianKernelSize")
	public static function getGaussianKernelSize(sigma:Float):Int;
	@:native("createGaussianKernelWeights")
	public static function createGaussianKernelWeights(out:Dynamic, radius:Float, sigma:Float):Int;
	@:native("computeGaussianRadiusFromSigma")
	public static function computeGaussianRadiusFromSigma(sigma:Float):Float;
	@:native("computeGaussianSigmaFromRadius")
	public static function computeGaussianSigmaFromRadius(radius:Float):Float;
	@:native("computeSeparableBlurPassCount")
	public static function computeSeparableBlurPassCount(samples:Null<Float>):Float;
	@:native("createGlitchEffect")
	public static function createGlitchEffect():Dynamic;
	@:native("getGlitchEffectPadding")
	public static function getGlitchEffectPadding(out:flight._js.EffectPadding, effect:flight._js.GlitchEffect):Void;
	@:native("createGodRaysEffect")
	public static function createGodRaysEffect():Dynamic;
	@:native("computeGodRaysAccumulationScale")
	public static function computeGodRaysAccumulationScale(effect:flight._js.GodRaysEffect):Float;
	@:native("computeGodRaysLightCenter")
	public static function computeGodRaysLightCenter(out:Dynamic, effect:flight._js.GodRaysEffect):Void;
	@:native("computeGodRaysSampleWeight")
	public static function computeGodRaysSampleWeight(effect:flight._js.GodRaysEffect, sampleIndex:Float):Float;
	@:native("computeGodRaysStepSize")
	public static function computeGodRaysStepSize(out:Dynamic, effect:flight._js.GodRaysEffect, px:Float, py:Float):Void;
	@:native("createGradientBevelEffect")
	public static function createGradientBevelEffect():Dynamic;
	@:native("getGradientBevelEffectPadding")
	public static function getGradientBevelEffectPadding(out:flight._js.EffectPadding, effect:flight._js.GradientBevelEffect):Void;
	@:native("createGradientGlowEffect")
	public static function createGradientGlowEffect():Dynamic;
	@:native("getGradientGlowEffectPadding")
	public static function getGradientGlowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.GradientGlowEffect):Void;
	@:native("createHalftoneEffect")
	public static function createHalftoneEffect():Dynamic;
	@:native("createInnerGlowEffect")
	public static function createInnerGlowEffect():Dynamic;
	@:native("getInnerGlowEffectPadding")
	public static function getInnerGlowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.InnerGlowEffect):Void;
	@:native("createInnerShadowEffect")
	public static function createInnerShadowEffect():Dynamic;
	@:native("getInnerShadowEffectPadding")
	public static function getInnerShadowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.InnerShadowEffect):Void;
	@:native("createKuwaharaEffect")
	public static function createKuwaharaEffect():Dynamic;
	@:native("computeKuwaharaGaussianWeights")
	public static function computeKuwaharaGaussianWeights(out:Dynamic, radius:Float):Int;
	@:native("computeKuwaharaSectorOffsets")
	public static function computeKuwaharaSectorOffsets(out:Dynamic, radius:Float):Void;
	@:native("computeKuwaharaSectorPixelCount")
	public static function computeKuwaharaSectorPixelCount(effect:flight._js.KuwaharaEffect):Int;
	@:native("computeKuwaharaSectorSize")
	public static function computeKuwaharaSectorSize(effect:flight._js.KuwaharaEffect):Int;
	@:native("createLensDirtEffect")
	public static function createLensDirtEffect():Dynamic;
	@:native("createLensDistortionEffect")
	public static function createLensDistortionEffect():Dynamic;
	@:native("createLensFlareEffect")
	public static function createLensFlareEffect():Dynamic;
	@:native("computeLinearSampledGaussian")
	public static function computeLinearSampledGaussian(outWeights:Dynamic, outOffsets:Dynamic, sigma:Float):Void;
	@:native("getLinearSampledGaussianTapCount")
	public static function getLinearSampledGaussianTapCount(sigma:Float):Int;
	@:native("createMedianEffect")
	public static function createMedianEffect():Dynamic;
	@:native("getMedianEffectPadding")
	public static function getMedianEffectPadding(out:flight._js.EffectPadding, effect:flight._js.MedianEffect):Void;
	@:native("createMotionBlurEffect")
	public static function createMotionBlurEffect():Dynamic;
	@:native("createOuterGlowEffect")
	public static function createOuterGlowEffect():Dynamic;
	@:native("getOuterGlowEffectPadding")
	public static function getOuterGlowEffectPadding(out:flight._js.EffectPadding, effect:flight._js.OuterGlowEffect):Void;
	@:native("createOutlineEffect")
	public static function createOutlineEffect():Dynamic;
	@:native("getOutlineEffectPadding")
	public static function getOutlineEffectPadding(out:flight._js.EffectPadding, effect:flight._js.OutlineEffect):Void;
	@:native("createPanniniProjectionEffect")
	public static function createPanniniProjectionEffect():Dynamic;
	@:native("createPixelateEffect")
	public static function createPixelateEffect():Dynamic;
	@:native("createPosterizeEffect")
	public static function createPosterizeEffect():Dynamic;
	@:native("createRadialBlurEffect")
	public static function createRadialBlurEffect():Dynamic;
	@:native("createScanlinesEffect")
	public static function createScanlinesEffect():Dynamic;
	@:native("createScreenSpaceFogEffect")
	public static function createScreenSpaceFogEffect():Dynamic;
	@:native("createSharpenEffect")
	public static function createSharpenEffect():Dynamic;
	@:native("createSketchEffect")
	public static function createSketchEffect():Dynamic;
	@:native("createSmaaEffect")
	public static function createSmaaEffect():Dynamic;
	@:native("createSsaoEffect")
	public static function createSsaoEffect():Dynamic;
	@:native("createSsrEffect")
	public static function createSsrEffect():Dynamic;
	@:native("createBayerMatrix")
	public static function createBayerMatrix(out:Dynamic, order:Float):Int;
	@:native("computeCrtMaskParams")
	public static function computeCrtMaskParams(out:Dynamic, resolution:Float, curvature:Float):Void;
	@:native("computeHalftoneCellParams")
	public static function computeHalftoneCellParams(out:Dynamic, frequency:Float, angle:Float):Void;
	@:native("computeScanlineParams")
	public static function computeScanlineParams(out:Dynamic, resolution:Float, intensity:Float):Void;
	@:native("createTaaEffect")
	public static function createTaaEffect():Dynamic;
	@:native("createTiltShiftEffect")
	public static function createTiltShiftEffect():Dynamic;
	@:native("getTiltShiftEffectPadding")
	public static function getTiltShiftEffectPadding(out:flight._js.EffectPadding, effect:flight._js.TiltShiftEffect):Void;
	@:native("createToneMapEffect")
	public static function createToneMapEffect():Dynamic;
	@:native("computeAcesToneMap")
	public static function computeAcesToneMap(x:Float):Float;
	@:native("computeAgxToneMap")
	public static function computeAgxToneMap(x:Float, options:Null<flight._js.AgxToneMapOptions>):Float;
	@:native("computeExposureScale")
	public static function computeExposureScale(exposure:Float):Float;
	@:native("computeFilmicToneMap")
	public static function computeFilmicToneMap(x:Float, options:Null<flight._js.FilmicToneMapOptions>):Float;
	@:native("computeReinhardExtendedToneMap")
	public static function computeReinhardExtendedToneMap(x:Float, white:Float):Float;
	@:native("computeReinhardToneMap")
	public static function computeReinhardToneMap(x:Float):Float;
	@:native("computeUncharted2ToneMap")
	public static function computeUncharted2ToneMap(x:Float):Float;
	@:native("getAcesInputMatrix")
	public static function getAcesInputMatrix(out:Dynamic):Void;
	@:native("getAcesOutputMatrix")
	public static function getAcesOutputMatrix(out:Dynamic):Void;
	@:native("createVignetteEffect")
	public static function createVignetteEffect():Dynamic;
	@:native("createVolumetricLightEffect")
	public static function createVolumetricLightEffect():Dynamic;
	@:native("createWhiteBalanceEffect")
	public static function createWhiteBalanceEffect():Dynamic;
}
