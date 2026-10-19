// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::binpack {

::Array<::Dynamic> explain_unpacked_rectangles(::Array<::Dynamic> rectangles, flight::Ref<flight::types::BinPackOptions> options);
double get_pack_result_occupancy(flight::Ref<flight::types::PackResult> result);
flight::Ref<flight::types::PackResult> pack_rectangles(::Array<::Dynamic> rects, flight::Ref<flight::types::BinPackOptions> options);

} // namespace flight_hx::binpack
