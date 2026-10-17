package flight;

// Native facade override. Keep this deliberately equal to src-cpp/manifest.json: these are the
// scalar Color functions whose generated flight-cpp header compiles and matches current externs.
inline function linearChannelToSrgb(value:Float):Float {
  return flight._cpp._fn.Color.linearChannelToSrgb(value);
}

inline function srgbChannelToLinear(value:Float):Float {
  return flight._cpp._fn.Color.srgbChannelToLinear(value);
}
