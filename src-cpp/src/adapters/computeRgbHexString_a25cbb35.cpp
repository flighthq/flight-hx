// Generated from flight-compiler native-planning.json. Do not edit.
#include <hxcpp.h>
#include <optional>
#include <string>
#include <flight/color/contract.hpp>

namespace flight_hx::haxe::_cpp {
// String values are copied through UTF-8 in both directions; neither runtime borrows the other string storage.
::String computeRgbHexString_a25cbb35(double argument_0) {
  const flight::String flight_result = flight::color::compute_rgb_hex_string(argument_0);
  const std::string haxe_result_utf8 = flight_result.to_utf8();
  return ::String(haxe_result_utf8.data(), haxe_result_utf8.size());
}
} // namespace flight_hx::haxe::_cpp
