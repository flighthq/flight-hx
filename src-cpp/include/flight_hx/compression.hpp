// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::compression {

::Array<double> compress_deflate(::Array<double> bytes);
::Array<double> compress_deflate_zlib(::Array<double> bytes);
::Array<double> compress_lzma(::Array<double> bytes);
double compute_adler32(::Array<double> input);

} // namespace flight_hx::compression
