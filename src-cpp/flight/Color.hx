// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function clampLinearRgb(out:Array<Float>, r:Float, g:Float, b:Float):Void {
  flight._cpp._fn.Color.clampLinearRgb(out, r, g, b);
}

inline function getRec2020LuminanceWeights(out:Array<Float>):Void {
  flight._cpp._fn.Color.getRec2020LuminanceWeights(out);
}

inline function getRec709LuminanceWeights(out:Array<Float>):Void {
  flight._cpp._fn.Color.getRec709LuminanceWeights(out);
}

inline function hslToRgb(out:Array<Float>, h:Float, s:Float, l:Float):Void {
  flight._cpp._fn.Color.hslToRgb(out, h, s, l);
}

inline function hsvToRgb(out:Array<Float>, h:Float, s:Float, v:Float):Void {
  flight._cpp._fn.Color.hsvToRgb(out, h, s, v);
}

inline function linearRgbToOklab(out:Array<Float>, r:Float, g:Float, b:Float):Void {
  flight._cpp._fn.Color.linearRgbToOklab(out, r, g, b);
}

inline function oklabToLinearRgb(out:Array<Float>, L:Float, a:Float, b:Float):Void {
  flight._cpp._fn.Color.oklabToLinearRgb(out, L, a, b);
}

inline function unpackColorRgba(out:Array<Float>, color:Float):Void {
  flight._cpp._fn.Color.unpackColorRgba(out, color);
}

inline function colorFromKelvin(kelvin:Float):Float {
  return flight._cpp._fn.Color.colorFromKelvin(kelvin);
}

inline function computeRgbHexString(color:Float):String {
  return flight._cpp._fn.Color.computeRgbHexString(color);
}

inline function computeRgbaCssString(color:Float):String {
  return flight._cpp._fn.Color.computeRgbaCssString(color);
}

inline function getColorAlpha(color:Float):Float {
  return flight._cpp._fn.Color.getColorAlpha(color);
}

inline function getColorContrastRatio(a:Float, b:Float):Float {
  return flight._cpp._fn.Color.getColorContrastRatio(a, b);
}

inline function getColorLuminance(color:Float):Float {
  return flight._cpp._fn.Color.getColorLuminance(color);
}

inline function getColorRgb(color:Float):Float {
  return flight._cpp._fn.Color.getColorRgb(color);
}

inline function lerpColor(start:Float, end:Float, t:Float):Float {
  return flight._cpp._fn.Color.lerpColor(start, end, t);
}

inline function linearChannelToSrgb(value:Float):Float {
  return flight._cpp._fn.Color.linearChannelToSrgb(value);
}

inline function packColor(r:Float, g:Float, b:Float, a:Float):Float {
  return flight._cpp._fn.Color.packColor(r, g, b, a);
}

inline function packOpaqueColor(rgb:Float):Float {
  return flight._cpp._fn.Color.packOpaqueColor(rgb);
}

inline function premultiplyColorAlpha(color:Float):Float {
  return flight._cpp._fn.Color.premultiplyColorAlpha(color);
}

inline function setColorAlpha(color:Float, alpha:Float):Float {
  return flight._cpp._fn.Color.setColorAlpha(color, alpha);
}

inline function srgbChannelToLinear(value:Float):Float {
  return flight._cpp._fn.Color.srgbChannelToLinear(value);
}

inline function unpremultiplyColorAlpha(color:Float):Float {
  return flight._cpp._fn.Color.unpremultiplyColorAlpha(color);
}

extern inline function allocateHslColor():flight.HslColor {
  return flight._cpp._attempt.Attempt_Color_allocateHslColor.allocateHslColor();
}

extern inline function allocateHsvColor():flight.HsvColor {
  return flight._cpp._attempt.Attempt_Color_allocateHsvColor.allocateHsvColor();
}

extern inline function allocateLinearColor():flight.LinearColor {
  return flight._cpp._attempt.Attempt_Color_allocateLinearColor.allocateLinearColor();
}

extern inline function lerpLinearColor(out:flight.LinearColor, start:flight.LinearColor, end:flight.LinearColor, t:Float):flight.LinearColor {
  return flight._cpp._attempt.Attempt_Color_lerpLinearColor.lerpLinearColor(out, start, end, t);
}

extern inline function packLinearToColor(color:flight.LinearColor):Float {
  return flight._cpp._attempt.Attempt_Color_packLinearToColor.packLinearToColor(color);
}

extern inline function rgbToHsl(out:flight.HslColor, color:Float):flight.HslColor {
  return flight._cpp._attempt.Attempt_Color_rgbToHsl.rgbToHsl(out, color);
}

extern inline function rgbToHsv(out:flight.HsvColor, color:Float):flight.HsvColor {
  return flight._cpp._attempt.Attempt_Color_rgbToHsv.rgbToHsv(out, color);
}

extern inline function unpackColorToLinear(out:flight.LinearColor, color:Float):flight.LinearColor {
  return flight._cpp._attempt.Attempt_Color_unpackColorToLinear.unpackColorToLinear(out, color);
}
