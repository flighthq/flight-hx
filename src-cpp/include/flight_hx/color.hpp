// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::color {

double color_from_kelvin(double kelvin);
double get_color_alpha(double color);
double get_color_contrast_ratio(double a, double b);
double get_color_luminance(double color);
double get_color_rgb(double color);
double lerp_color(double start, double end, double t);
double linear_channel_to_srgb(double value);
double pack_color(double r, double g, double b, double a);
double pack_opaque_color(double rgb);
double premultiply_color_alpha(double color);
double set_color_alpha(double color, double alpha);
double srgb_channel_to_linear(double value);
double unpremultiply_color_alpha(double color);

} // namespace flight_hx::color
