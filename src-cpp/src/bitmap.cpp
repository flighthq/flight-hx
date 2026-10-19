// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/bitmap/contract.hpp>
#include <flight_hx/bitmap.hpp>

namespace flight_hx::bitmap {

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

void build_bitmap_brightness_color_matrix(::Array<double> out, double amount) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::build_bitmap_brightness_color_matrix(flight_out, amount);
  replace_haxe_array(out, flight_out);
}

void build_bitmap_contrast_color_matrix(::Array<double> out, double amount) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::build_bitmap_contrast_color_matrix(flight_out, amount);
  replace_haxe_array(out, flight_out);
}

void build_bitmap_grayscale_color_matrix(::Array<double> out) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::build_bitmap_grayscale_color_matrix(flight_out);
  replace_haxe_array(out, flight_out);
}

void build_bitmap_hue_rotation_color_matrix(::Array<double> out, double degrees) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::build_bitmap_hue_rotation_color_matrix(flight_out, degrees);
  replace_haxe_array(out, flight_out);
}

void build_bitmap_invert_color_matrix(::Array<double> out) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::build_bitmap_invert_color_matrix(flight_out);
  replace_haxe_array(out, flight_out);
}

void build_bitmap_saturation_color_matrix(::Array<double> out, double amount) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::build_bitmap_saturation_color_matrix(flight_out, amount);
  replace_haxe_array(out, flight_out);
}

void build_bitmap_sepia_color_matrix(::Array<double> out) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::build_bitmap_sepia_color_matrix(flight_out);
  replace_haxe_array(out, flight_out);
}

void concat_bitmap_color_matrix(::Array<double> out, ::Array<double> first, ::Array<double> second) {
  auto flight_out = to_flight_array(out);
  auto flight_first = first.GetPtr() == out.GetPtr() ? flight_out : (to_flight_array(first));
  auto flight_second = second.GetPtr() == out.GetPtr() ? flight_out : (second.GetPtr() == first.GetPtr() ? flight_first : (to_flight_array(second)));
  flight::bitmap::concat_bitmap_color_matrix(flight_out, flight_first, flight_second);
  replace_haxe_array(out, flight_out);
  replace_haxe_array(first, flight_first);
  replace_haxe_array(second, flight_second);
}

void set_bitmap_color_matrix_identity(::Array<double> out) {
  auto flight_out = to_flight_array(out);
  flight::bitmap::set_bitmap_color_matrix_identity(flight_out);
  replace_haxe_array(out, flight_out);
}

} // namespace flight_hx::bitmap
