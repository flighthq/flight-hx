// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::bitmap {

void build_bitmap_brightness_color_matrix(::Array<double> out, double amount);
void build_bitmap_contrast_color_matrix(::Array<double> out, double amount);
void build_bitmap_grayscale_color_matrix(::Array<double> out);
void build_bitmap_hue_rotation_color_matrix(::Array<double> out, double degrees);
void build_bitmap_invert_color_matrix(::Array<double> out);
void build_bitmap_saturation_color_matrix(::Array<double> out, double amount);
void build_bitmap_sepia_color_matrix(::Array<double> out);
void concat_bitmap_color_matrix(::Array<double> out, ::Array<double> first, ::Array<double> second);
void set_bitmap_color_matrix_identity(::Array<double> out);

} // namespace flight_hx::bitmap
