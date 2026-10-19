// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/audio/contract.hpp>
#include <flight_hx/audio.hpp>

namespace flight_hx::audio {

::String get_audio_mime_type_parameter(::String mimeType, ::String name) {
  const flight::String flight_mimeType = flight::String::from_utf8(mimeType.utf8_str());
  const flight::String flight_name = flight::String::from_utf8(name.utf8_str());
  const auto result = flight::audio::get_audio_mime_type_parameter(flight_mimeType, flight_name);
  if (!result.has_value()) return null();
  const std::string result_utf8 = result->to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String infer_audio_mime_type(::String url) {
  const flight::String flight_url = flight::String::from_utf8(url.utf8_str());
  const auto result = flight::audio::infer_audio_mime_type(flight_url);
  if (!result.has_value()) return null();
  const std::string result_utf8 = result->to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

} // namespace flight_hx::audio
