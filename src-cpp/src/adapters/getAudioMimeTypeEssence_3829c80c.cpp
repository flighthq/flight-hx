// Generated from flight-compiler native-planning.json. Do not edit.
#include <hxcpp.h>
#include <optional>
#include <string>
#include <flight/audio/contract.hpp>

namespace flight_hx::haxe::_cpp {
// String values are copied through UTF-8 in both directions; neither runtime borrows the other string storage.
::String getAudioMimeTypeEssence_3829c80c(::String argument_0) {
  const flight::String flight_argument_0 = flight::String::from_utf8(argument_0.utf8_str());
  const flight::String flight_result = flight::audio::get_audio_mime_type_essence(flight_argument_0);
  const std::string haxe_result_utf8 = flight_result.to_utf8();
  return ::String(haxe_result_utf8.data(), haxe_result_utf8.size());
}
} // namespace flight_hx::haxe::_cpp
