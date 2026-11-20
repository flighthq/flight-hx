package flight;

#if (js && flight_esm)
extern inline function createAutoExposureEffect():Dynamic {
	return flight._js._fn.Effects.createAutoExposureEffect();
}
#else
extern inline function createAutoExposureEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createAutoExposureEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createAutoExposureEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createAutoExposureEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBarrelDistortionEffect():Dynamic {
	return flight._js._fn.Effects.createBarrelDistortionEffect();
}
#else
extern inline function createBarrelDistortionEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createBarrelDistortionEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createBarrelDistortionEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBarrelDistortionEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBevelEffect():Dynamic {
	return flight._js._fn.Effects.createBevelEffect();
}
#else
extern inline function createBevelEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createBevelEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createBevelEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBevelEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBevelEffectPadding(out:EffectPadding, effect:BevelEffect):Void {
	flight._js._fn.Effects.getBevelEffectPadding(out, effect);
}
#else
extern inline function getBevelEffectPadding(out:EffectPadding, effect:BevelEffect):Void {
#if hl
	flight._hl._fn.Effects.getBevelEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getBevelEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getBevelEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBitmapDisplacementEffect():Dynamic {
	return flight._js._fn.Effects.createBitmapDisplacementEffect();
}
#else
extern inline function createBitmapDisplacementEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createBitmapDisplacementEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createBitmapDisplacementEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBitmapDisplacementEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBitmapDisplacementEffectPadding(out:EffectPadding, effect:BitmapDisplacementEffect):Void {
	flight._js._fn.Effects.getBitmapDisplacementEffectPadding(out, effect);
}
#else
extern inline function getBitmapDisplacementEffectPadding(out:EffectPadding, effect:BitmapDisplacementEffect):Void {
#if hl
	flight._hl._fn.Effects.getBitmapDisplacementEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getBitmapDisplacementEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getBitmapDisplacementEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBlendEffect():Dynamic {
	return flight._js._fn.Effects.createBlendEffect();
}
#else
extern inline function createBlendEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createBlendEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createBlendEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBlendEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function blendNonSeparableRgb(out:Dynamic, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void {
	flight._js._fn.Effects.blendNonSeparableRgb(out, mode, cbR, cbG, cbB, csR, csG, csB);
}
#else
extern inline function blendNonSeparableRgb(out:Dynamic, outLen:Int, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void {
#if hl
	flight._hl._fn.Effects.blendNonSeparableRgb(out, outLen, cast mode, cbR, cbG, cbB, csR, csG, csB);
#elseif cpp
	flight._cpp._fn.Effects.blendNonSeparableRgb(out, outLen, cast mode, cbR, cbG, cbB, csR, csG, csB);
#elseif (js && flight_esm)
	flight._js._fn.Effects.blendNonSeparableRgb(out, outLen, mode, cbR, cbG, cbB, csR, csG, csB);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdvancedBlendRgb(out:Dynamic, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void {
	flight._js._fn.Effects.getAdvancedBlendRgb(out, mode, cbR, cbG, cbB, csR, csG, csB);
}
#else
extern inline function getAdvancedBlendRgb(out:Dynamic, outLen:Int, mode:String, cbR:Float, cbG:Float, cbB:Float, csR:Float, csG:Float, csB:Float):Void {
#if hl
	flight._hl._fn.Effects.getAdvancedBlendRgb(out, outLen, cast mode, cbR, cbG, cbB, csR, csG, csB);
#elseif cpp
	flight._cpp._fn.Effects.getAdvancedBlendRgb(out, outLen, cast mode, cbR, cbG, cbB, csR, csG, csB);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getAdvancedBlendRgb(out, outLen, mode, cbR, cbG, cbB, csR, csG, csB);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSeparableBlendChannel(mode:String, cb:Float, cs:Float):Float {
	return flight._js._fn.Effects.getSeparableBlendChannel(mode, cb, cs);
}
#else
extern inline function getSeparableBlendChannel(mode:String, cb:Float, cs:Float):Float {
#if hl
	return flight._hl._fn.Effects.getSeparableBlendChannel(cast mode, cb, cs);
#elseif cpp
	return flight._cpp._fn.Effects.getSeparableBlendChannel(cast mode, cb, cs);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.getSeparableBlendChannel(mode, cb, cs);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isNonSeparableBlendMode(mode:String):Bool {
	return flight._js._fn.Effects.isNonSeparableBlendMode(mode);
}
#else
extern inline function isNonSeparableBlendMode(mode:String):Bool {
#if hl
	return flight._hl._fn.Effects.isNonSeparableBlendMode(cast mode);
#elseif cpp
	return flight._cpp._fn.Effects.isNonSeparableBlendMode(cast mode);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.isNonSeparableBlendMode(mode);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBloomEffect():Dynamic {
	return flight._js._fn.Effects.createBloomEffect();
}
#else
extern inline function createBloomEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createBloomEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createBloomEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBloomEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeBloomBlurRadius(effect:BloomEffect):Float {
	return flight._js._fn.Effects.computeBloomBlurRadius(effect);
}
#else
extern inline function computeBloomBlurRadius(effect:BloomEffect):Float {
#if hl
	return flight._hl._fn.Effects.computeBloomBlurRadius(effect);
#elseif cpp
	return flight._cpp._fn.Effects.computeBloomBlurRadius(effect);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeBloomBlurRadius(effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeBloomIntensity(effect:BloomEffect):Float {
	return flight._js._fn.Effects.computeBloomIntensity(effect);
}
#else
extern inline function computeBloomIntensity(effect:BloomEffect):Float {
#if hl
	return flight._hl._fn.Effects.computeBloomIntensity(effect);
#elseif cpp
	return flight._cpp._fn.Effects.computeBloomIntensity(effect);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeBloomIntensity(effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeBloomThreshold(effect:BloomEffect):Float {
	return flight._js._fn.Effects.computeBloomThreshold(effect);
}
#else
extern inline function computeBloomThreshold(effect:BloomEffect):Float {
#if hl
	return flight._hl._fn.Effects.computeBloomThreshold(effect);
#elseif cpp
	return flight._cpp._fn.Effects.computeBloomThreshold(effect);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeBloomThreshold(effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBloomEffectPadding(out:EffectPadding, effect:BloomEffect):Void {
	flight._js._fn.Effects.getBloomEffectPadding(out, effect);
}
#else
extern inline function getBloomEffectPadding(out:EffectPadding, effect:BloomEffect):Void {
#if hl
	flight._hl._fn.Effects.getBloomEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getBloomEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getBloomEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBlurDownsampleLevel(sigma:Float):Int {
	return flight._js._fn.Effects.getBlurDownsampleLevel(sigma);
}
#else
extern inline function getBlurDownsampleLevel(sigma:Float):Int {
#if hl
	return flight._hl._fn.Effects.getBlurDownsampleLevel(sigma);
#elseif cpp
	return flight._cpp._fn.Effects.getBlurDownsampleLevel(sigma);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.getBlurDownsampleLevel(sigma);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBlurResidualSigma(sigma:Float, level:Int):Float {
	return flight._js._fn.Effects.getBlurResidualSigma(sigma, level);
}
#else
extern inline function getBlurResidualSigma(sigma:Float, level:Int):Float {
#if hl
	return flight._hl._fn.Effects.getBlurResidualSigma(sigma, level);
#elseif cpp
	return flight._cpp._fn.Effects.getBlurResidualSigma(sigma, level);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.getBlurResidualSigma(sigma, level);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBlurEffect():Dynamic {
	return flight._js._fn.Effects.createBlurEffect();
}
#else
extern inline function createBlurEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createBlurEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createBlurEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBlurEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBlurEffectPadding(out:EffectPadding, effect:BlurEffect):Void {
	flight._js._fn.Effects.getBlurEffectPadding(out, effect);
}
#else
extern inline function getBlurEffectPadding(out:EffectPadding, effect:BlurEffect):Void {
#if hl
	flight._hl._fn.Effects.getBlurEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getBlurEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getBlurEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBokehDepthOfFieldEffect():Dynamic {
	return flight._js._fn.Effects.createBokehDepthOfFieldEffect();
}
#else
extern inline function createBokehDepthOfFieldEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createBokehDepthOfFieldEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createBokehDepthOfFieldEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBokehDepthOfFieldEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBokehDepthOfFieldEffectPadding(out:EffectPadding, effect:BokehDepthOfFieldEffect):Void {
	flight._js._fn.Effects.getBokehDepthOfFieldEffectPadding(out, effect);
}
#else
extern inline function getBokehDepthOfFieldEffectPadding(out:EffectPadding, effect:BokehDepthOfFieldEffect):Void {
#if hl
	flight._hl._fn.Effects.getBokehDepthOfFieldEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getBokehDepthOfFieldEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getBokehDepthOfFieldEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeBoxBlurPassRadius(sigma:Float, passes:Float, pass:Float):Float {
	return flight._js._fn.Effects.computeBoxBlurPassRadius(sigma, passes, pass);
}
#else
extern inline function computeBoxBlurPassRadius(sigma:Float, passes:Float, pass:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeBoxBlurPassRadius(sigma, passes, pass);
#elseif cpp
	return flight._cpp._fn.Effects.computeBoxBlurPassRadius(sigma, passes, pass);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeBoxBlurPassRadius(sigma, passes, pass);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeBoxBlurRadius(sigma:Float, passes:Float):Float {
	return flight._js._fn.Effects.computeBoxBlurRadius(sigma, passes);
}
#else
extern inline function computeBoxBlurRadius(sigma:Float, passes:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeBoxBlurRadius(sigma, passes);
#elseif cpp
	return flight._cpp._fn.Effects.computeBoxBlurRadius(sigma, passes);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeBoxBlurRadius(sigma, passes);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGaussianSigmaForBlurRadius(radius:Float, passes:Float):Float {
	return flight._js._fn.Effects.computeGaussianSigmaForBlurRadius(radius, passes);
}
#else
extern inline function computeGaussianSigmaForBlurRadius(radius:Float, passes:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeGaussianSigmaForBlurRadius(radius, passes);
#elseif cpp
	return flight._cpp._fn.Effects.computeGaussianSigmaForBlurRadius(radius, passes);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeGaussianSigmaForBlurRadius(radius, passes);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createCameraMotionBlurEffect():Dynamic {
	return flight._js._fn.Effects.createCameraMotionBlurEffect();
}
#else
extern inline function createCameraMotionBlurEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createCameraMotionBlurEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createCameraMotionBlurEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createCameraMotionBlurEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createChromaticAberrationEffect():Dynamic {
	return flight._js._fn.Effects.createChromaticAberrationEffect();
}
#else
extern inline function createChromaticAberrationEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createChromaticAberrationEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createChromaticAberrationEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createChromaticAberrationEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeColorTemperatureRgb(out:Dynamic, kelvin:Float):Void {
	flight._js._fn.Effects.computeColorTemperatureRgb(out, kelvin);
}
#else
extern inline function computeColorTemperatureRgb(out:Dynamic, kelvin:Float):Void {
#if hl
	flight._hl._fn.Effects.computeColorTemperatureRgb(out, kelvin);
#elseif cpp
	flight._cpp._fn.Effects.computeColorTemperatureRgb(out, kelvin);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeColorTemperatureRgb(out, kelvin);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeWhiteBalanceMultipliers(out:Dynamic, temperature:Float, tint:Float):Void {
	flight._js._fn.Effects.computeWhiteBalanceMultipliers(out, temperature, tint);
}
#else
extern inline function computeWhiteBalanceMultipliers(out:Dynamic, temperature:Float, tint:Float):Void {
#if hl
	flight._hl._fn.Effects.computeWhiteBalanceMultipliers(out, temperature, tint);
#elseif cpp
	flight._cpp._fn.Effects.computeWhiteBalanceMultipliers(out, temperature, tint);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeWhiteBalanceMultipliers(out, temperature, tint);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createCompositeEffect():Dynamic {
	return flight._js._fn.Effects.createCompositeEffect();
}
#else
extern inline function createCompositeEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createCompositeEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createCompositeEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createCompositeEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCompositeOperatorFactors(out:Dynamic, operator_:String, sourceAlpha:Float, backdropAlpha:Float):Void {
	flight._js._fn.Effects.getCompositeOperatorFactors(out, operator_, sourceAlpha, backdropAlpha);
}
#else
extern inline function getCompositeOperatorFactors(out:Dynamic, outLen:Int, operator_:String, sourceAlpha:Float, backdropAlpha:Float):Void {
#if hl
	flight._hl._fn.Effects.getCompositeOperatorFactors(out, outLen, cast operator_, sourceAlpha, backdropAlpha);
#elseif cpp
	flight._cpp._fn.Effects.getCompositeOperatorFactors(out, outLen, cast operator_, sourceAlpha, backdropAlpha);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getCompositeOperatorFactors(out, outLen, operator_, sourceAlpha, backdropAlpha);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createContactShadowsEffect():Dynamic {
	return flight._js._fn.Effects.createContactShadowsEffect();
}
#else
extern inline function createContactShadowsEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createContactShadowsEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createContactShadowsEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createContactShadowsEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getContactShadowsEffectPadding(out:EffectPadding, effect:ContactShadowsEffect):Void {
	flight._js._fn.Effects.getContactShadowsEffectPadding(out, effect);
}
#else
extern inline function getContactShadowsEffectPadding(out:EffectPadding, effect:ContactShadowsEffect):Void {
#if hl
	flight._hl._fn.Effects.getContactShadowsEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getContactShadowsEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getContactShadowsEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createConvolutionEffect():Dynamic {
	return flight._js._fn.Effects.createConvolutionEffect();
}
#else
extern inline function createConvolutionEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createConvolutionEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createConvolutionEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createConvolutionEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getConvolutionEffectPadding(out:EffectPadding, effect:ConvolutionEffect):Void {
	flight._js._fn.Effects.getConvolutionEffectPadding(out, effect);
}
#else
extern inline function getConvolutionEffectPadding(out:EffectPadding, effect:ConvolutionEffect):Void {
#if hl
	flight._hl._fn.Effects.getConvolutionEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getConvolutionEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getConvolutionEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createCrtEffect():Dynamic {
	return flight._js._fn.Effects.createCrtEffect();
}
#else
extern inline function createCrtEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createCrtEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createCrtEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createCrtEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createCustomShaderEffect():Dynamic {
	return flight._js._fn.Effects.createCustomShaderEffect();
}
#else
extern inline function createCustomShaderEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createCustomShaderEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createCustomShaderEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createCustomShaderEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeDepthOfFieldCoc(depth:Float, focusDistance:Float, aperture:Float, focalLength:Float):Float {
	return flight._js._fn.Effects.computeDepthOfFieldCoc(depth, focusDistance, aperture, focalLength);
}
#else
extern inline function computeDepthOfFieldCoc(depth:Float, focusDistance:Float, aperture:Float, focalLength:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeDepthOfFieldCoc(depth, focusDistance, aperture, focalLength);
#elseif cpp
	return flight._cpp._fn.Effects.computeDepthOfFieldCoc(depth, focusDistance, aperture, focalLength);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeDepthOfFieldCoc(depth, focusDistance, aperture, focalLength);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeLinearDepthFromNonlinear(depth:Float, near:Float, far:Float):Float {
	return flight._js._fn.Effects.computeLinearDepthFromNonlinear(depth, near, far);
}
#else
extern inline function computeLinearDepthFromNonlinear(depth:Float, near:Float, far:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeLinearDepthFromNonlinear(depth, near, far);
#elseif cpp
	return flight._cpp._fn.Effects.computeLinearDepthFromNonlinear(depth, near, far);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeLinearDepthFromNonlinear(depth, near, far);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeSsaoSampleKernel(out:Dynamic, samples:Float):Int {
	return flight._js._fn.Effects.computeSsaoSampleKernel(out, samples);
}
#else
extern inline function computeSsaoSampleKernel(out:Dynamic, outLen:Int, samples:Float):Int {
#if hl
	return flight._hl._fn.Effects.computeSsaoSampleKernel(out, outLen, samples);
#elseif cpp
	return flight._cpp._fn.Effects.computeSsaoSampleKernel(out, outLen, samples);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeSsaoSampleKernel(out, outLen, samples);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createDirectionalBlurEffect():Dynamic {
	return flight._js._fn.Effects.createDirectionalBlurEffect();
}
#else
extern inline function createDirectionalBlurEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createDirectionalBlurEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createDirectionalBlurEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createDirectionalBlurEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDirectionalBlurEffectPadding(out:EffectPadding, effect:DirectionalBlurEffect):Void {
	flight._js._fn.Effects.getDirectionalBlurEffectPadding(out, effect);
}
#else
extern inline function getDirectionalBlurEffectPadding(out:EffectPadding, effect:DirectionalBlurEffect):Void {
#if hl
	flight._hl._fn.Effects.getDirectionalBlurEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getDirectionalBlurEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getDirectionalBlurEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createDisplacementEffect():Dynamic {
	return flight._js._fn.Effects.createDisplacementEffect();
}
#else
extern inline function createDisplacementEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createDisplacementEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createDisplacementEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createDisplacementEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDisplacementEffectPadding(out:EffectPadding, effect:DisplacementEffect):Void {
	flight._js._fn.Effects.getDisplacementEffectPadding(out, effect);
}
#else
extern inline function getDisplacementEffectPadding(out:EffectPadding, effect:DisplacementEffect):Void {
#if hl
	flight._hl._fn.Effects.getDisplacementEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getDisplacementEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getDisplacementEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createDitherEffect():Dynamic {
	return flight._js._fn.Effects.createDitherEffect();
}
#else
extern inline function createDitherEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createDitherEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createDitherEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createDitherEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createDropShadowEffect():Dynamic {
	return flight._js._fn.Effects.createDropShadowEffect();
}
#else
extern inline function createDropShadowEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createDropShadowEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createDropShadowEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createDropShadowEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDropShadowEffectPadding(out:EffectPadding, effect:DropShadowEffect):Void {
	flight._js._fn.Effects.getDropShadowEffectPadding(out, effect);
}
#else
extern inline function getDropShadowEffectPadding(out:EffectPadding, effect:DropShadowEffect):Void {
#if hl
	flight._hl._fn.Effects.getDropShadowEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getDropShadowEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getDropShadowEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeOutlineEdgeParams(out:Dynamic, effect:OutlineEffect):Void {
	flight._js._fn.Effects.computeOutlineEdgeParams(out, effect);
}
#else
extern inline function computeOutlineEdgeParams(out:Dynamic, effect:OutlineEffect):Void {
#if hl
	flight._hl._fn.Effects.computeOutlineEdgeParams(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.computeOutlineEdgeParams(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeOutlineEdgeParams(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeOutlineThicknessPx(effect:OutlineEffect):Float {
	return flight._js._fn.Effects.computeOutlineThicknessPx(effect);
}
#else
extern inline function computeOutlineThicknessPx(effect:OutlineEffect):Float {
#if hl
	return flight._hl._fn.Effects.computeOutlineThicknessPx(effect);
#elseif cpp
	return flight._cpp._fn.Effects.computeOutlineThicknessPx(effect);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeOutlineThicknessPx(effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeSketchEdgeParams(out:Dynamic, effect:SketchEffect):Void {
	flight._js._fn.Effects.computeSketchEdgeParams(out, effect);
}
#else
extern inline function computeSketchEdgeParams(out:Dynamic, effect:SketchEffect):Void {
#if hl
	flight._hl._fn.Effects.computeSketchEdgeParams(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.computeSketchEdgeParams(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeSketchEdgeParams(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSobelKernelCoefficients(out:Dynamic):Void {
	flight._js._fn.Effects.getSobelKernelCoefficients(out);
}
#else
extern inline function getSobelKernelCoefficients(out:Dynamic, outLen:Int):Void {
#if hl
	flight._hl._fn.Effects.getSobelKernelCoefficients(out, outLen);
#elseif cpp
	flight._cpp._fn.Effects.getSobelKernelCoefficients(out, outLen);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getSobelKernelCoefficients(out, outLen);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getEffectDefaults(out:EffectDefaults, kind:String):Void {
	flight._js._fn.Effects.getEffectDefaults(out, kind);
}
#else
extern inline function getEffectDefaults(out:EffectDefaults, kind:String):Void {
#if hl
	flight._hl._fn.Effects.getEffectDefaults(out, cast kind);
#elseif cpp
	flight._cpp._fn.Effects.getEffectDefaults(out, cast kind);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getEffectDefaults(out, kind);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeEffect(effect:EffectRef, out:EffectRef):Bool {
	return flight._js._fn.Effects.normalizeEffect(effect, out);
}
#else
extern inline function normalizeEffect(effect:EffectRef, out:EffectRef):Bool {
#if hl
	return flight._hl._fn.Effects.normalizeEffect(effect, out);
#elseif cpp
	return flight._cpp._fn.Effects.normalizeEffect(effect, out);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.normalizeEffect(effect, out);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function canLerpEffects(a:EffectRef, b:EffectRef):Bool {
	return flight._js._fn.Effects.canLerpEffects(a, b);
}
#else
extern inline function canLerpEffects(a:EffectRef, b:EffectRef):Bool {
#if hl
	return flight._hl._fn.Effects.canLerpEffects(a, b);
#elseif cpp
	return flight._cpp._fn.Effects.canLerpEffects(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.canLerpEffects(a, b);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDirectionalEffectPadding(out:EffectPadding, blurX:Float, blurY:Float, offsetX:Float, offsetY:Float):Void {
	flight._js._fn.Effects.getDirectionalEffectPadding(out, blurX, blurY, offsetX, offsetY);
}
#else
extern inline function getDirectionalEffectPadding(out:EffectPadding, blurX:Float, blurY:Float, offsetX:Float, offsetY:Float):Void {
#if hl
	flight._hl._fn.Effects.getDirectionalEffectPadding(out, blurX, blurY, offsetX, offsetY);
#elseif cpp
	flight._cpp._fn.Effects.getDirectionalEffectPadding(out, blurX, blurY, offsetX, offsetY);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getDirectionalEffectPadding(out, blurX, blurY, offsetX, offsetY);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGaussianEffectPadding(out:EffectPadding, blurX:Float, blurY:Float):Void {
	flight._js._fn.Effects.getGaussianEffectPadding(out, blurX, blurY);
}
#else
extern inline function getGaussianEffectPadding(out:EffectPadding, blurX:Float, blurY:Float):Void {
#if hl
	flight._hl._fn.Effects.getGaussianEffectPadding(out, blurX, blurY);
#elseif cpp
	flight._cpp._fn.Effects.getGaussianEffectPadding(out, blurX, blurY);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getGaussianEffectPadding(out, blurX, blurY);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function validateEffectList(effects:Dynamic, available:Dynamic):Null<Dynamic> {
	return flight._js._fn.Effects.validateEffectList(effects, available);
}
#else
extern inline function validateEffectList(effects:Dynamic, effectsLen:Int, available:Dynamic, availableLen:Int):Int {
#if hl
	return flight._hl._fn.Effects.validateEffectList(effects, effectsLen, available, availableLen);
#elseif cpp
	return flight._cpp._fn.Effects.validateEffectList(effects, effectsLen, available, availableLen);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.validateEffectList(effects, effectsLen, available, availableLen);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createFilmEmulationEffect():Dynamic {
	return flight._js._fn.Effects.createFilmEmulationEffect();
}
#else
extern inline function createFilmEmulationEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createFilmEmulationEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createFilmEmulationEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createFilmEmulationEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createFilmGrainEffect():Dynamic {
	return flight._js._fn.Effects.createFilmGrainEffect();
}
#else
extern inline function createFilmGrainEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createFilmGrainEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createFilmGrainEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createFilmGrainEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createFxaaEffect():Dynamic {
	return flight._js._fn.Effects.createFxaaEffect();
}
#else
extern inline function createFxaaEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createFxaaEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createFxaaEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createFxaaEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGaussianKernelWeights(out:Dynamic, sigma:Float):Void {
	flight._js._fn.Effects.computeGaussianKernelWeights(out, sigma);
}
#else
extern inline function computeGaussianKernelWeights(out:Dynamic, sigma:Float):Void {
#if hl
	flight._hl._fn.Effects.computeGaussianKernelWeights(out, sigma);
#elseif cpp
	flight._cpp._fn.Effects.computeGaussianKernelWeights(out, sigma);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeGaussianKernelWeights(out, sigma);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGaussianKernelSize(sigma:Float):Int {
	return flight._js._fn.Effects.getGaussianKernelSize(sigma);
}
#else
extern inline function getGaussianKernelSize(sigma:Float):Int {
#if hl
	return flight._hl._fn.Effects.getGaussianKernelSize(sigma);
#elseif cpp
	return flight._cpp._fn.Effects.getGaussianKernelSize(sigma);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.getGaussianKernelSize(sigma);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGaussianKernelWeights(out:Dynamic, radius:Float, sigma:Float):Int {
	return flight._js._fn.Effects.createGaussianKernelWeights(out, radius, sigma);
}
#else
extern inline function createGaussianKernelWeights(out:Dynamic, outLen:Int, radius:Float, sigma:Float):Int {
#if hl
	return flight._hl._fn.Effects.createGaussianKernelWeights(out, outLen, radius, sigma);
#elseif cpp
	return flight._cpp._fn.Effects.createGaussianKernelWeights(out, outLen, radius, sigma);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createGaussianKernelWeights(out, outLen, radius, sigma);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGaussianRadiusFromSigma(sigma:Float):Float {
	return flight._js._fn.Effects.computeGaussianRadiusFromSigma(sigma);
}
#else
extern inline function computeGaussianRadiusFromSigma(sigma:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeGaussianRadiusFromSigma(sigma);
#elseif cpp
	return flight._cpp._fn.Effects.computeGaussianRadiusFromSigma(sigma);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeGaussianRadiusFromSigma(sigma);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGaussianSigmaFromRadius(radius:Float):Float {
	return flight._js._fn.Effects.computeGaussianSigmaFromRadius(radius);
}
#else
extern inline function computeGaussianSigmaFromRadius(radius:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeGaussianSigmaFromRadius(radius);
#elseif cpp
	return flight._cpp._fn.Effects.computeGaussianSigmaFromRadius(radius);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeGaussianSigmaFromRadius(radius);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeSeparableBlurPassCount(samples:Null<Float>):Float {
	return flight._js._fn.Effects.computeSeparableBlurPassCount(samples);
}
#else
extern inline function computeSeparableBlurPassCount(samples:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeSeparableBlurPassCount(samples);
#elseif cpp
	return flight._cpp._fn.Effects.computeSeparableBlurPassCount(samples);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeSeparableBlurPassCount(samples);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGlitchEffect():Dynamic {
	return flight._js._fn.Effects.createGlitchEffect();
}
#else
extern inline function createGlitchEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createGlitchEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createGlitchEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createGlitchEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGlitchEffectPadding(out:EffectPadding, effect:GlitchEffect):Void {
	flight._js._fn.Effects.getGlitchEffectPadding(out, effect);
}
#else
extern inline function getGlitchEffectPadding(out:EffectPadding, effect:GlitchEffect):Void {
#if hl
	flight._hl._fn.Effects.getGlitchEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getGlitchEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getGlitchEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGodRaysEffect():Dynamic {
	return flight._js._fn.Effects.createGodRaysEffect();
}
#else
extern inline function createGodRaysEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createGodRaysEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createGodRaysEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createGodRaysEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGodRaysAccumulationScale(effect:GodRaysEffect):Float {
	return flight._js._fn.Effects.computeGodRaysAccumulationScale(effect);
}
#else
extern inline function computeGodRaysAccumulationScale(effect:GodRaysEffect):Float {
#if hl
	return flight._hl._fn.Effects.computeGodRaysAccumulationScale(effect);
#elseif cpp
	return flight._cpp._fn.Effects.computeGodRaysAccumulationScale(effect);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeGodRaysAccumulationScale(effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGodRaysLightCenter(out:Dynamic, effect:GodRaysEffect):Void {
	flight._js._fn.Effects.computeGodRaysLightCenter(out, effect);
}
#else
extern inline function computeGodRaysLightCenter(out:Dynamic, effect:GodRaysEffect):Void {
#if hl
	flight._hl._fn.Effects.computeGodRaysLightCenter(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.computeGodRaysLightCenter(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeGodRaysLightCenter(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGodRaysSampleWeight(effect:GodRaysEffect, sampleIndex:Float):Float {
	return flight._js._fn.Effects.computeGodRaysSampleWeight(effect, sampleIndex);
}
#else
extern inline function computeGodRaysSampleWeight(effect:GodRaysEffect, sampleIndex:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeGodRaysSampleWeight(effect, sampleIndex);
#elseif cpp
	return flight._cpp._fn.Effects.computeGodRaysSampleWeight(effect, sampleIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeGodRaysSampleWeight(effect, sampleIndex);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGodRaysStepSize(out:Dynamic, effect:GodRaysEffect, px:Float, py:Float):Void {
	flight._js._fn.Effects.computeGodRaysStepSize(out, effect, px, py);
}
#else
extern inline function computeGodRaysStepSize(out:Dynamic, effect:GodRaysEffect, px:Float, py:Float):Void {
#if hl
	flight._hl._fn.Effects.computeGodRaysStepSize(out, effect, px, py);
#elseif cpp
	flight._cpp._fn.Effects.computeGodRaysStepSize(out, effect, px, py);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeGodRaysStepSize(out, effect, px, py);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGradientBevelEffect():Dynamic {
	return flight._js._fn.Effects.createGradientBevelEffect();
}
#else
extern inline function createGradientBevelEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createGradientBevelEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createGradientBevelEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createGradientBevelEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGradientBevelEffectPadding(out:EffectPadding, effect:GradientBevelEffect):Void {
	flight._js._fn.Effects.getGradientBevelEffectPadding(out, effect);
}
#else
extern inline function getGradientBevelEffectPadding(out:EffectPadding, effect:GradientBevelEffect):Void {
#if hl
	flight._hl._fn.Effects.getGradientBevelEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getGradientBevelEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getGradientBevelEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGradientGlowEffect():Dynamic {
	return flight._js._fn.Effects.createGradientGlowEffect();
}
#else
extern inline function createGradientGlowEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createGradientGlowEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createGradientGlowEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createGradientGlowEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getGradientGlowEffectPadding(out:EffectPadding, effect:GradientGlowEffect):Void {
	flight._js._fn.Effects.getGradientGlowEffectPadding(out, effect);
}
#else
extern inline function getGradientGlowEffectPadding(out:EffectPadding, effect:GradientGlowEffect):Void {
#if hl
	flight._hl._fn.Effects.getGradientGlowEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getGradientGlowEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getGradientGlowEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createHalftoneEffect():Dynamic {
	return flight._js._fn.Effects.createHalftoneEffect();
}
#else
extern inline function createHalftoneEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createHalftoneEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createHalftoneEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createHalftoneEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInnerGlowEffect():Dynamic {
	return flight._js._fn.Effects.createInnerGlowEffect();
}
#else
extern inline function createInnerGlowEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createInnerGlowEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createInnerGlowEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createInnerGlowEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getInnerGlowEffectPadding(out:EffectPadding, effect:InnerGlowEffect):Void {
	flight._js._fn.Effects.getInnerGlowEffectPadding(out, effect);
}
#else
extern inline function getInnerGlowEffectPadding(out:EffectPadding, effect:InnerGlowEffect):Void {
#if hl
	flight._hl._fn.Effects.getInnerGlowEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getInnerGlowEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getInnerGlowEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInnerShadowEffect():Dynamic {
	return flight._js._fn.Effects.createInnerShadowEffect();
}
#else
extern inline function createInnerShadowEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createInnerShadowEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createInnerShadowEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createInnerShadowEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getInnerShadowEffectPadding(out:EffectPadding, effect:InnerShadowEffect):Void {
	flight._js._fn.Effects.getInnerShadowEffectPadding(out, effect);
}
#else
extern inline function getInnerShadowEffectPadding(out:EffectPadding, effect:InnerShadowEffect):Void {
#if hl
	flight._hl._fn.Effects.getInnerShadowEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getInnerShadowEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getInnerShadowEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createKuwaharaEffect():Dynamic {
	return flight._js._fn.Effects.createKuwaharaEffect();
}
#else
extern inline function createKuwaharaEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createKuwaharaEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createKuwaharaEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createKuwaharaEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeKuwaharaGaussianWeights(out:Dynamic, radius:Float):Int {
	return flight._js._fn.Effects.computeKuwaharaGaussianWeights(out, radius);
}
#else
extern inline function computeKuwaharaGaussianWeights(out:Dynamic, outLen:Int, radius:Float):Int {
#if hl
	return flight._hl._fn.Effects.computeKuwaharaGaussianWeights(out, outLen, radius);
#elseif cpp
	return flight._cpp._fn.Effects.computeKuwaharaGaussianWeights(out, outLen, radius);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeKuwaharaGaussianWeights(out, outLen, radius);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeKuwaharaSectorOffsets(out:Dynamic, radius:Float):Void {
	flight._js._fn.Effects.computeKuwaharaSectorOffsets(out, radius);
}
#else
extern inline function computeKuwaharaSectorOffsets(out:Dynamic, radius:Float):Void {
#if hl
	flight._hl._fn.Effects.computeKuwaharaSectorOffsets(out, radius);
#elseif cpp
	flight._cpp._fn.Effects.computeKuwaharaSectorOffsets(out, radius);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeKuwaharaSectorOffsets(out, radius);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeKuwaharaSectorPixelCount(effect:KuwaharaEffect):Int {
	return flight._js._fn.Effects.computeKuwaharaSectorPixelCount(effect);
}
#else
extern inline function computeKuwaharaSectorPixelCount(effect:KuwaharaEffect):Int {
#if hl
	return flight._hl._fn.Effects.computeKuwaharaSectorPixelCount(effect);
#elseif cpp
	return flight._cpp._fn.Effects.computeKuwaharaSectorPixelCount(effect);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeKuwaharaSectorPixelCount(effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeKuwaharaSectorSize(effect:KuwaharaEffect):Int {
	return flight._js._fn.Effects.computeKuwaharaSectorSize(effect);
}
#else
extern inline function computeKuwaharaSectorSize(effect:KuwaharaEffect):Int {
#if hl
	return flight._hl._fn.Effects.computeKuwaharaSectorSize(effect);
#elseif cpp
	return flight._cpp._fn.Effects.computeKuwaharaSectorSize(effect);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeKuwaharaSectorSize(effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLensDirtEffect():Dynamic {
	return flight._js._fn.Effects.createLensDirtEffect();
}
#else
extern inline function createLensDirtEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createLensDirtEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createLensDirtEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createLensDirtEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLensDistortionEffect():Dynamic {
	return flight._js._fn.Effects.createLensDistortionEffect();
}
#else
extern inline function createLensDistortionEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createLensDistortionEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createLensDistortionEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createLensDistortionEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLensFlareEffect():Dynamic {
	return flight._js._fn.Effects.createLensFlareEffect();
}
#else
extern inline function createLensFlareEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createLensFlareEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createLensFlareEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createLensFlareEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeLinearSampledGaussian(outWeights:Dynamic, outOffsets:Dynamic, sigma:Float):Void {
	flight._js._fn.Effects.computeLinearSampledGaussian(outWeights, outOffsets, sigma);
}
#else
extern inline function computeLinearSampledGaussian(outWeights:Dynamic, outOffsets:Dynamic, sigma:Float):Void {
#if hl
	flight._hl._fn.Effects.computeLinearSampledGaussian(outWeights, outOffsets, sigma);
#elseif cpp
	flight._cpp._fn.Effects.computeLinearSampledGaussian(outWeights, outOffsets, sigma);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeLinearSampledGaussian(outWeights, outOffsets, sigma);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLinearSampledGaussianTapCount(sigma:Float):Int {
	return flight._js._fn.Effects.getLinearSampledGaussianTapCount(sigma);
}
#else
extern inline function getLinearSampledGaussianTapCount(sigma:Float):Int {
#if hl
	return flight._hl._fn.Effects.getLinearSampledGaussianTapCount(sigma);
#elseif cpp
	return flight._cpp._fn.Effects.getLinearSampledGaussianTapCount(sigma);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.getLinearSampledGaussianTapCount(sigma);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMedianEffect():Dynamic {
	return flight._js._fn.Effects.createMedianEffect();
}
#else
extern inline function createMedianEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createMedianEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createMedianEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createMedianEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMedianEffectPadding(out:EffectPadding, effect:MedianEffect):Void {
	flight._js._fn.Effects.getMedianEffectPadding(out, effect);
}
#else
extern inline function getMedianEffectPadding(out:EffectPadding, effect:MedianEffect):Void {
#if hl
	flight._hl._fn.Effects.getMedianEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getMedianEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getMedianEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMotionBlurEffect():Dynamic {
	return flight._js._fn.Effects.createMotionBlurEffect();
}
#else
extern inline function createMotionBlurEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createMotionBlurEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createMotionBlurEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createMotionBlurEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createOuterGlowEffect():Dynamic {
	return flight._js._fn.Effects.createOuterGlowEffect();
}
#else
extern inline function createOuterGlowEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createOuterGlowEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createOuterGlowEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createOuterGlowEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getOuterGlowEffectPadding(out:EffectPadding, effect:OuterGlowEffect):Void {
	flight._js._fn.Effects.getOuterGlowEffectPadding(out, effect);
}
#else
extern inline function getOuterGlowEffectPadding(out:EffectPadding, effect:OuterGlowEffect):Void {
#if hl
	flight._hl._fn.Effects.getOuterGlowEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getOuterGlowEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getOuterGlowEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createOutlineEffect():Dynamic {
	return flight._js._fn.Effects.createOutlineEffect();
}
#else
extern inline function createOutlineEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createOutlineEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createOutlineEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createOutlineEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getOutlineEffectPadding(out:EffectPadding, effect:OutlineEffect):Void {
	flight._js._fn.Effects.getOutlineEffectPadding(out, effect);
}
#else
extern inline function getOutlineEffectPadding(out:EffectPadding, effect:OutlineEffect):Void {
#if hl
	flight._hl._fn.Effects.getOutlineEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getOutlineEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getOutlineEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPanniniProjectionEffect():Dynamic {
	return flight._js._fn.Effects.createPanniniProjectionEffect();
}
#else
extern inline function createPanniniProjectionEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createPanniniProjectionEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createPanniniProjectionEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createPanniniProjectionEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPixelateEffect():Dynamic {
	return flight._js._fn.Effects.createPixelateEffect();
}
#else
extern inline function createPixelateEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createPixelateEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createPixelateEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createPixelateEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPosterizeEffect():Dynamic {
	return flight._js._fn.Effects.createPosterizeEffect();
}
#else
extern inline function createPosterizeEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createPosterizeEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createPosterizeEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createPosterizeEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createRadialBlurEffect():Dynamic {
	return flight._js._fn.Effects.createRadialBlurEffect();
}
#else
extern inline function createRadialBlurEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createRadialBlurEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createRadialBlurEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createRadialBlurEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScanlinesEffect():Dynamic {
	return flight._js._fn.Effects.createScanlinesEffect();
}
#else
extern inline function createScanlinesEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createScanlinesEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createScanlinesEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createScanlinesEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScreenSpaceFogEffect():Dynamic {
	return flight._js._fn.Effects.createScreenSpaceFogEffect();
}
#else
extern inline function createScreenSpaceFogEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createScreenSpaceFogEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createScreenSpaceFogEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createScreenSpaceFogEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSharpenEffect():Dynamic {
	return flight._js._fn.Effects.createSharpenEffect();
}
#else
extern inline function createSharpenEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createSharpenEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createSharpenEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createSharpenEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSketchEffect():Dynamic {
	return flight._js._fn.Effects.createSketchEffect();
}
#else
extern inline function createSketchEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createSketchEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createSketchEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createSketchEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSmaaEffect():Dynamic {
	return flight._js._fn.Effects.createSmaaEffect();
}
#else
extern inline function createSmaaEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createSmaaEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createSmaaEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createSmaaEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSsaoEffect():Dynamic {
	return flight._js._fn.Effects.createSsaoEffect();
}
#else
extern inline function createSsaoEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createSsaoEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createSsaoEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createSsaoEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSsrEffect():Dynamic {
	return flight._js._fn.Effects.createSsrEffect();
}
#else
extern inline function createSsrEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createSsrEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createSsrEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createSsrEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBayerMatrix(out:Dynamic, order:Float):Int {
	return flight._js._fn.Effects.createBayerMatrix(out, order);
}
#else
extern inline function createBayerMatrix(out:Dynamic, outLen:Int, order:Float):Int {
#if hl
	return flight._hl._fn.Effects.createBayerMatrix(out, outLen, order);
#elseif cpp
	return flight._cpp._fn.Effects.createBayerMatrix(out, outLen, order);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createBayerMatrix(out, outLen, order);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeCrtMaskParams(out:Dynamic, resolution:Float, curvature:Float):Void {
	flight._js._fn.Effects.computeCrtMaskParams(out, resolution, curvature);
}
#else
extern inline function computeCrtMaskParams(out:Dynamic, resolution:Float, curvature:Float):Void {
#if hl
	flight._hl._fn.Effects.computeCrtMaskParams(out, resolution, curvature);
#elseif cpp
	flight._cpp._fn.Effects.computeCrtMaskParams(out, resolution, curvature);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeCrtMaskParams(out, resolution, curvature);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeHalftoneCellParams(out:Dynamic, frequency:Float, angle:Float):Void {
	flight._js._fn.Effects.computeHalftoneCellParams(out, frequency, angle);
}
#else
extern inline function computeHalftoneCellParams(out:Dynamic, frequency:Float, angle:Float):Void {
#if hl
	flight._hl._fn.Effects.computeHalftoneCellParams(out, frequency, angle);
#elseif cpp
	flight._cpp._fn.Effects.computeHalftoneCellParams(out, frequency, angle);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeHalftoneCellParams(out, frequency, angle);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeScanlineParams(out:Dynamic, resolution:Float, intensity:Float):Void {
	flight._js._fn.Effects.computeScanlineParams(out, resolution, intensity);
}
#else
extern inline function computeScanlineParams(out:Dynamic, resolution:Float, intensity:Float):Void {
#if hl
	flight._hl._fn.Effects.computeScanlineParams(out, resolution, intensity);
#elseif cpp
	flight._cpp._fn.Effects.computeScanlineParams(out, resolution, intensity);
#elseif (js && flight_esm)
	flight._js._fn.Effects.computeScanlineParams(out, resolution, intensity);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTaaEffect():Dynamic {
	return flight._js._fn.Effects.createTaaEffect();
}
#else
extern inline function createTaaEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createTaaEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createTaaEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createTaaEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTiltShiftEffect():Dynamic {
	return flight._js._fn.Effects.createTiltShiftEffect();
}
#else
extern inline function createTiltShiftEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createTiltShiftEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createTiltShiftEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createTiltShiftEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTiltShiftEffectPadding(out:EffectPadding, effect:TiltShiftEffect):Void {
	flight._js._fn.Effects.getTiltShiftEffectPadding(out, effect);
}
#else
extern inline function getTiltShiftEffectPadding(out:EffectPadding, effect:TiltShiftEffect):Void {
#if hl
	flight._hl._fn.Effects.getTiltShiftEffectPadding(out, effect);
#elseif cpp
	flight._cpp._fn.Effects.getTiltShiftEffectPadding(out, effect);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getTiltShiftEffectPadding(out, effect);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createToneMapEffect():Dynamic {
	return flight._js._fn.Effects.createToneMapEffect();
}
#else
extern inline function createToneMapEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createToneMapEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createToneMapEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createToneMapEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeAcesToneMap(x:Float):Float {
	return flight._js._fn.Effects.computeAcesToneMap(x);
}
#else
extern inline function computeAcesToneMap(x:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeAcesToneMap(x);
#elseif cpp
	return flight._cpp._fn.Effects.computeAcesToneMap(x);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeAcesToneMap(x);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeAgxToneMap(x:Float, options:Null<AgxToneMapOptions>):Float {
	return flight._js._fn.Effects.computeAgxToneMap(x, options);
}
#else
extern inline function computeAgxToneMap(x:Float, options:AgxToneMapOptions):Float {
#if hl
	return flight._hl._fn.Effects.computeAgxToneMap(x, options);
#elseif cpp
	return flight._cpp._fn.Effects.computeAgxToneMap(x, options);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeAgxToneMap(x, options);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeExposureScale(exposure:Float):Float {
	return flight._js._fn.Effects.computeExposureScale(exposure);
}
#else
extern inline function computeExposureScale(exposure:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeExposureScale(exposure);
#elseif cpp
	return flight._cpp._fn.Effects.computeExposureScale(exposure);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeExposureScale(exposure);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeFilmicToneMap(x:Float, options:Null<FilmicToneMapOptions>):Float {
	return flight._js._fn.Effects.computeFilmicToneMap(x, options);
}
#else
extern inline function computeFilmicToneMap(x:Float, options:FilmicToneMapOptions):Float {
#if hl
	return flight._hl._fn.Effects.computeFilmicToneMap(x, options);
#elseif cpp
	return flight._cpp._fn.Effects.computeFilmicToneMap(x, options);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeFilmicToneMap(x, options);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeReinhardExtendedToneMap(x:Float, white:Float):Float {
	return flight._js._fn.Effects.computeReinhardExtendedToneMap(x, white);
}
#else
extern inline function computeReinhardExtendedToneMap(x:Float, white:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeReinhardExtendedToneMap(x, white);
#elseif cpp
	return flight._cpp._fn.Effects.computeReinhardExtendedToneMap(x, white);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeReinhardExtendedToneMap(x, white);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeReinhardToneMap(x:Float):Float {
	return flight._js._fn.Effects.computeReinhardToneMap(x);
}
#else
extern inline function computeReinhardToneMap(x:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeReinhardToneMap(x);
#elseif cpp
	return flight._cpp._fn.Effects.computeReinhardToneMap(x);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeReinhardToneMap(x);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeUncharted2ToneMap(x:Float):Float {
	return flight._js._fn.Effects.computeUncharted2ToneMap(x);
}
#else
extern inline function computeUncharted2ToneMap(x:Float):Float {
#if hl
	return flight._hl._fn.Effects.computeUncharted2ToneMap(x);
#elseif cpp
	return flight._cpp._fn.Effects.computeUncharted2ToneMap(x);
#elseif (js && flight_esm)
	return flight._js._fn.Effects.computeUncharted2ToneMap(x);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAcesInputMatrix(out:Dynamic):Void {
	flight._js._fn.Effects.getAcesInputMatrix(out);
}
#else
extern inline function getAcesInputMatrix(out:Dynamic, outLen:Int):Void {
#if hl
	flight._hl._fn.Effects.getAcesInputMatrix(out, outLen);
#elseif cpp
	flight._cpp._fn.Effects.getAcesInputMatrix(out, outLen);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getAcesInputMatrix(out, outLen);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAcesOutputMatrix(out:Dynamic):Void {
	flight._js._fn.Effects.getAcesOutputMatrix(out);
}
#else
extern inline function getAcesOutputMatrix(out:Dynamic, outLen:Int):Void {
#if hl
	flight._hl._fn.Effects.getAcesOutputMatrix(out, outLen);
#elseif cpp
	flight._cpp._fn.Effects.getAcesOutputMatrix(out, outLen);
#elseif (js && flight_esm)
	flight._js._fn.Effects.getAcesOutputMatrix(out, outLen);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createVignetteEffect():Dynamic {
	return flight._js._fn.Effects.createVignetteEffect();
}
#else
extern inline function createVignetteEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createVignetteEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createVignetteEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createVignetteEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createVolumetricLightEffect():Dynamic {
	return flight._js._fn.Effects.createVolumetricLightEffect();
}
#else
extern inline function createVolumetricLightEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createVolumetricLightEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createVolumetricLightEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createVolumetricLightEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createWhiteBalanceEffect():Dynamic {
	return flight._js._fn.Effects.createWhiteBalanceEffect();
}
#else
extern inline function createWhiteBalanceEffect():Dynamic {
#if hl
	return flight._hl._fn.Effects.createWhiteBalanceEffect();
#elseif cpp
	return flight._cpp._fn.Effects.createWhiteBalanceEffect();
#elseif (js && flight_esm)
	return flight._js._fn.Effects.createWhiteBalanceEffect();
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAutoExposureEffectRef(ptr:AutoExposureEffect):Void {
	flight._js._fn.Effects.freeAutoExposureEffectRef(ptr);
}
#else
extern inline function freeAutoExposureEffectRef(ptr:AutoExposureEffect):Void {
#if hl
	flight._hl._fn.Effects.freeAutoExposureEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeAutoExposureEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeAutoExposureEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBarrelDistortionEffectRef(ptr:BarrelDistortionEffect):Void {
	flight._js._fn.Effects.freeBarrelDistortionEffectRef(ptr);
}
#else
extern inline function freeBarrelDistortionEffectRef(ptr:BarrelDistortionEffect):Void {
#if hl
	flight._hl._fn.Effects.freeBarrelDistortionEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeBarrelDistortionEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeBarrelDistortionEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBevelEffectRef(ptr:BevelEffect):Void {
	flight._js._fn.Effects.freeBevelEffectRef(ptr);
}
#else
extern inline function freeBevelEffectRef(ptr:BevelEffect):Void {
#if hl
	flight._hl._fn.Effects.freeBevelEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeBevelEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeBevelEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBitmapDisplacementEffectRef(ptr:BitmapDisplacementEffect):Void {
	flight._js._fn.Effects.freeBitmapDisplacementEffectRef(ptr);
}
#else
extern inline function freeBitmapDisplacementEffectRef(ptr:BitmapDisplacementEffect):Void {
#if hl
	flight._hl._fn.Effects.freeBitmapDisplacementEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeBitmapDisplacementEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeBitmapDisplacementEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBlendEffectRef(ptr:BlendEffect):Void {
	flight._js._fn.Effects.freeBlendEffectRef(ptr);
}
#else
extern inline function freeBlendEffectRef(ptr:BlendEffect):Void {
#if hl
	flight._hl._fn.Effects.freeBlendEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeBlendEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeBlendEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBloomEffectRef(ptr:BloomEffect):Void {
	flight._js._fn.Effects.freeBloomEffectRef(ptr);
}
#else
extern inline function freeBloomEffectRef(ptr:BloomEffect):Void {
#if hl
	flight._hl._fn.Effects.freeBloomEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeBloomEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeBloomEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBlurEffectRef(ptr:BlurEffect):Void {
	flight._js._fn.Effects.freeBlurEffectRef(ptr);
}
#else
extern inline function freeBlurEffectRef(ptr:BlurEffect):Void {
#if hl
	flight._hl._fn.Effects.freeBlurEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeBlurEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeBlurEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBokehDepthOfFieldEffectRef(ptr:BokehDepthOfFieldEffect):Void {
	flight._js._fn.Effects.freeBokehDepthOfFieldEffectRef(ptr);
}
#else
extern inline function freeBokehDepthOfFieldEffectRef(ptr:BokehDepthOfFieldEffect):Void {
#if hl
	flight._hl._fn.Effects.freeBokehDepthOfFieldEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeBokehDepthOfFieldEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeBokehDepthOfFieldEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCameraMotionBlurEffectRef(ptr:CameraMotionBlurEffect):Void {
	flight._js._fn.Effects.freeCameraMotionBlurEffectRef(ptr);
}
#else
extern inline function freeCameraMotionBlurEffectRef(ptr:CameraMotionBlurEffect):Void {
#if hl
	flight._hl._fn.Effects.freeCameraMotionBlurEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeCameraMotionBlurEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeCameraMotionBlurEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeChromaticAberrationEffectRef(ptr:ChromaticAberrationEffect):Void {
	flight._js._fn.Effects.freeChromaticAberrationEffectRef(ptr);
}
#else
extern inline function freeChromaticAberrationEffectRef(ptr:ChromaticAberrationEffect):Void {
#if hl
	flight._hl._fn.Effects.freeChromaticAberrationEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeChromaticAberrationEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeChromaticAberrationEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCompositeEffectRef(ptr:CompositeEffect):Void {
	flight._js._fn.Effects.freeCompositeEffectRef(ptr);
}
#else
extern inline function freeCompositeEffectRef(ptr:CompositeEffect):Void {
#if hl
	flight._hl._fn.Effects.freeCompositeEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeCompositeEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeCompositeEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeContactShadowsEffectRef(ptr:ContactShadowsEffect):Void {
	flight._js._fn.Effects.freeContactShadowsEffectRef(ptr);
}
#else
extern inline function freeContactShadowsEffectRef(ptr:ContactShadowsEffect):Void {
#if hl
	flight._hl._fn.Effects.freeContactShadowsEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeContactShadowsEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeContactShadowsEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeConvolutionEffectRef(ptr:ConvolutionEffect):Void {
	flight._js._fn.Effects.freeConvolutionEffectRef(ptr);
}
#else
extern inline function freeConvolutionEffectRef(ptr:ConvolutionEffect):Void {
#if hl
	flight._hl._fn.Effects.freeConvolutionEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeConvolutionEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeConvolutionEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCrtEffectRef(ptr:CrtEffect):Void {
	flight._js._fn.Effects.freeCrtEffectRef(ptr);
}
#else
extern inline function freeCrtEffectRef(ptr:CrtEffect):Void {
#if hl
	flight._hl._fn.Effects.freeCrtEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeCrtEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeCrtEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCustomShaderEffectRef(ptr:CustomShaderEffect):Void {
	flight._js._fn.Effects.freeCustomShaderEffectRef(ptr);
}
#else
extern inline function freeCustomShaderEffectRef(ptr:CustomShaderEffect):Void {
#if hl
	flight._hl._fn.Effects.freeCustomShaderEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeCustomShaderEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeCustomShaderEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDirectionalBlurEffectRef(ptr:DirectionalBlurEffect):Void {
	flight._js._fn.Effects.freeDirectionalBlurEffectRef(ptr);
}
#else
extern inline function freeDirectionalBlurEffectRef(ptr:DirectionalBlurEffect):Void {
#if hl
	flight._hl._fn.Effects.freeDirectionalBlurEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeDirectionalBlurEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeDirectionalBlurEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDisplacementEffectRef(ptr:DisplacementEffect):Void {
	flight._js._fn.Effects.freeDisplacementEffectRef(ptr);
}
#else
extern inline function freeDisplacementEffectRef(ptr:DisplacementEffect):Void {
#if hl
	flight._hl._fn.Effects.freeDisplacementEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeDisplacementEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeDisplacementEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDitherEffectRef(ptr:DitherEffect):Void {
	flight._js._fn.Effects.freeDitherEffectRef(ptr);
}
#else
extern inline function freeDitherEffectRef(ptr:DitherEffect):Void {
#if hl
	flight._hl._fn.Effects.freeDitherEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeDitherEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeDitherEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDropShadowEffectRef(ptr:DropShadowEffect):Void {
	flight._js._fn.Effects.freeDropShadowEffectRef(ptr);
}
#else
extern inline function freeDropShadowEffectRef(ptr:DropShadowEffect):Void {
#if hl
	flight._hl._fn.Effects.freeDropShadowEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeDropShadowEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeDropShadowEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFilmEmulationEffectRef(ptr:FilmEmulationEffect):Void {
	flight._js._fn.Effects.freeFilmEmulationEffectRef(ptr);
}
#else
extern inline function freeFilmEmulationEffectRef(ptr:FilmEmulationEffect):Void {
#if hl
	flight._hl._fn.Effects.freeFilmEmulationEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeFilmEmulationEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeFilmEmulationEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFilmGrainEffectRef(ptr:FilmGrainEffect):Void {
	flight._js._fn.Effects.freeFilmGrainEffectRef(ptr);
}
#else
extern inline function freeFilmGrainEffectRef(ptr:FilmGrainEffect):Void {
#if hl
	flight._hl._fn.Effects.freeFilmGrainEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeFilmGrainEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeFilmGrainEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFxaaEffectRef(ptr:FxaaEffect):Void {
	flight._js._fn.Effects.freeFxaaEffectRef(ptr);
}
#else
extern inline function freeFxaaEffectRef(ptr:FxaaEffect):Void {
#if hl
	flight._hl._fn.Effects.freeFxaaEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeFxaaEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeFxaaEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGlitchEffectRef(ptr:GlitchEffect):Void {
	flight._js._fn.Effects.freeGlitchEffectRef(ptr);
}
#else
extern inline function freeGlitchEffectRef(ptr:GlitchEffect):Void {
#if hl
	flight._hl._fn.Effects.freeGlitchEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeGlitchEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeGlitchEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGodRaysEffectRef(ptr:GodRaysEffect):Void {
	flight._js._fn.Effects.freeGodRaysEffectRef(ptr);
}
#else
extern inline function freeGodRaysEffectRef(ptr:GodRaysEffect):Void {
#if hl
	flight._hl._fn.Effects.freeGodRaysEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeGodRaysEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeGodRaysEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGradientBevelEffectRef(ptr:GradientBevelEffect):Void {
	flight._js._fn.Effects.freeGradientBevelEffectRef(ptr);
}
#else
extern inline function freeGradientBevelEffectRef(ptr:GradientBevelEffect):Void {
#if hl
	flight._hl._fn.Effects.freeGradientBevelEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeGradientBevelEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeGradientBevelEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGradientGlowEffectRef(ptr:GradientGlowEffect):Void {
	flight._js._fn.Effects.freeGradientGlowEffectRef(ptr);
}
#else
extern inline function freeGradientGlowEffectRef(ptr:GradientGlowEffect):Void {
#if hl
	flight._hl._fn.Effects.freeGradientGlowEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeGradientGlowEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeGradientGlowEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeHalftoneEffectRef(ptr:HalftoneEffect):Void {
	flight._js._fn.Effects.freeHalftoneEffectRef(ptr);
}
#else
extern inline function freeHalftoneEffectRef(ptr:HalftoneEffect):Void {
#if hl
	flight._hl._fn.Effects.freeHalftoneEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeHalftoneEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeHalftoneEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInnerGlowEffectRef(ptr:InnerGlowEffect):Void {
	flight._js._fn.Effects.freeInnerGlowEffectRef(ptr);
}
#else
extern inline function freeInnerGlowEffectRef(ptr:InnerGlowEffect):Void {
#if hl
	flight._hl._fn.Effects.freeInnerGlowEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeInnerGlowEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeInnerGlowEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInnerShadowEffectRef(ptr:InnerShadowEffect):Void {
	flight._js._fn.Effects.freeInnerShadowEffectRef(ptr);
}
#else
extern inline function freeInnerShadowEffectRef(ptr:InnerShadowEffect):Void {
#if hl
	flight._hl._fn.Effects.freeInnerShadowEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeInnerShadowEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeInnerShadowEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeKuwaharaEffectRef(ptr:KuwaharaEffect):Void {
	flight._js._fn.Effects.freeKuwaharaEffectRef(ptr);
}
#else
extern inline function freeKuwaharaEffectRef(ptr:KuwaharaEffect):Void {
#if hl
	flight._hl._fn.Effects.freeKuwaharaEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeKuwaharaEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeKuwaharaEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLensDirtEffectRef(ptr:LensDirtEffect):Void {
	flight._js._fn.Effects.freeLensDirtEffectRef(ptr);
}
#else
extern inline function freeLensDirtEffectRef(ptr:LensDirtEffect):Void {
#if hl
	flight._hl._fn.Effects.freeLensDirtEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeLensDirtEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeLensDirtEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLensDistortionEffectRef(ptr:LensDistortionEffect):Void {
	flight._js._fn.Effects.freeLensDistortionEffectRef(ptr);
}
#else
extern inline function freeLensDistortionEffectRef(ptr:LensDistortionEffect):Void {
#if hl
	flight._hl._fn.Effects.freeLensDistortionEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeLensDistortionEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeLensDistortionEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLensFlareEffectRef(ptr:LensFlareEffect):Void {
	flight._js._fn.Effects.freeLensFlareEffectRef(ptr);
}
#else
extern inline function freeLensFlareEffectRef(ptr:LensFlareEffect):Void {
#if hl
	flight._hl._fn.Effects.freeLensFlareEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeLensFlareEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeLensFlareEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMedianEffectRef(ptr:MedianEffect):Void {
	flight._js._fn.Effects.freeMedianEffectRef(ptr);
}
#else
extern inline function freeMedianEffectRef(ptr:MedianEffect):Void {
#if hl
	flight._hl._fn.Effects.freeMedianEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeMedianEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeMedianEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMotionBlurEffectRef(ptr:MotionBlurEffect):Void {
	flight._js._fn.Effects.freeMotionBlurEffectRef(ptr);
}
#else
extern inline function freeMotionBlurEffectRef(ptr:MotionBlurEffect):Void {
#if hl
	flight._hl._fn.Effects.freeMotionBlurEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeMotionBlurEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeMotionBlurEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeOuterGlowEffectRef(ptr:OuterGlowEffect):Void {
	flight._js._fn.Effects.freeOuterGlowEffectRef(ptr);
}
#else
extern inline function freeOuterGlowEffectRef(ptr:OuterGlowEffect):Void {
#if hl
	flight._hl._fn.Effects.freeOuterGlowEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeOuterGlowEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeOuterGlowEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeOutlineEffectRef(ptr:OutlineEffect):Void {
	flight._js._fn.Effects.freeOutlineEffectRef(ptr);
}
#else
extern inline function freeOutlineEffectRef(ptr:OutlineEffect):Void {
#if hl
	flight._hl._fn.Effects.freeOutlineEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeOutlineEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeOutlineEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePanniniProjectionEffectRef(ptr:PanniniProjectionEffect):Void {
	flight._js._fn.Effects.freePanniniProjectionEffectRef(ptr);
}
#else
extern inline function freePanniniProjectionEffectRef(ptr:PanniniProjectionEffect):Void {
#if hl
	flight._hl._fn.Effects.freePanniniProjectionEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freePanniniProjectionEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freePanniniProjectionEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePixelateEffectRef(ptr:PixelateEffect):Void {
	flight._js._fn.Effects.freePixelateEffectRef(ptr);
}
#else
extern inline function freePixelateEffectRef(ptr:PixelateEffect):Void {
#if hl
	flight._hl._fn.Effects.freePixelateEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freePixelateEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freePixelateEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePosterizeEffectRef(ptr:PosterizeEffect):Void {
	flight._js._fn.Effects.freePosterizeEffectRef(ptr);
}
#else
extern inline function freePosterizeEffectRef(ptr:PosterizeEffect):Void {
#if hl
	flight._hl._fn.Effects.freePosterizeEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freePosterizeEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freePosterizeEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRadialBlurEffectRef(ptr:RadialBlurEffect):Void {
	flight._js._fn.Effects.freeRadialBlurEffectRef(ptr);
}
#else
extern inline function freeRadialBlurEffectRef(ptr:RadialBlurEffect):Void {
#if hl
	flight._hl._fn.Effects.freeRadialBlurEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeRadialBlurEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeRadialBlurEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScanlinesEffectRef(ptr:ScanlinesEffect):Void {
	flight._js._fn.Effects.freeScanlinesEffectRef(ptr);
}
#else
extern inline function freeScanlinesEffectRef(ptr:ScanlinesEffect):Void {
#if hl
	flight._hl._fn.Effects.freeScanlinesEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeScanlinesEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeScanlinesEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScreenSpaceFogEffectRef(ptr:ScreenSpaceFogEffect):Void {
	flight._js._fn.Effects.freeScreenSpaceFogEffectRef(ptr);
}
#else
extern inline function freeScreenSpaceFogEffectRef(ptr:ScreenSpaceFogEffect):Void {
#if hl
	flight._hl._fn.Effects.freeScreenSpaceFogEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeScreenSpaceFogEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeScreenSpaceFogEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSharpenEffectRef(ptr:SharpenEffect):Void {
	flight._js._fn.Effects.freeSharpenEffectRef(ptr);
}
#else
extern inline function freeSharpenEffectRef(ptr:SharpenEffect):Void {
#if hl
	flight._hl._fn.Effects.freeSharpenEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeSharpenEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeSharpenEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSketchEffectRef(ptr:SketchEffect):Void {
	flight._js._fn.Effects.freeSketchEffectRef(ptr);
}
#else
extern inline function freeSketchEffectRef(ptr:SketchEffect):Void {
#if hl
	flight._hl._fn.Effects.freeSketchEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeSketchEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeSketchEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSmaaEffectRef(ptr:SmaaEffect):Void {
	flight._js._fn.Effects.freeSmaaEffectRef(ptr);
}
#else
extern inline function freeSmaaEffectRef(ptr:SmaaEffect):Void {
#if hl
	flight._hl._fn.Effects.freeSmaaEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeSmaaEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeSmaaEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSsaoEffectRef(ptr:SsaoEffect):Void {
	flight._js._fn.Effects.freeSsaoEffectRef(ptr);
}
#else
extern inline function freeSsaoEffectRef(ptr:SsaoEffect):Void {
#if hl
	flight._hl._fn.Effects.freeSsaoEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeSsaoEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeSsaoEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSsrEffectRef(ptr:SsrEffect):Void {
	flight._js._fn.Effects.freeSsrEffectRef(ptr);
}
#else
extern inline function freeSsrEffectRef(ptr:SsrEffect):Void {
#if hl
	flight._hl._fn.Effects.freeSsrEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeSsrEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeSsrEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTaaEffectRef(ptr:TaaEffect):Void {
	flight._js._fn.Effects.freeTaaEffectRef(ptr);
}
#else
extern inline function freeTaaEffectRef(ptr:TaaEffect):Void {
#if hl
	flight._hl._fn.Effects.freeTaaEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeTaaEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeTaaEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTiltShiftEffectRef(ptr:TiltShiftEffect):Void {
	flight._js._fn.Effects.freeTiltShiftEffectRef(ptr);
}
#else
extern inline function freeTiltShiftEffectRef(ptr:TiltShiftEffect):Void {
#if hl
	flight._hl._fn.Effects.freeTiltShiftEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeTiltShiftEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeTiltShiftEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeToneMapEffectRef(ptr:ToneMapEffect):Void {
	flight._js._fn.Effects.freeToneMapEffectRef(ptr);
}
#else
extern inline function freeToneMapEffectRef(ptr:ToneMapEffect):Void {
#if hl
	flight._hl._fn.Effects.freeToneMapEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeToneMapEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeToneMapEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeVignetteEffectRef(ptr:VignetteEffect):Void {
	flight._js._fn.Effects.freeVignetteEffectRef(ptr);
}
#else
extern inline function freeVignetteEffectRef(ptr:VignetteEffect):Void {
#if hl
	flight._hl._fn.Effects.freeVignetteEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeVignetteEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeVignetteEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeVolumetricLightEffectRef(ptr:VolumetricLightEffect):Void {
	flight._js._fn.Effects.freeVolumetricLightEffectRef(ptr);
}
#else
extern inline function freeVolumetricLightEffectRef(ptr:VolumetricLightEffect):Void {
#if hl
	flight._hl._fn.Effects.freeVolumetricLightEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeVolumetricLightEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeVolumetricLightEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeWhiteBalanceEffectRef(ptr:WhiteBalanceEffect):Void {
	flight._js._fn.Effects.freeWhiteBalanceEffectRef(ptr);
}
#else
extern inline function freeWhiteBalanceEffectRef(ptr:WhiteBalanceEffect):Void {
#if hl
	flight._hl._fn.Effects.freeWhiteBalanceEffectRef(ptr);
#elseif cpp
	flight._cpp._fn.Effects.freeWhiteBalanceEffectRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Effects.freeWhiteBalanceEffectRef(ptr);
#else
	#error "flight.Effects: no backend for this target."
#end
}
#end
