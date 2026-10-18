// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/bitmapfont.cpp" />
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
@:include("flight_hx/bitmapfont.hpp")
extern class Bitmapfont {
  @:native("flight_hx::bitmapfont::pack_bitmap_font_kerning_key")
  static function packBitmapFontKerningKey(left:Float, right:Float):Float;
}
#end
