// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::path_formats {

bool append_svg_path_data(flight::Ref<flight::types::Path> path, ::String d);
::String format_svg_path_data(flight::Ref<flight::types::Path> path, flight::Ref<flight::types::SvgPathDataFormatOptions> options);
flight_hx::Ref<flight::types::Path> parse_svg_path_data(::String d);

} // namespace flight_hx::path_formats
