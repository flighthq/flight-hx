package flight;

extern inline function colorFromKelvin(kelvin:Float):Int {
#if hl
	return flight._hl._fn.Color.colorFromKelvin(kelvin);
#elseif cpp
	return flight._cpp._fn.Color.colorFromKelvin(kelvin);
#elseif (js && flight_esm)
	return flight._js._fn.Color.colorFromKelvin(kelvin);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function allocateHslColor():HslColor {
#if hl
	return flight._hl._fn.Color.allocateHslColor();
#elseif cpp
	return flight._cpp._fn.Color.allocateHslColor();
#elseif (js && flight_esm)
	return flight._js._fn.Color.allocateHslColor();
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function hslToRgb(out:Dynamic, h:Float, s:Float, l:Float):Void {
#if hl
	flight._hl._fn.Color.hslToRgb(out, h, s, l);
#elseif cpp
	flight._cpp._fn.Color.hslToRgb(out, h, s, l);
#elseif (js && flight_esm)
	flight._js._fn.Color.hslToRgb(out, h, s, l);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function rgbToHsl(out:HslColor, color:Int):Void {
#if hl
	flight._hl._fn.Color.rgbToHsl(out, color);
#elseif cpp
	flight._cpp._fn.Color.rgbToHsl(out, color);
#elseif (js && flight_esm)
	flight._js._fn.Color.rgbToHsl(out, color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function allocateHsvColor():HsvColor {
#if hl
	return flight._hl._fn.Color.allocateHsvColor();
#elseif cpp
	return flight._cpp._fn.Color.allocateHsvColor();
#elseif (js && flight_esm)
	return flight._js._fn.Color.allocateHsvColor();
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function hsvToRgb(out:Dynamic, h:Float, s:Float, v:Float):Void {
#if hl
	flight._hl._fn.Color.hsvToRgb(out, h, s, v);
#elseif cpp
	flight._cpp._fn.Color.hsvToRgb(out, h, s, v);
#elseif (js && flight_esm)
	flight._js._fn.Color.hsvToRgb(out, h, s, v);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function rgbToHsv(out:HsvColor, color:Int):Void {
#if hl
	flight._hl._fn.Color.rgbToHsv(out, color);
#elseif cpp
	flight._cpp._fn.Color.rgbToHsv(out, color);
#elseif (js && flight_esm)
	flight._js._fn.Color.rgbToHsv(out, color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function lerpColor(start:Int, end:Int, t:Float):Int {
#if hl
	return flight._hl._fn.Color.lerpColor(start, end, t);
#elseif cpp
	return flight._cpp._fn.Color.lerpColor(start, end, t);
#elseif (js && flight_esm)
	return flight._js._fn.Color.lerpColor(start, end, t);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function lerpLinearColor(out:LinearColor, start:LinearColor, end:LinearColor, t:Float):Void {
#if hl
	flight._hl._fn.Color.lerpLinearColor(out, start, end, t);
#elseif cpp
	flight._cpp._fn.Color.lerpLinearColor(out, start, end, t);
#elseif (js && flight_esm)
	flight._js._fn.Color.lerpLinearColor(out, start, end, t);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function getColorContrastRatio(a:Int, b:Int):Float {
#if hl
	return flight._hl._fn.Color.getColorContrastRatio(a, b);
#elseif cpp
	return flight._cpp._fn.Color.getColorContrastRatio(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Color.getColorContrastRatio(a, b);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function getColorLuminance(color:Int):Float {
#if hl
	return flight._hl._fn.Color.getColorLuminance(color);
#elseif cpp
	return flight._cpp._fn.Color.getColorLuminance(color);
#elseif (js && flight_esm)
	return flight._js._fn.Color.getColorLuminance(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function getRec2020LuminanceWeights(out:Dynamic):Void {
#if hl
	flight._hl._fn.Color.getRec2020LuminanceWeights(out);
#elseif cpp
	flight._cpp._fn.Color.getRec2020LuminanceWeights(out);
#elseif (js && flight_esm)
	flight._js._fn.Color.getRec2020LuminanceWeights(out);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function getRec709LuminanceWeights(out:Dynamic):Void {
#if hl
	flight._hl._fn.Color.getRec709LuminanceWeights(out);
#elseif cpp
	flight._cpp._fn.Color.getRec709LuminanceWeights(out);
#elseif (js && flight_esm)
	flight._js._fn.Color.getRec709LuminanceWeights(out);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function clampLinearRgb(out:Dynamic, r:Float, g:Float, b:Float):Void {
#if hl
	flight._hl._fn.Color.clampLinearRgb(out, r, g, b);
#elseif cpp
	flight._cpp._fn.Color.clampLinearRgb(out, r, g, b);
#elseif (js && flight_esm)
	flight._js._fn.Color.clampLinearRgb(out, r, g, b);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function linearRgbToOklab(out:Dynamic, r:Float, g:Float, b:Float):Void {
#if hl
	flight._hl._fn.Color.linearRgbToOklab(out, r, g, b);
#elseif cpp
	flight._cpp._fn.Color.linearRgbToOklab(out, r, g, b);
#elseif (js && flight_esm)
	flight._js._fn.Color.linearRgbToOklab(out, r, g, b);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function oklabToLinearRgb(out:Dynamic, l:Float, a:Float, b:Float):Void {
#if hl
	flight._hl._fn.Color.oklabToLinearRgb(out, l, a, b);
#elseif cpp
	flight._cpp._fn.Color.oklabToLinearRgb(out, l, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Color.oklabToLinearRgb(out, l, a, b);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function allocateLinearColor():LinearColor {
#if hl
	return flight._hl._fn.Color.allocateLinearColor();
#elseif cpp
	return flight._cpp._fn.Color.allocateLinearColor();
#elseif (js && flight_esm)
	return flight._js._fn.Color.allocateLinearColor();
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function computeRgbHexString(color:Int):String {
#if hl
	return cast flight._hl._fn.Color.computeRgbHexString(color);
#elseif cpp
	return cast flight._cpp._fn.Color.computeRgbHexString(color);
#elseif (js && flight_esm)
	return cast flight._js._fn.Color.computeRgbHexString(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function computeRgbaCssString(color:Int):String {
#if hl
	return cast flight._hl._fn.Color.computeRgbaCssString(color);
#elseif cpp
	return cast flight._cpp._fn.Color.computeRgbaCssString(color);
#elseif (js && flight_esm)
	return cast flight._js._fn.Color.computeRgbaCssString(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function getColorAlpha(color:Int):Float {
#if hl
	return flight._hl._fn.Color.getColorAlpha(color);
#elseif cpp
	return flight._cpp._fn.Color.getColorAlpha(color);
#elseif (js && flight_esm)
	return flight._js._fn.Color.getColorAlpha(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function getColorRgb(color:Int):Int {
#if hl
	return flight._hl._fn.Color.getColorRgb(color);
#elseif cpp
	return flight._cpp._fn.Color.getColorRgb(color);
#elseif (js && flight_esm)
	return flight._js._fn.Color.getColorRgb(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function packColor(r:Float, g:Float, b:Float, a:Float):Int {
#if hl
	return flight._hl._fn.Color.packColor(r, g, b, a);
#elseif cpp
	return flight._cpp._fn.Color.packColor(r, g, b, a);
#elseif (js && flight_esm)
	return flight._js._fn.Color.packColor(r, g, b, a);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function packLinearChannelsToColor(r:Float, g:Float, b:Float, a:Float):Int {
#if hl
	return flight._hl._fn.Color.packLinearChannelsToColor(r, g, b, a);
#elseif cpp
	return flight._cpp._fn.Color.packLinearChannelsToColor(r, g, b, a);
#elseif (js && flight_esm)
	return flight._js._fn.Color.packLinearChannelsToColor(r, g, b, a);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function packLinearToColor(color:LinearColor):Int {
#if hl
	return flight._hl._fn.Color.packLinearToColor(color);
#elseif cpp
	return flight._cpp._fn.Color.packLinearToColor(color);
#elseif (js && flight_esm)
	return flight._js._fn.Color.packLinearToColor(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function packOpaqueColor(rgb:Int):Int {
#if hl
	return flight._hl._fn.Color.packOpaqueColor(rgb);
#elseif cpp
	return flight._cpp._fn.Color.packOpaqueColor(rgb);
#elseif (js && flight_esm)
	return flight._js._fn.Color.packOpaqueColor(rgb);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function setColorAlpha(color:Int, alpha:Float):Int {
#if hl
	return flight._hl._fn.Color.setColorAlpha(color, alpha);
#elseif cpp
	return flight._cpp._fn.Color.setColorAlpha(color, alpha);
#elseif (js && flight_esm)
	return flight._js._fn.Color.setColorAlpha(color, alpha);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function unpackColorRgba(out:Dynamic, color:Int):Void {
#if hl
	flight._hl._fn.Color.unpackColorRgba(out, color);
#elseif cpp
	flight._cpp._fn.Color.unpackColorRgba(out, color);
#elseif (js && flight_esm)
	flight._js._fn.Color.unpackColorRgba(out, color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function unpackColorToLinear(out:LinearColor, color:Int):Void {
#if hl
	flight._hl._fn.Color.unpackColorToLinear(out, color);
#elseif cpp
	flight._cpp._fn.Color.unpackColorToLinear(out, color);
#elseif (js && flight_esm)
	flight._js._fn.Color.unpackColorToLinear(out, color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function premultiplyColorAlpha(color:Int):Int {
#if hl
	return flight._hl._fn.Color.premultiplyColorAlpha(color);
#elseif cpp
	return flight._cpp._fn.Color.premultiplyColorAlpha(color);
#elseif (js && flight_esm)
	return flight._js._fn.Color.premultiplyColorAlpha(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function unpremultiplyColorAlpha(color:Int):Int {
#if hl
	return flight._hl._fn.Color.unpremultiplyColorAlpha(color);
#elseif cpp
	return flight._cpp._fn.Color.unpremultiplyColorAlpha(color);
#elseif (js && flight_esm)
	return flight._js._fn.Color.unpremultiplyColorAlpha(color);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function linearChannelToSrgb(value:Float):Float {
#if hl
	return flight._hl._fn.Color.linearChannelToSrgb(value);
#elseif cpp
	return flight._cpp._fn.Color.linearChannelToSrgb(value);
#elseif (js && flight_esm)
	return flight._js._fn.Color.linearChannelToSrgb(value);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function srgbChannelToLinear(value:Float):Float {
#if hl
	return flight._hl._fn.Color.srgbChannelToLinear(value);
#elseif cpp
	return flight._cpp._fn.Color.srgbChannelToLinear(value);
#elseif (js && flight_esm)
	return flight._js._fn.Color.srgbChannelToLinear(value);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function freeHslColor(ptr:HslColor):Void {
#if hl
	flight._hl._fn.Color.freeHslColor(ptr);
#elseif cpp
	flight._cpp._fn.Color.freeHslColor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Color.freeHslColor(ptr);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function freeHsvColor(ptr:HsvColor):Void {
#if hl
	flight._hl._fn.Color.freeHsvColor(ptr);
#elseif cpp
	flight._cpp._fn.Color.freeHsvColor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Color.freeHsvColor(ptr);
#else
	#error "flight.Color: no backend for this target."
#end
}
extern inline function freeLinearColor(ptr:LinearColor):Void {
#if hl
	flight._hl._fn.Color.freeLinearColor(ptr);
#elseif cpp
	flight._cpp._fn.Color.freeLinearColor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Color.freeLinearColor(ptr);
#else
	#error "flight.Color: no backend for this target."
#end
}
