// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
import flight.*;
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<set name="HXCPP_NO_CPP11" value="1" />
<unset name="HXCPP_CPP11" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/audio.cpp" />
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/adapters/getAudioMimeTypeEssence_3829c80c.cpp" />
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/generated/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />
</files>
')
@:include("flight_hx/adapters/getAudioMimeTypeEssence_3829c80c.hpp")
@:include("flight_hx/audio.hpp")
extern class Audio {
  @:native("flight_hx::audio::get_audio_mime_type_parameter")
  static function getAudioMimeTypeParameter(mimeType:String, name:String):Null<String>;

  @:native("flight_hx::audio::infer_audio_mime_type")
  static function inferAudioMimeType(url:String):Null<String>;

  @:native("flight_hx::haxe::_cpp::getAudioMimeTypeEssence_3829c80c")
  static function getAudioMimeTypeEssence(mimeType:String):String;
}
#end
