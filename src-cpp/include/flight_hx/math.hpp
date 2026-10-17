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

inline bool in_range(double value, double min, double max) {
  return flight::math::in_range(value, min, max);
}

inline double inverse_lerp(double a, double b, double value) {
  return flight::math::inverse_lerp(a, b, value);
}

inline double lerp(double a, double b, double t) {
  return flight::math::lerp(a, b, t);
}

inline double remap(double value, double in_min, double in_max, double out_min, double out_max) {
  return flight::math::remap(value, in_min, in_max, out_min, out_max);
}

inline double saturate(double value) {
  return flight::math::saturate(value);
}

inline double smooth_step(double edge0, double edge1, double x) {
  return flight::math::smooth_step(edge0, edge1, x);
}

inline double step(double edge, double x) {
  return flight::math::step(edge, x);
}

} // namespace flight_hx::math
