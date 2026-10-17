package flight._cpp._fn;

#if cpp
// Direct hxcpp bindings for the representative Math subset recorded in src-cpp/manifest.json.
// The bridge includes the pinned generated flight-cpp headers and only adapts their namespace
// collision with hxcpp's generated `null()` calls; the operations still execute flight-cpp code.
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<files id="haxe">
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" />
</files>
')
@:include("flight_hx/math.hpp")
extern class Math {
  @:native("flight_hx::math::clamp")
  static function clamp(value:Float, min:Float, max:Float):Float;

  @:native("flight_hx::math::lerp")
  static function lerp(a:Float, b:Float, t:Float):Float;

  @:native("flight_hx::math::saturate")
  static function saturate(value:Float):Float;
}
#end
