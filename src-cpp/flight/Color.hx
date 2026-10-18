// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

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
