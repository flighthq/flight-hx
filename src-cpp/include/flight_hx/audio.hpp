// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::audio {

::String get_audio_mime_type_parameter(::String mimeType, ::String name);
::String infer_audio_mime_type(::String url);
bool can_play_audio_type(flight::Ref<flight::types::HostAudioCodecCapability> hostAudioCodec, ::String mimeType);
flight::Ref<flight::types::AudioResource> clone_audio_resource(flight::Ref<flight::types::AudioResource> resource);
void dispose_audio_resource(flight::Ref<flight::types::AudioResource> resource);
flight_hx::Ref<flight::types::HostAudioDecodeFormatCapability> get_audio_decode_slot(flight::Ref<flight::types::HostAudioDecodeCapabilities> audioDecode, ::String mimeType);
double get_audio_resource_byte_size(flight::Ref<flight::types::AudioResource> resource);
double get_audio_resource_channel_count(flight::Ref<flight::types::AudioResource> resource);
double get_audio_resource_duration(flight::Ref<flight::types::AudioResource> resource);
double get_audio_resource_sample_rate(flight::Ref<flight::types::AudioResource> resource);
bool has_audio_decode_slot(flight::Ref<flight::types::HostAudioDecodeCapabilities> audioDecode, ::String mimeType);
bool has_audio_resource_buffer(flight::Ref<flight::types::AudioResource> resource);
bool is_audio_resource_empty(flight::Ref<flight::types::AudioResource> resource);

} // namespace flight_hx::audio
