// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/skeleton2dformats.cpp" />
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
@:include("flight_hx/skeleton2dformats.hpp")
extern class Skeleton2dFormats {
  @:native("flight_hx::skeleton2d_formats::clamp_spine_binary_unit")
  static function clampSpineBinaryUnit(value:Float):Float;
}
#end
