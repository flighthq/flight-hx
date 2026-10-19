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

bool can_play_audio_type(flight::Ref<flight::types::HostAudioCodecCapability> hostAudioCodec, ::String mimeType) {
  return flight::audio::can_play_audio_type(hostAudioCodec, flight::String::from_utf8(mimeType.utf8_str()));
}

flight::Ref<flight::types::AudioResource> clone_audio_resource(flight::Ref<flight::types::AudioResource> resource) {
  return flight::audio::clone_audio_resource(resource);
}

void dispose_audio_resource(flight::Ref<flight::types::AudioResource> resource) {
  flight::audio::dispose_audio_resource(resource);
}

flight_hx::Ref<flight::types::HostAudioDecodeFormatCapability> get_audio_decode_slot(flight::Ref<flight::types::HostAudioDecodeCapabilities> audioDecode, ::String mimeType) {
  const auto result = flight::audio::get_audio_decode_slot(audioDecode, flight::String::from_utf8(mimeType.utf8_str()));
  return result.has_value() ? flight_hx::Ref<flight::types::HostAudioDecodeFormatCapability>{result.value()} : flight_hx::Ref<flight::types::HostAudioDecodeFormatCapability>{};
}

double get_audio_resource_byte_size(flight::Ref<flight::types::AudioResource> resource) {
  return flight::audio::get_audio_resource_byte_size(resource);
}

double get_audio_resource_channel_count(flight::Ref<flight::types::AudioResource> resource) {
  return flight::audio::get_audio_resource_channel_count(resource);
}

double get_audio_resource_duration(flight::Ref<flight::types::AudioResource> resource) {
  return flight::audio::get_audio_resource_duration(resource);
}

double get_audio_resource_sample_rate(flight::Ref<flight::types::AudioResource> resource) {
  return flight::audio::get_audio_resource_sample_rate(resource);
}

bool has_audio_decode_slot(flight::Ref<flight::types::HostAudioDecodeCapabilities> audioDecode, ::String mimeType) {
  return flight::audio::has_audio_decode_slot(audioDecode, flight::String::from_utf8(mimeType.utf8_str()));
}

bool has_audio_resource_buffer(flight::Ref<flight::types::AudioResource> resource) {
  return flight::audio::has_audio_resource_buffer(resource);
}

bool is_audio_resource_empty(flight::Ref<flight::types::AudioResource> resource) {
  return flight::audio::is_audio_resource_empty(resource);
}

} // namespace flight_hx::audio
