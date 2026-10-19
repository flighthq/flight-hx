// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/path_formats/contract.hpp>
#include <flight_hx/pathformats.hpp>

namespace flight_hx::path_formats {

bool append_svg_path_data(flight::Ref<flight::types::Path> path, ::String d) {
  return flight::path_formats::append_svg_path_data(path, flight::String::from_utf8(d.utf8_str()));
}

::String format_svg_path_data(flight::Ref<flight::types::Path> path, flight::Ref<flight::types::SvgPathDataFormatOptions> options) {
  const auto result = flight::path_formats::format_svg_path_data(path, (options ? std::optional<flight::Ref<flight::types::SvgPathDataFormatOptions>>{options} : std::nullopt));
  const std::string result_utf8 = result.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

flight_hx::Ref<flight::types::Path> parse_svg_path_data(::String d) {
  const auto result = flight::path_formats::parse_svg_path_data(flight::String::from_utf8(d.utf8_str()));
  return result.has_value() ? flight_hx::Ref<flight::types::Path>{result.value()} : flight_hx::Ref<flight::types::Path>{};
}

} // namespace flight_hx::path_formats
