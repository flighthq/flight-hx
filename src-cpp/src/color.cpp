// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/color/contract.hpp>
#include <flight_hx/color.hpp>

namespace flight_hx::color {

double color_from_kelvin(double kelvin) {
  return flight::color::color_from_kelvin(kelvin);
}

double get_color_alpha(double color) {
  return flight::color::get_color_alpha(color);
}

double get_color_contrast_ratio(double a, double b) {
  return flight::color::get_color_contrast_ratio(a, b);
}

double get_color_luminance(double color) {
  return flight::color::get_color_luminance(color);
}

double get_color_rgb(double color) {
  return flight::color::get_color_rgb(color);
}

double lerp_color(double start, double end, double t) {
  return flight::color::lerp_color(start, end, t);
}

double linear_channel_to_srgb(double value) {
  return flight::color::linear_channel_to_srgb(value);
}

double pack_color(double r, double g, double b, double a) {
  return flight::color::pack_color(r, g, b, a);
}

double pack_opaque_color(double rgb) {
  return flight::color::pack_opaque_color(rgb);
}

double premultiply_color_alpha(double color) {
  return flight::color::premultiply_color_alpha(color);
}

double set_color_alpha(double color, double alpha) {
  return flight::color::set_color_alpha(color, alpha);
}

double srgb_channel_to_linear(double value) {
  return flight::color::srgb_channel_to_linear(value);
}

double unpremultiply_color_alpha(double color) {
  return flight::color::unpremultiply_color_alpha(color);
}

} // namespace flight_hx::color
