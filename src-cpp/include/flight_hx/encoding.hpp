// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::encoding {

::String decode_utf8(::Array<double> bytes, bool offsetPresent, double offset, bool lengthPresent, double length);
::Array<double> encode_utf8(::String text);

} // namespace flight_hx::encoding
