package flight;

// Native facade override. Keep this deliberately equal to src-cpp/manifest.json: flight-cpp's
// checked-in generated SDK currently covers only part of the newer Flight revision used on web.
inline function clamp(value:Float, min:Float, max:Float):Float {
  return flight._cpp._fn.Math.clamp(value, min, max);
}

inline function inRange(value:Float, min:Float, max:Float):Bool {
  return flight._cpp._fn.Math.inRange(value, min, max);
}

inline function inverseLerp(a:Float, b:Float, value:Float):Float {
  return flight._cpp._fn.Math.inverseLerp(a, b, value);
}

inline function lerp(a:Float, b:Float, t:Float):Float {
  return flight._cpp._fn.Math.lerp(a, b, t);
}

inline function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float {
  return flight._cpp._fn.Math.remap(value, inMin, inMax, outMin, outMax);
}

inline function saturate(value:Float):Float {
  return flight._cpp._fn.Math.saturate(value);
}

inline function smoothStep(edge0:Float, edge1:Float, x:Float):Float {
  return flight._cpp._fn.Math.smoothStep(edge0, edge1, x);
}

inline function step(edge:Float, x:Float):Float {
  return flight._cpp._fn.Math.step(edge, x);
}
