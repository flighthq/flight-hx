// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

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
void apply_bitmap_levels(flight::Ref<flight::types::BitmapRegion> out, flight::Ref<flight::types::BitmapRegion> source, bool blackPointPresent, double blackPoint, bool whitePointPresent, double whitePoint, bool gammaPresent, double gamma);
flight::Ref<flight::types::Bitmap> clone_bitmap(flight::Ref<flight::types::Bitmap> source);
void copy_bitmap_alpha(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source);
void copy_bitmap_pixels(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source, bool compositePresent, bool composite);
flight::Ref<flight::types::Bitmap> create_bitmap(double width, double height, bool colorPresent, double color);
flight::Ref<flight::types::BitmapRegion> create_bitmap_region(flight::Ref<flight::types::Bitmap> bitmap, bool xPresent, double x, bool yPresent, double y, bool widthPresent, double width, bool heightPresent, double height);
double dissolve_bitmap_pixels(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source, double seed, double pixelCount, bool fillColorPresent, double fillColor);
void equalize_bitmap_histogram(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source);
void fill_bitmap_noise(flight::Ref<flight::types::BitmapRegion> dest, double seed, bool lowPresent, double low, bool highPresent, double high, bool grayScalePresent, bool grayScale);
void fill_bitmap_perlin_noise(flight::Ref<flight::types::BitmapRegion> dest, double baseX, double baseY, double octaves, double seed, bool grayScalePresent, bool grayScale, bool stitchPresent, bool stitch, bool channelOptionsPresent, double channelOptions);
void fill_bitmap_rectangle(flight::Ref<flight::types::BitmapRegion> dest, double color);
void fill_bitmap_turbulence(flight::Ref<flight::types::BitmapRegion> dest, double baseX, double baseY, double octaves, double seed, bool grayScalePresent, bool grayScale, bool stitchPresent, bool stitch, bool channelOptionsPresent, double channelOptions);
void flip_bitmap_horizontal(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source);
void flip_bitmap_vertical(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source);
void flood_fill_bitmap(flight::Ref<flight::types::Bitmap> out, double x, double y, double color);
double get_bitmap_coverage(flight::Ref<flight::types::Bitmap> source, double backgroundColor, bool channelTolerancePresent, double channelTolerance);
double get_bitmap_pixel(flight::Ref<flight::types::Bitmap> source, double x, double y);
double get_bitmap_pixel_luminance(flight::Ref<flight::types::Bitmap> source, double x, double y);
double get_bitmap_pixel_rgb(flight::Ref<flight::types::Bitmap> source, double x, double y);
void invalidate_bitmap(flight::Ref<flight::types::Bitmap> bitmap);
void merge_bitmap(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source, double redScale, double greenScale, double blueScale, double alphaScale);
void merge_bitmap_channels(flight::Ref<flight::types::BitmapRegion> out, flight::Ref<flight::types::BitmapRegion> r, flight::Ref<flight::types::BitmapRegion> g, flight::Ref<flight::types::BitmapRegion> b, flight::Ref<flight::types::BitmapRegion> a);
void multiply_bitmap_alpha(flight::Ref<flight::types::BitmapRegion> out, double factor);
void rotate_bitmap180(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source);
void rotate_bitmap_clockwise(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source);
void rotate_bitmap_counter_clockwise(flight::Ref<flight::types::BitmapRegion> dest, flight::Ref<flight::types::BitmapRegion> source);
void scroll_bitmap(flight::Ref<flight::types::Bitmap> out, double dx, double dy);
void set_bitmap_alpha(flight::Ref<flight::types::BitmapRegion> out, double alpha);
void set_bitmap_pixel(flight::Ref<flight::types::Bitmap> out, double x, double y, double color);
void set_bitmap_pixel_rgb(flight::Ref<flight::types::Bitmap> out, double x, double y, double color);
flight::Ref<flight::types::BitmapRegion> set_bitmap_region(flight::Ref<flight::types::BitmapRegion> out, flight::Ref<flight::types::Bitmap> bitmap, bool xPresent, double x, bool yPresent, double y, bool widthPresent, double width, bool heightPresent, double height);
flight::Ref<flight::types::Bitmap> trim_bitmap(flight::Ref<flight::types::Bitmap> source);
double compare_bitmap_fingerprints(flight::Ref<flight::types::BitmapFingerprint> a, flight::Ref<flight::types::BitmapFingerprint> b);
flight::Ref<flight::types::BitmapFingerprint> create_bitmap_fingerprint(flight::Ref<flight::types::Bitmap> source, bool gridSizePresent, double gridSize);
flight::Ref<flight::types::BitmapHistogram> get_bitmap_histogram(flight::Ref<flight::types::BitmapRegion> source);

} // namespace flight_hx::bitmap
