#pragma once

// See math.hpp: keep flight-cpp's presence helper out of hxcpp's generated flight namespace.
#define null flight_hx_presence_null
#include <flight/color/srgb_transfer.hpp>
#undef null

namespace flight_hx::color {

inline double linear_channel_to_srgb(double value) {
  return flight::color::linear_channel_to_srgb(value);
}

inline double srgb_channel_to_linear(double value) {
  return flight::color::srgb_channel_to_linear(value);
}

} // namespace flight_hx::color
