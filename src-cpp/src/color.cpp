// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/color/contract.hpp>
#include <flight_hx/color.hpp>

namespace flight_hx::color {

namespace {

flight::Array<double> to_flight_array(const ::Array<double>& source) {
  flight::Array<double> result;
  for (int index = 0; index < source->length; ++index) result.push(source[index]);
  return result;
}

::Array<double> to_haxe_array(const flight::Array<double>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");
  }
  ::Array<double> result = ::Array_obj<double>::__new(static_cast<int>(source.size()));
  int index = 0;
  for (const double value : source) result[index++] = value;
  return result;
}

void replace_haxe_array(::Array<double> destination, const flight::Array<double>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");
  }
  destination->resize(static_cast<int>(source.size()));
  int index = 0;
  for (const double value : source) destination[index++] = value;
}

} // namespace

void clamp_linear_rgb(::Array<double> out, double r, double g, double b) {
  auto flight_out = to_flight_array(out);
  flight::color::clamp_linear_rgb(flight_out, r, g, b);
  replace_haxe_array(out, flight_out);
}

void get_rec2020_luminance_weights(::Array<double> out) {
  auto flight_out = to_flight_array(out);
  flight::color::get_rec2020_luminance_weights(flight_out);
  replace_haxe_array(out, flight_out);
}

void get_rec709_luminance_weights(::Array<double> out) {
  auto flight_out = to_flight_array(out);
  flight::color::get_rec709_luminance_weights(flight_out);
  replace_haxe_array(out, flight_out);
}

void hsl_to_rgb(::Array<double> out, double h, double s, double l) {
  auto flight_out = to_flight_array(out);
  flight::color::hsl_to_rgb(flight_out, h, s, l);
  replace_haxe_array(out, flight_out);
}

void hsv_to_rgb(::Array<double> out, double h, double s, double v) {
  auto flight_out = to_flight_array(out);
  flight::color::hsv_to_rgb(flight_out, h, s, v);
  replace_haxe_array(out, flight_out);
}

void linear_rgb_to_oklab(::Array<double> out, double r, double g, double b) {
  auto flight_out = to_flight_array(out);
  flight::color::linear_rgb_to_oklab(flight_out, r, g, b);
  replace_haxe_array(out, flight_out);
}

void oklab_to_linear_rgb(::Array<double> out, double L, double a, double b) {
  auto flight_out = to_flight_array(out);
  flight::color::oklab_to_linear_rgb(flight_out, L, a, b);
  replace_haxe_array(out, flight_out);
}

void unpack_color_rgba(::Array<double> out, double color) {
  auto flight_out = to_flight_array(out);
  flight::color::unpack_color_rgba(flight_out, color);
  replace_haxe_array(out, flight_out);
}

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
