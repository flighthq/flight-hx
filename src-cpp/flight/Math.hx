package flight;

// Native facade override. Keep this deliberately equal to src-cpp/manifest.json: flight-cpp's
// checked-in generated SDK currently covers only part of the newer Flight revision used on web.
inline function clamp(value:Float, min:Float, max:Float):Float {
  return flight._cpp._fn.Math.clamp(value, min, max);
}

inline function lerp(a:Float, b:Float, t:Float):Float {
  return flight._cpp._fn.Math.lerp(a, b, t);
}

inline function saturate(value:Float):Float {
  return flight._cpp._fn.Math.saturate(value);
}
