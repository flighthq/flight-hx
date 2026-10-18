// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/math.cpp" />
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
@:include("flight_hx/math.hpp")
extern class Math {
  @:native("flight_hx::math::ceil_power_of_two")
  static function ceilPowerOfTwo(n:Float):Float;

  @:native("flight_hx::math::ceil_to")
  static function ceilTo(value:Float, step:Float):Float;

  @:native("flight_hx::math::clamp")
  static function clamp(value:Float, min:Float, max:Float):Float;

  @:native("flight_hx::math::damp")
  static function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float;

  @:native("flight_hx::math::deg_to_rad_flight_value_function_deg_u000054_o_u000052_ad_flight_source_59eefa411bb2f66d")
  static function degToRad(degrees:Float):Float;

  @:native("flight_hx::math::delta_angle")
  static function deltaAngle(from:Float, to:Float):Float;

  @:native("flight_hx::math::euclidean_mod")
  static function euclideanMod(value:Float, divisor:Float):Float;

  @:native("flight_hx::math::factorial")
  static function factorial(n:Float):Float;

  @:native("flight_hx::math::floor_power_of_two")
  static function floorPowerOfTwo(n:Float):Float;

  @:native("flight_hx::math::floor_to")
  static function floorTo(value:Float, step:Float):Float;

  @:native("flight_hx::math::fract")
  static function fract(value:Float):Float;

  @:native("flight_hx::math::gcd")
  static function gcd(a:Float, b:Float):Float;

  @:native("flight_hx::math::hash_2d")
  static function hash2D(x:Float, y:Float):Float;

  @:native("flight_hx::math::hash_3d")
  static function hash3D(x:Float, y:Float, z:Float):Float;

  @:native("flight_hx::math::hash_combine")
  static function hashCombine(seed:Float, value:Float):Float;

  @:native("flight_hx::math::hash_uint32")
  static function hashUint32(value:Float):Float;

  @:native("flight_hx::math::hypot2")
  static function hypot2(x:Float, y:Float):Float;

  @:native("flight_hx::math::in_range")
  static function inRange(value:Float, min:Float, max:Float):Bool;

  @:native("flight_hx::math::inverse_lerp")
  static function inverseLerp(a:Float, b:Float, value:Float):Float;

  @:native("flight_hx::math::is_even")
  static function isEven(n:Float):Bool;

  @:native("flight_hx::math::is_odd")
  static function isOdd(n:Float):Bool;

  @:native("flight_hx::math::is_power_of_two")
  static function isPowerOfTwo(n:Float):Bool;

  @:native("flight_hx::math::lcm")
  static function lcm(a:Float, b:Float):Float;

  @:native("flight_hx::math::lerp")
  static function lerp(a:Float, b:Float, t:Float):Float;

  @:native("flight_hx::math::lerp_angle")
  static function lerpAngle(a:Float, b:Float, t:Float):Float;

  @:native("flight_hx::math::move_towards")
  static function moveTowards(current:Float, target:Float, maxDelta:Float):Float;

  @:native("flight_hx::math::next_multiple_of")
  static function nextMultipleOf(value:Float, multiple:Float):Float;

  @:native("flight_hx::math::next_power_of_two")
  static function nextPowerOfTwo(n:Float):Float;

  @:native("flight_hx::math::normalize_angle")
  static function normalizeAngle(radians:Float):Float;

  @:native("flight_hx::math::ping_pong")
  static function pingPong(t:Float, length:Float):Float;

  @:native("flight_hx::math::previous_power_of_two")
  static function previousPowerOfTwo(n:Float):Float;

  @:native("flight_hx::math::quantize")
  static function quantize(value:Float, steps:Float, min:Float, max:Float):Float;

  @:native("flight_hx::math::rad_to_deg_flight_value_function_rad_u000054_o_u000044_eg_flight_source_59eefa411bb2f66d")
  static function radToDeg(radians:Float):Float;

  @:native("flight_hx::math::remap")
  static function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float;

  @:native("flight_hx::math::repeat")
  static function repeat(t:Float, length:Float):Float;

  @:native("flight_hx::math::round_to")
  static function roundTo(value:Float, step:Float):Float;

  @:native("flight_hx::math::saturate")
  static function saturate(value:Float):Float;

  @:native("flight_hx::math::sign")
  static function sign(value:Float):Float;

  @:native("flight_hx::math::smoother_step")
  static function smootherStep(edge0:Float, edge1:Float, x:Float):Float;

  @:native("flight_hx::math::smooth_step")
  static function smoothStep(edge0:Float, edge1:Float, x:Float):Float;

  @:native("flight_hx::math::step")
  static function step(edge:Float, x:Float):Float;
}
#end
