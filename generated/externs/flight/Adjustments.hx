package flight;

#if (js && flight_esm)
extern inline function createBrightnessContrastAdjustment(options:Null<BrightnessContrastAdjustmentOptions>):BrightnessContrastAdjustment {
	return flight._js._fn.Adjustments.createBrightnessContrastAdjustment(options);
}
#else
extern inline function createBrightnessContrastAdjustment(options:BrightnessContrastAdjustmentOptions):BrightnessContrastAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createBrightnessContrastAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createBrightnessContrastAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createBrightnessContrastAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createChannelMixerAdjustment(options:Null<ChannelMixerAdjustmentOptions>):ChannelMixerAdjustment {
	return flight._js._fn.Adjustments.createChannelMixerAdjustment(options);
}
#else
extern inline function createChannelMixerAdjustment(options:ChannelMixerAdjustmentOptions):ChannelMixerAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createChannelMixerAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createChannelMixerAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createChannelMixerAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAffineColorMatrix(matrix:Dynamic):Bool {
	return flight._js._fn.Adjustments.isAffineColorMatrix(matrix);
}
#else
extern inline function isAffineColorMatrix(matrix:Dynamic):Bool {
#if hl
	return flight._hl._fn.Adjustments.isAffineColorMatrix(matrix);
#elseif cpp
	return flight._cpp._fn.Adjustments.isAffineColorMatrix(matrix);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isAffineColorMatrix(matrix);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createColorBlindSimulationAdjustment(options:Null<ColorBlindSimulationAdjustmentOptions>):ColorBlindSimulationAdjustment {
	return flight._js._fn.Adjustments.createColorBlindSimulationAdjustment(options);
}
#else
extern inline function createColorBlindSimulationAdjustment(options:ColorBlindSimulationAdjustmentOptions):ColorBlindSimulationAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createColorBlindSimulationAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createColorBlindSimulationAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createColorBlindSimulationAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createColorGradeAdjustment(options:Null<ColorGradeAdjustmentOptions>):ColorGradeAdjustment {
	return flight._js._fn.Adjustments.createColorGradeAdjustment(options);
}
#else
extern inline function createColorGradeAdjustment(options:ColorGradeAdjustmentOptions):ColorGradeAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createColorGradeAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createColorGradeAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createColorGradeAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function bakeColorLut(transforms:Dynamic, size:Null<Int>):ColorLut {
	return flight._js._fn.Adjustments.bakeColorLut(transforms, size);
}
#else
extern inline function bakeColorLut(transforms:Dynamic, transformsLen:Int, size:haxe.Int64):ColorLut {
#if hl
	return flight._hl._fn.Adjustments.bakeColorLut(transforms, transformsLen, size);
#elseif cpp
	return flight._cpp._fn.Adjustments.bakeColorLut(transforms, transformsLen, size);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.bakeColorLut(transforms, transformsLen, size);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sampleColorLut(lut:ColorLut, out:Dynamic, r:Float, g:Float, b:Float):Void {
	flight._js._fn.Adjustments.sampleColorLut(lut, out, r, g, b);
}
#else
extern inline function sampleColorLut(lut:ColorLut, out:Dynamic, r:Float, g:Float, b:Float):Void {
#if hl
	flight._hl._fn.Adjustments.sampleColorLut(lut, out, r, g, b);
#elseif cpp
	flight._cpp._fn.Adjustments.sampleColorLut(lut, out, r, g, b);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.sampleColorLut(lut, out, r, g, b);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformBrightnessContrastAdjustment(operation:BrightnessContrastAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformBrightnessContrastAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformBrightnessContrastAdjustment(operation:BrightnessContrastAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformBrightnessContrastAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformBrightnessContrastAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformBrightnessContrastAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformChannelMixerAdjustment(operation:ChannelMixerAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformChannelMixerAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformChannelMixerAdjustment(operation:ChannelMixerAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformChannelMixerAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformChannelMixerAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformChannelMixerAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformColorBlindSimulationAdjustment(operation:ColorBlindSimulationAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorBlindSimulationAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformColorBlindSimulationAdjustment(operation:ColorBlindSimulationAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformColorBlindSimulationAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformColorBlindSimulationAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorBlindSimulationAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformColorGradeAdjustment(operation:ColorGradeAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorGradeAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformColorGradeAdjustment(operation:ColorGradeAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformColorGradeAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformColorGradeAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorGradeAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformColorMatrixAdjustment(operation:ColorMatrixAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorMatrixAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformColorMatrixAdjustment(operation:ColorMatrixAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformColorMatrixAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformColorMatrixAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorMatrixAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformColorScaleBiasAdjustment(operation:ColorScaleBiasAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorScaleBiasAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformColorScaleBiasAdjustment(operation:ColorScaleBiasAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformColorScaleBiasAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformColorScaleBiasAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformColorScaleBiasAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformExposureAdjustment(operation:ExposureAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformExposureAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformExposureAdjustment(operation:ExposureAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformExposureAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformExposureAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformExposureAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformGrayscaleAdjustment(operation:GrayscaleAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformGrayscaleAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformGrayscaleAdjustment(operation:GrayscaleAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformGrayscaleAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformGrayscaleAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformGrayscaleAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformHueSaturationAdjustment(operation:HueSaturationAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformHueSaturationAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformHueSaturationAdjustment(operation:HueSaturationAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformHueSaturationAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformHueSaturationAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformHueSaturationAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformInvertAdjustment(operation:InvertAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformInvertAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformInvertAdjustment(operation:InvertAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformInvertAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformInvertAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformInvertAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformLiftGammaGainAdjustment(operation:LiftGammaGainAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformLiftGammaGainAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformLiftGammaGainAdjustment(operation:LiftGammaGainAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformLiftGammaGainAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformLiftGammaGainAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformLiftGammaGainAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformLookupTableGradeAdjustment(operation:LookupTableGradeAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformLookupTableGradeAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformLookupTableGradeAdjustment(operation:LookupTableGradeAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformLookupTableGradeAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformLookupTableGradeAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformLookupTableGradeAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformSepiaAdjustment(operation:SepiaAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformSepiaAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformSepiaAdjustment(operation:SepiaAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformSepiaAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformSepiaAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformSepiaAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAdjustmentColorTransformTintAdjustment(operation:TintAdjustment):Null<ColorTransformFunction> {
	return flight._js._fn.Adjustments.getAdjustmentColorTransformTintAdjustment(operation);
}
#else
extern inline function getAdjustmentColorTransformTintAdjustment(operation:TintAdjustment):ColorTransformFunction {
#if hl
	return flight._hl._fn.Adjustments.getAdjustmentColorTransformTintAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.getAdjustmentColorTransformTintAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.getAdjustmentColorTransformTintAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentBrightnessContrastAdjustment(operation:BrightnessContrastAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentBrightnessContrastAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentBrightnessContrastAdjustment(operation:BrightnessContrastAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentBrightnessContrastAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentBrightnessContrastAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentBrightnessContrastAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentChannelMixerAdjustment(operation:ChannelMixerAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentChannelMixerAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentChannelMixerAdjustment(operation:ChannelMixerAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentChannelMixerAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentChannelMixerAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentChannelMixerAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentColorBlindSimulationAdjustment(operation:ColorBlindSimulationAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorBlindSimulationAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentColorBlindSimulationAdjustment(operation:ColorBlindSimulationAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentColorBlindSimulationAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentColorBlindSimulationAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorBlindSimulationAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentColorGradeAdjustment(operation:ColorGradeAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorGradeAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentColorGradeAdjustment(operation:ColorGradeAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentColorGradeAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentColorGradeAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorGradeAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentColorMatrixAdjustment(operation:ColorMatrixAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorMatrixAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentColorMatrixAdjustment(operation:ColorMatrixAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentColorMatrixAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentColorMatrixAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorMatrixAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentColorScaleBiasAdjustment(operation:ColorScaleBiasAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorScaleBiasAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentColorScaleBiasAdjustment(operation:ColorScaleBiasAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentColorScaleBiasAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentColorScaleBiasAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentColorScaleBiasAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentExposureAdjustment(operation:ExposureAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentExposureAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentExposureAdjustment(operation:ExposureAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentExposureAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentExposureAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentExposureAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentGrayscaleAdjustment(operation:GrayscaleAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentGrayscaleAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentGrayscaleAdjustment(operation:GrayscaleAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentGrayscaleAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentGrayscaleAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentGrayscaleAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentHueSaturationAdjustment(operation:HueSaturationAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentHueSaturationAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentHueSaturationAdjustment(operation:HueSaturationAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentHueSaturationAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentHueSaturationAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentHueSaturationAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentInvertAdjustment(operation:InvertAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentInvertAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentInvertAdjustment(operation:InvertAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentInvertAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentInvertAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentInvertAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentLiftGammaGainAdjustment(operation:LiftGammaGainAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentLiftGammaGainAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentLiftGammaGainAdjustment(operation:LiftGammaGainAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentLiftGammaGainAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentLiftGammaGainAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentLiftGammaGainAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentLookupTableGradeAdjustment(operation:LookupTableGradeAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentLookupTableGradeAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentLookupTableGradeAdjustment(operation:LookupTableGradeAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentLookupTableGradeAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentLookupTableGradeAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentLookupTableGradeAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentSepiaAdjustment(operation:SepiaAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentSepiaAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentSepiaAdjustment(operation:SepiaAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentSepiaAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentSepiaAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentSepiaAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorLutAdjustmentTintAdjustment(operation:TintAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorLutAdjustmentTintAdjustment(operation);
}
#else
extern inline function isColorLutAdjustmentTintAdjustment(operation:TintAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorLutAdjustmentTintAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorLutAdjustmentTintAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorLutAdjustmentTintAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createColorLutCache():ColorLutCache {
	return flight._js._fn.Adjustments.createColorLutCache();
}
#else
extern inline function createColorLutCache():ColorLutCache {
#if hl
	return flight._hl._fn.Adjustments.createColorLutCache();
#elseif cpp
	return flight._cpp._fn.Adjustments.createColorLutCache();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createColorLutCache();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createColorMatrixAdjustment(colorMatrix:Dynamic):ColorMatrixAdjustment {
	return flight._js._fn.Adjustments.createColorMatrixAdjustment(colorMatrix);
}
#else
extern inline function createColorMatrixAdjustment(colorMatrix:Dynamic):ColorMatrixAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createColorMatrixAdjustment(colorMatrix);
#elseif cpp
	return flight._cpp._fn.Adjustments.createColorMatrixAdjustment(colorMatrix);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createColorMatrixAdjustment(colorMatrix);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentBrightnessContrastAdjustment(operation:BrightnessContrastAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentBrightnessContrastAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentBrightnessContrastAdjustment(operation:BrightnessContrastAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentBrightnessContrastAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentBrightnessContrastAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentBrightnessContrastAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentChannelMixerAdjustment(operation:ChannelMixerAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentChannelMixerAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentChannelMixerAdjustment(operation:ChannelMixerAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentChannelMixerAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentChannelMixerAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentChannelMixerAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation:ColorBlindSimulationAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation:ColorBlindSimulationAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorBlindSimulationAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentColorGradeAdjustment(operation:ColorGradeAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorGradeAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentColorGradeAdjustment(operation:ColorGradeAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentColorGradeAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentColorGradeAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorGradeAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentColorMatrixAdjustment(operation:ColorMatrixAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorMatrixAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentColorMatrixAdjustment(operation:ColorMatrixAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentColorMatrixAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentColorMatrixAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorMatrixAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentColorScaleBiasAdjustment(operation:ColorScaleBiasAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorScaleBiasAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentColorScaleBiasAdjustment(operation:ColorScaleBiasAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentColorScaleBiasAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentColorScaleBiasAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentColorScaleBiasAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentExposureAdjustment(operation:ExposureAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentExposureAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentExposureAdjustment(operation:ExposureAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentExposureAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentExposureAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentExposureAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentGrayscaleAdjustment(operation:GrayscaleAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentGrayscaleAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentGrayscaleAdjustment(operation:GrayscaleAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentGrayscaleAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentGrayscaleAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentGrayscaleAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentHueSaturationAdjustment(operation:HueSaturationAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentHueSaturationAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentHueSaturationAdjustment(operation:HueSaturationAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentHueSaturationAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentHueSaturationAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentHueSaturationAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentInvertAdjustment(operation:InvertAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentInvertAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentInvertAdjustment(operation:InvertAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentInvertAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentInvertAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentInvertAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentLiftGammaGainAdjustment(operation:LiftGammaGainAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentLiftGammaGainAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentLiftGammaGainAdjustment(operation:LiftGammaGainAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentLiftGammaGainAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentLiftGammaGainAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentLiftGammaGainAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentLookupTableGradeAdjustment(operation:LookupTableGradeAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentLookupTableGradeAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentLookupTableGradeAdjustment(operation:LookupTableGradeAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentLookupTableGradeAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentLookupTableGradeAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentLookupTableGradeAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentSepiaAdjustment(operation:SepiaAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentSepiaAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentSepiaAdjustment(operation:SepiaAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentSepiaAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentSepiaAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentSepiaAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isColorMatrixAdjustmentTintAdjustment(operation:TintAdjustment):Bool {
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentTintAdjustment(operation);
}
#else
extern inline function isColorMatrixAdjustmentTintAdjustment(operation:TintAdjustment):Bool {
#if hl
	return flight._hl._fn.Adjustments.isColorMatrixAdjustmentTintAdjustment(operation);
#elseif cpp
	return flight._cpp._fn.Adjustments.isColorMatrixAdjustmentTintAdjustment(operation);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.isColorMatrixAdjustmentTintAdjustment(operation);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBrightnessColorMatrix(amount:Float):Dynamic {
	return flight._js._fn.Adjustments.createBrightnessColorMatrix(amount);
}
#else
extern inline function createBrightnessColorMatrix(amount:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createBrightnessColorMatrix(amount);
#elseif cpp
	return flight._cpp._fn.Adjustments.createBrightnessColorMatrix(amount);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createBrightnessColorMatrix(amount);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createChannelMixerColorMatrix(redOut:Dynamic, greenOut:Dynamic, blueOut:Dynamic):Dynamic {
	return flight._js._fn.Adjustments.createChannelMixerColorMatrix(redOut, greenOut, blueOut);
}
#else
extern inline function createChannelMixerColorMatrix(redOut:Dynamic, greenOut:Dynamic, blueOut:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createChannelMixerColorMatrix(redOut, greenOut, blueOut);
#elseif cpp
	return flight._cpp._fn.Adjustments.createChannelMixerColorMatrix(redOut, greenOut, blueOut);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createChannelMixerColorMatrix(redOut, greenOut, blueOut);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createColorBalanceColorMatrix(shadows:Dynamic, midtones:Dynamic, highlights:Dynamic):Dynamic {
	return flight._js._fn.Adjustments.createColorBalanceColorMatrix(shadows, midtones, highlights);
}
#else
extern inline function createColorBalanceColorMatrix(shadows:Dynamic, midtones:Dynamic, highlights:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createColorBalanceColorMatrix(shadows, midtones, highlights);
#elseif cpp
	return flight._cpp._fn.Adjustments.createColorBalanceColorMatrix(shadows, midtones, highlights);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createColorBalanceColorMatrix(shadows, midtones, highlights);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createColorMatrixFromTint(packedRgba:Int, amount:Float):Dynamic {
	return flight._js._fn.Adjustments.createColorMatrixFromTint(packedRgba, amount);
}
#else
extern inline function createColorMatrixFromTint(packedRgba:Int, amount:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createColorMatrixFromTint(packedRgba, amount);
#elseif cpp
	return flight._cpp._fn.Adjustments.createColorMatrixFromTint(packedRgba, amount);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createColorMatrixFromTint(packedRgba, amount);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createContrastColorMatrix(amount:Float):Dynamic {
	return flight._js._fn.Adjustments.createContrastColorMatrix(amount);
}
#else
extern inline function createContrastColorMatrix(amount:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createContrastColorMatrix(amount);
#elseif cpp
	return flight._cpp._fn.Adjustments.createContrastColorMatrix(amount);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createContrastColorMatrix(amount);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createDesaturateColorMatrix(amount:Float):Dynamic {
	return flight._js._fn.Adjustments.createDesaturateColorMatrix(amount);
}
#else
extern inline function createDesaturateColorMatrix(amount:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createDesaturateColorMatrix(amount);
#elseif cpp
	return flight._cpp._fn.Adjustments.createDesaturateColorMatrix(amount);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createDesaturateColorMatrix(amount);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGrayscaleColorMatrix():Dynamic {
	return flight._js._fn.Adjustments.createGrayscaleColorMatrix();
}
#else
extern inline function createGrayscaleColorMatrix():Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createGrayscaleColorMatrix();
#elseif cpp
	return flight._cpp._fn.Adjustments.createGrayscaleColorMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createGrayscaleColorMatrix();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createHueRotateColorMatrix(degrees:Float):Dynamic {
	return flight._js._fn.Adjustments.createHueRotateColorMatrix(degrees);
}
#else
extern inline function createHueRotateColorMatrix(degrees:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createHueRotateColorMatrix(degrees);
#elseif cpp
	return flight._cpp._fn.Adjustments.createHueRotateColorMatrix(degrees);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createHueRotateColorMatrix(degrees);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createIdentityColorMatrix():Dynamic {
	return flight._js._fn.Adjustments.createIdentityColorMatrix();
}
#else
extern inline function createIdentityColorMatrix():Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createIdentityColorMatrix();
#elseif cpp
	return flight._cpp._fn.Adjustments.createIdentityColorMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createIdentityColorMatrix();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInvertColorMatrix():Dynamic {
	return flight._js._fn.Adjustments.createInvertColorMatrix();
}
#else
extern inline function createInvertColorMatrix():Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createInvertColorMatrix();
#elseif cpp
	return flight._cpp._fn.Adjustments.createInvertColorMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createInvertColorMatrix();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, gamma:Float):Dynamic {
	return flight._js._fn.Adjustments.createLevelsColorMatrix(inBlack, inWhite, outBlack, outWhite, gamma);
}
#else
extern inline function createLevelsColorMatrix(inBlack:Float, inWhite:Float, outBlack:Float, outWhite:Float, gamma:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createLevelsColorMatrix(inBlack, inWhite, outBlack, outWhite, gamma);
#elseif cpp
	return flight._cpp._fn.Adjustments.createLevelsColorMatrix(inBlack, inWhite, outBlack, outWhite, gamma);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createLevelsColorMatrix(inBlack, inWhite, outBlack, outWhite, gamma);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createOpacityColorMatrix(alpha:Float):Dynamic {
	return flight._js._fn.Adjustments.createOpacityColorMatrix(alpha);
}
#else
extern inline function createOpacityColorMatrix(alpha:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createOpacityColorMatrix(alpha);
#elseif cpp
	return flight._cpp._fn.Adjustments.createOpacityColorMatrix(alpha);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createOpacityColorMatrix(alpha);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPolaroidColorMatrix():Dynamic {
	return flight._js._fn.Adjustments.createPolaroidColorMatrix();
}
#else
extern inline function createPolaroidColorMatrix():Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createPolaroidColorMatrix();
#elseif cpp
	return flight._cpp._fn.Adjustments.createPolaroidColorMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createPolaroidColorMatrix();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSaturationColorMatrix(amount:Float):Dynamic {
	return flight._js._fn.Adjustments.createSaturationColorMatrix(amount);
}
#else
extern inline function createSaturationColorMatrix(amount:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createSaturationColorMatrix(amount);
#elseif cpp
	return flight._cpp._fn.Adjustments.createSaturationColorMatrix(amount);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createSaturationColorMatrix(amount);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSepiaColorMatrix():Dynamic {
	return flight._js._fn.Adjustments.createSepiaColorMatrix();
}
#else
extern inline function createSepiaColorMatrix():Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createSepiaColorMatrix();
#elseif cpp
	return flight._cpp._fn.Adjustments.createSepiaColorMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createSepiaColorMatrix();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTechnicolorColorMatrix():Dynamic {
	return flight._js._fn.Adjustments.createTechnicolorColorMatrix();
}
#else
extern inline function createTechnicolorColorMatrix():Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createTechnicolorColorMatrix();
#elseif cpp
	return flight._cpp._fn.Adjustments.createTechnicolorColorMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createTechnicolorColorMatrix();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createVintageColorMatrix():Dynamic {
	return flight._js._fn.Adjustments.createVintageColorMatrix();
}
#else
extern inline function createVintageColorMatrix():Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createVintageColorMatrix();
#elseif cpp
	return flight._cpp._fn.Adjustments.createVintageColorMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createVintageColorMatrix();
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createWhiteBalanceColorMatrix(temperature:Float, tint:Float):Dynamic {
	return flight._js._fn.Adjustments.createWhiteBalanceColorMatrix(temperature, tint);
}
#else
extern inline function createWhiteBalanceColorMatrix(temperature:Float, tint:Float):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.createWhiteBalanceColorMatrix(temperature, tint);
#elseif cpp
	return flight._cpp._fn.Adjustments.createWhiteBalanceColorMatrix(temperature, tint);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createWhiteBalanceColorMatrix(temperature, tint);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyColorMatrixToColor(matrix:Dynamic, packedRgba:Int):Int {
	return flight._js._fn.Adjustments.applyColorMatrixToColor(matrix, packedRgba);
}
#else
extern inline function applyColorMatrixToColor(matrix:Dynamic, packedRgba:Int):Int {
#if hl
	return flight._hl._fn.Adjustments.applyColorMatrixToColor(matrix, packedRgba);
#elseif cpp
	return flight._cpp._fn.Adjustments.applyColorMatrixToColor(matrix, packedRgba);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.applyColorMatrixToColor(matrix, packedRgba);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function concatColorMatrix(target:Dynamic, source:Dynamic):Void {
	flight._js._fn.Adjustments.concatColorMatrix(target, source);
}
#else
extern inline function concatColorMatrix(target:Dynamic, source:Dynamic):Void {
#if hl
	flight._hl._fn.Adjustments.concatColorMatrix(target, source);
#elseif cpp
	flight._cpp._fn.Adjustments.concatColorMatrix(target, source);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.concatColorMatrix(target, source);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fuseColorMatrices(matrices:Dynamic):Dynamic {
	return flight._js._fn.Adjustments.fuseColorMatrices(matrices);
}
#else
extern inline function fuseColorMatrices(matrices:Dynamic, matricesLen:Int):Dynamic {
#if hl
	return flight._hl._fn.Adjustments.fuseColorMatrices(matrices, matricesLen);
#elseif cpp
	return flight._cpp._fn.Adjustments.fuseColorMatrices(matrices, matricesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.fuseColorMatrices(matrices, matricesLen);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function multiplyColorMatrix(out:Dynamic, a:Dynamic, b:Dynamic):Void {
	flight._js._fn.Adjustments.multiplyColorMatrix(out, a, b);
}
#else
extern inline function multiplyColorMatrix(out:Dynamic, a:Dynamic, b:Dynamic):Void {
#if hl
	flight._hl._fn.Adjustments.multiplyColorMatrix(out, a, b);
#elseif cpp
	flight._cpp._fn.Adjustments.multiplyColorMatrix(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.multiplyColorMatrix(out, a, b);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createColorScaleBiasAdjustment(colorScaleBias:ColorScaleBias):ColorScaleBiasAdjustment {
	return flight._js._fn.Adjustments.createColorScaleBiasAdjustment(colorScaleBias);
}
#else
extern inline function createColorScaleBiasAdjustment(colorScaleBias:ColorScaleBias):ColorScaleBiasAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createColorScaleBiasAdjustment(colorScaleBias);
#elseif cpp
	return flight._cpp._fn.Adjustments.createColorScaleBiasAdjustment(colorScaleBias);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createColorScaleBiasAdjustment(colorScaleBias);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createExposureAdjustment(options:Null<ExposureAdjustmentOptions>):ExposureAdjustment {
	return flight._js._fn.Adjustments.createExposureAdjustment(options);
}
#else
extern inline function createExposureAdjustment(options:ExposureAdjustmentOptions):ExposureAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createExposureAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createExposureAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createExposureAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGrayscaleAdjustment(options:Null<GrayscaleAdjustmentOptions>):GrayscaleAdjustment {
	return flight._js._fn.Adjustments.createGrayscaleAdjustment(options);
}
#else
extern inline function createGrayscaleAdjustment(options:GrayscaleAdjustmentOptions):GrayscaleAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createGrayscaleAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createGrayscaleAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createGrayscaleAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createHueSaturationAdjustment(options:Null<HueSaturationAdjustmentOptions>):HueSaturationAdjustment {
	return flight._js._fn.Adjustments.createHueSaturationAdjustment(options);
}
#else
extern inline function createHueSaturationAdjustment(options:HueSaturationAdjustmentOptions):HueSaturationAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createHueSaturationAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createHueSaturationAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createHueSaturationAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInvertAdjustment(options:Null<InvertAdjustmentOptions>):InvertAdjustment {
	return flight._js._fn.Adjustments.createInvertAdjustment(options);
}
#else
extern inline function createInvertAdjustment(options:InvertAdjustmentOptions):InvertAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createInvertAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createInvertAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createInvertAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLiftGammaGainAdjustment(options:Null<LiftGammaGainAdjustmentOptions>):LiftGammaGainAdjustment {
	return flight._js._fn.Adjustments.createLiftGammaGainAdjustment(options);
}
#else
extern inline function createLiftGammaGainAdjustment(options:LiftGammaGainAdjustmentOptions):LiftGammaGainAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createLiftGammaGainAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createLiftGammaGainAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createLiftGammaGainAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLookupTableGradeAdjustment(options:Null<LookupTableGradeAdjustmentOptions>):LookupTableGradeAdjustment {
	return flight._js._fn.Adjustments.createLookupTableGradeAdjustment(options);
}
#else
extern inline function createLookupTableGradeAdjustment(options:LookupTableGradeAdjustmentOptions):LookupTableGradeAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createLookupTableGradeAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createLookupTableGradeAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createLookupTableGradeAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSepiaAdjustment(options:Null<SepiaAdjustmentOptions>):SepiaAdjustment {
	return flight._js._fn.Adjustments.createSepiaAdjustment(options);
}
#else
extern inline function createSepiaAdjustment(options:SepiaAdjustmentOptions):SepiaAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createSepiaAdjustment(options);
#elseif cpp
	return flight._cpp._fn.Adjustments.createSepiaAdjustment(options);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createSepiaAdjustment(options);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTintAdjustment(rgba:Int):TintAdjustment {
	return flight._js._fn.Adjustments.createTintAdjustment(rgba);
}
#else
extern inline function createTintAdjustment(rgba:Int):TintAdjustment {
#if hl
	return flight._hl._fn.Adjustments.createTintAdjustment(rgba);
#elseif cpp
	return flight._cpp._fn.Adjustments.createTintAdjustment(rgba);
#elseif (js && flight_esm)
	return flight._js._fn.Adjustments.createTintAdjustment(rgba);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeBrightnessContrastAdjustment(ptr:BrightnessContrastAdjustment):Void {
	flight._js._fn.Adjustments.freeBrightnessContrastAdjustment(ptr);
}
#else
extern inline function freeBrightnessContrastAdjustment(ptr:BrightnessContrastAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeBrightnessContrastAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeBrightnessContrastAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeBrightnessContrastAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeChannelMixerAdjustment(ptr:ChannelMixerAdjustment):Void {
	flight._js._fn.Adjustments.freeChannelMixerAdjustment(ptr);
}
#else
extern inline function freeChannelMixerAdjustment(ptr:ChannelMixerAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeChannelMixerAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeChannelMixerAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeChannelMixerAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeColorBlindSimulationAdjustment(ptr:ColorBlindSimulationAdjustment):Void {
	flight._js._fn.Adjustments.freeColorBlindSimulationAdjustment(ptr);
}
#else
extern inline function freeColorBlindSimulationAdjustment(ptr:ColorBlindSimulationAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeColorBlindSimulationAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeColorBlindSimulationAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeColorBlindSimulationAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeColorGradeAdjustment(ptr:ColorGradeAdjustment):Void {
	flight._js._fn.Adjustments.freeColorGradeAdjustment(ptr);
}
#else
extern inline function freeColorGradeAdjustment(ptr:ColorGradeAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeColorGradeAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeColorGradeAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeColorGradeAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeColorLut(ptr:ColorLut):Void {
	flight._js._fn.Adjustments.freeColorLut(ptr);
}
#else
extern inline function freeColorLut(ptr:ColorLut):Void {
#if hl
	flight._hl._fn.Adjustments.freeColorLut(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeColorLut(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeColorLut(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeColorTransformFunction(ptr:ColorTransformFunction):Void {
	flight._js._fn.Adjustments.freeColorTransformFunction(ptr);
}
#else
extern inline function freeColorTransformFunction(ptr:ColorTransformFunction):Void {
#if hl
	flight._hl._fn.Adjustments.freeColorTransformFunction(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeColorTransformFunction(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeColorTransformFunction(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeColorLutCache(ptr:ColorLutCache):Void {
	flight._js._fn.Adjustments.freeColorLutCache(ptr);
}
#else
extern inline function freeColorLutCache(ptr:ColorLutCache):Void {
#if hl
	flight._hl._fn.Adjustments.freeColorLutCache(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeColorLutCache(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeColorLutCache(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeColorMatrixAdjustment(ptr:ColorMatrixAdjustment):Void {
	flight._js._fn.Adjustments.freeColorMatrixAdjustment(ptr);
}
#else
extern inline function freeColorMatrixAdjustment(ptr:ColorMatrixAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeColorMatrixAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeColorMatrixAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeColorMatrixAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeColorScaleBiasAdjustment(ptr:ColorScaleBiasAdjustment):Void {
	flight._js._fn.Adjustments.freeColorScaleBiasAdjustment(ptr);
}
#else
extern inline function freeColorScaleBiasAdjustment(ptr:ColorScaleBiasAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeColorScaleBiasAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeColorScaleBiasAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeColorScaleBiasAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeExposureAdjustment(ptr:ExposureAdjustment):Void {
	flight._js._fn.Adjustments.freeExposureAdjustment(ptr);
}
#else
extern inline function freeExposureAdjustment(ptr:ExposureAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeExposureAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeExposureAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeExposureAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGrayscaleAdjustment(ptr:GrayscaleAdjustment):Void {
	flight._js._fn.Adjustments.freeGrayscaleAdjustment(ptr);
}
#else
extern inline function freeGrayscaleAdjustment(ptr:GrayscaleAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeGrayscaleAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeGrayscaleAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeGrayscaleAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeHueSaturationAdjustment(ptr:HueSaturationAdjustment):Void {
	flight._js._fn.Adjustments.freeHueSaturationAdjustment(ptr);
}
#else
extern inline function freeHueSaturationAdjustment(ptr:HueSaturationAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeHueSaturationAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeHueSaturationAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeHueSaturationAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInvertAdjustment(ptr:InvertAdjustment):Void {
	flight._js._fn.Adjustments.freeInvertAdjustment(ptr);
}
#else
extern inline function freeInvertAdjustment(ptr:InvertAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeInvertAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeInvertAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeInvertAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLiftGammaGainAdjustment(ptr:LiftGammaGainAdjustment):Void {
	flight._js._fn.Adjustments.freeLiftGammaGainAdjustment(ptr);
}
#else
extern inline function freeLiftGammaGainAdjustment(ptr:LiftGammaGainAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeLiftGammaGainAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeLiftGammaGainAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeLiftGammaGainAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLookupTableGradeAdjustment(ptr:LookupTableGradeAdjustment):Void {
	flight._js._fn.Adjustments.freeLookupTableGradeAdjustment(ptr);
}
#else
extern inline function freeLookupTableGradeAdjustment(ptr:LookupTableGradeAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeLookupTableGradeAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeLookupTableGradeAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeLookupTableGradeAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSepiaAdjustment(ptr:SepiaAdjustment):Void {
	flight._js._fn.Adjustments.freeSepiaAdjustment(ptr);
}
#else
extern inline function freeSepiaAdjustment(ptr:SepiaAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeSepiaAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeSepiaAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeSepiaAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTintAdjustment(ptr:TintAdjustment):Void {
	flight._js._fn.Adjustments.freeTintAdjustment(ptr);
}
#else
extern inline function freeTintAdjustment(ptr:TintAdjustment):Void {
#if hl
	flight._hl._fn.Adjustments.freeTintAdjustment(ptr);
#elseif cpp
	flight._cpp._fn.Adjustments.freeTintAdjustment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Adjustments.freeTintAdjustment(ptr);
#else
	#error "flight.Adjustments: no backend for this target."
#end
}
#end
