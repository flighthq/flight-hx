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

void apply_bitmap_levels(flight::Ref<flight::types::BitmapRegion> out, flight::Ref<flight::types::BitmapRegion> source, bool blackPointPresent, double blackPoint, bool whitePointPresent, double whitePoint, bool gammaPresent, double gamma) {
  flight::bitmap::apply_bitmap_levels(out, source, (blackPointPresent ? std::optional<double>{blackPoint} : std::nullopt), (whitePointPresent ? std::optional<double>{whitePoint} : std::nullopt), (gammaPresent ? std::optional<double>{gamma} : std::nullopt));
}

flight::Ref<flight::types::Bitmap> clone_bitmap(flight::Ref<flight::types::Bitmap> source) {
  return flight::bitmap::clone_bitmap(source);
}

void copy_bitmap_alpha(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source) {
  flight::bitmap::copy_bitmap_alpha(dest, source);
}

void copy_bitmap_pixels(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source, bool compositePresent, bool composite) {
  flight::bitmap::copy_bitmap_pixels(dest, source, (compositePresent ? std::optional<bool>{composite} : std::nullopt));
}

flight::Ref<flight::types::Bitmap> create_bitmap(double width, double height, bool colorPresent, double color) {
  return flight::bitmap::create_bitmap(width, height, (colorPresent ? std::optional<double>{color} : std::nullopt));
}

flight::Ref<flight::types::BitmapRegion> create_bitmap_region(flight::Ref<flight::types::Bitmap> bitmap, bool xPresent, double x, bool yPresent, double y, bool widthPresent, double width, bool heightPresent, double height) {
  return flight::bitmap::create_bitmap_region(bitmap, (xPresent ? std::optional<double>{x} : std::nullopt), (yPresent ? std::optional<double>{y} : std::nullopt), (widthPresent ? std::optional<double>{width} : std::nullopt), (heightPresent ? std::optional<double>{height} : std::nullopt));
}

double dissolve_bitmap_pixels(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source, double seed, double pixelCount, bool fillColorPresent, double fillColor) {
  return flight::bitmap::dissolve_bitmap_pixels(dest, source, seed, pixelCount, (fillColorPresent ? std::optional<double>{fillColor} : std::nullopt));
}

void equalize_bitmap_histogram(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source) {
  flight::bitmap::equalize_bitmap_histogram(dest, source);
}

void fill_bitmap_noise(flight::Ref<flight::types::BitmapRegion> dest, double seed, bool lowPresent, double low, bool highPresent, double high, bool grayScalePresent, bool grayScale) {
  flight::bitmap::fill_bitmap_noise(dest, seed, (lowPresent ? std::optional<double>{low} : std::nullopt), (highPresent ? std::optional<double>{high} : std::nullopt), (grayScalePresent ? std::optional<bool>{grayScale} : std::nullopt));
}

void fill_bitmap_perlin_noise(flight::Ref<flight::types::BitmapRegion> dest, double baseX, double baseY, double octaves, double seed, bool grayScalePresent, bool grayScale, bool stitchPresent, bool stitch, bool channelOptionsPresent, double channelOptions) {
  flight::bitmap::fill_bitmap_perlin_noise(dest, baseX, baseY, octaves, seed, (grayScalePresent ? std::optional<bool>{grayScale} : std::nullopt), (stitchPresent ? std::optional<bool>{stitch} : std::nullopt), (channelOptionsPresent ? std::optional<double>{channelOptions} : std::nullopt));
}

void fill_bitmap_rectangle(flight::Ref<flight::types::BitmapRegion> dest, double color) {
  flight::bitmap::fill_bitmap_rectangle(dest, color);
}

void fill_bitmap_turbulence(flight::Ref<flight::types::BitmapRegion> dest, double baseX, double baseY, double octaves, double seed, bool grayScalePresent, bool grayScale, bool stitchPresent, bool stitch, bool channelOptionsPresent, double channelOptions) {
  flight::bitmap::fill_bitmap_turbulence(dest, baseX, baseY, octaves, seed, (grayScalePresent ? std::optional<bool>{grayScale} : std::nullopt), (stitchPresent ? std::optional<bool>{stitch} : std::nullopt), (channelOptionsPresent ? std::optional<double>{channelOptions} : std::nullopt));
}

void flip_bitmap_horizontal(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source) {
  flight::bitmap::flip_bitmap_horizontal(dest, source);
}

void flip_bitmap_vertical(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source) {
  flight::bitmap::flip_bitmap_vertical(dest, source);
}

void flood_fill_bitmap(flight::Ref<flight::types::Bitmap> out, double x, double y, double color) {
  flight::bitmap::flood_fill_bitmap(out, x, y, color);
}

double get_bitmap_coverage(flight::Ref<flight::types::Bitmap> source, double backgroundColor, bool channelTolerancePresent, double channelTolerance) {
  return flight::bitmap::get_bitmap_coverage(source, backgroundColor, (channelTolerancePresent ? std::optional<double>{channelTolerance} : std::nullopt));
}

double get_bitmap_pixel(flight::Ref<flight::types::Bitmap> source, double x, double y) {
  return flight::bitmap::get_bitmap_pixel(source, x, y);
}

double get_bitmap_pixel_luminance(flight::Ref<flight::types::Bitmap> source, double x, double y) {
  return flight::bitmap::get_bitmap_pixel_luminance(source, x, y);
}

double get_bitmap_pixel_rgb(flight::Ref<flight::types::Bitmap> source, double x, double y) {
  return flight::bitmap::get_bitmap_pixel_rgb(source, x, y);
}

void invalidate_bitmap(flight::Ref<flight::types::Bitmap> bitmap) {
  flight::bitmap::invalidate_bitmap(bitmap);
}

void merge_bitmap(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source, double redScale, double greenScale, double blueScale, double alphaScale) {
  flight::bitmap::merge_bitmap(dest, source, redScale, greenScale, blueScale, alphaScale);
}

void merge_bitmap_channels(flight::Ref<flight::types::BitmapRegion> out, flight::Ref<flight::types::BitmapRegion> r, flight::Ref<flight::types::BitmapRegion> g, flight::Ref<flight::types::BitmapRegion> b, flight::Ref<flight::types::BitmapRegion> a) {
  flight::bitmap::merge_bitmap_channels(out, r, g, b, a);
}

void multiply_bitmap_alpha(flight::Ref<flight::types::BitmapRegion> out, double factor) {
  flight::bitmap::multiply_bitmap_alpha(out, factor);
}

void rotate_bitmap180(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source) {
  flight::bitmap::rotate_bitmap180(dest, source);
}

void rotate_bitmap_clockwise(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source) {
  flight::bitmap::rotate_bitmap_clockwise(dest, source);
}

void rotate_bitmap_counter_clockwise(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source) {
  flight::bitmap::rotate_bitmap_counter_clockwise(dest, source);
}

void scroll_bitmap(flight::Ref<flight::types::Bitmap> out, double dx, double dy) {
  flight::bitmap::scroll_bitmap(out, dx, dy);
}

void set_bitmap_alpha(flight::Ref<flight::types::BitmapRegion> out, double alpha) {
  flight::bitmap::set_bitmap_alpha(out, alpha);
}

void set_bitmap_pixel(flight::Ref<flight::types::Bitmap> out, double x, double y, double color) {
  flight::bitmap::set_bitmap_pixel(out, x, y, color);
}

void set_bitmap_pixel_rgb(flight::Ref<flight::types::Bitmap> out, double x, double y, double color) {
  flight::bitmap::set_bitmap_pixel_rgb(out, x, y, color);
}

flight::Ref<flight::types::BitmapRegion> set_bitmap_region(flight::Ref<flight::types::BitmapRegion> out, flight::Ref<flight::types::Bitmap> bitmap, bool xPresent, double x, bool yPresent, double y, bool widthPresent, double width, bool heightPresent, double height) {
  return flight::bitmap::set_bitmap_region(out, bitmap, (xPresent ? std::optional<double>{x} : std::nullopt), (yPresent ? std::optional<double>{y} : std::nullopt), (widthPresent ? std::optional<double>{width} : std::nullopt), (heightPresent ? std::optional<double>{height} : std::nullopt));
}

flight::Ref<flight::types::Bitmap> trim_bitmap(flight::Ref<flight::types::Bitmap> source) {
  return flight::bitmap::trim_bitmap(source);
}

double compare_bitmap_fingerprints(flight::Ref<flight::types::BitmapFingerprint> a, flight::Ref<flight::types::BitmapFingerprint> b) {
  return flight::bitmap::compare_bitmap_fingerprints(a, b);
}

flight::Ref<flight::types::BitmapFingerprint> create_bitmap_fingerprint(flight::Ref<flight::types::Bitmap> source, bool gridSizePresent, double gridSize) {
  return flight::bitmap::create_bitmap_fingerprint(source, (gridSizePresent ? std::optional<double>{gridSize} : std::nullopt));
}

flight::Ref<flight::types::BitmapHistogram> get_bitmap_histogram(flight::Ref<flight::types::BitmapRegion> source) {
  return flight::bitmap::get_bitmap_histogram(source);
}

} // namespace flight_hx::bitmap
