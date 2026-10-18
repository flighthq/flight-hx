// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/font_formats/open_type_cmap.hpp>
#include <flight/font_formats/woff2_glyf_transform.hpp>
#include <flight_hx/fontformats.hpp>

namespace flight_hx::font_formats {

double get_woff2_bbox_bitmap_byte_length(double glyphCount) {
  return flight::font_formats::get_woff2_bbox_bitmap_byte_length(glyphCount);
}

bool is_woff2_point_on_curve(double flag) {
  return flight::font_formats::is_woff2_point_on_curve(flag);
}

double rank_open_type_unicode_encoding(double platform, double encoding) {
  return flight::font_formats::rank_open_type_unicode_encoding(platform, encoding);
}

} // namespace flight_hx::font_formats
