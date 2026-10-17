#pragma once

// flight-cpp exposes a flight::null helper through <flight/runtime.hpp>. Hxcpp also generates
// unqualified null() calls inside namespace flight, so rename only that helper while consuming the
// headers. This is a narrow downstream integration correction, not an implementation substitute.
#define null flight_hx_presence_null
#include <flight/math/clamp.hpp>
#include <flight/math/interpolation.hpp>
#undef null

namespace flight_hx::math {

inline double clamp(double value, double min, double max) {
  return flight::math::clamp(value, min, max);
}

inline double lerp(double a, double b, double t) {
  return flight::math::lerp(a, b, t);
}

inline double saturate(double value) {
  return flight::math::saturate(value);
}

} // namespace flight_hx::math
