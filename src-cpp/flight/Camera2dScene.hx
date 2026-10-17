package flight;

#if cpp
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_cpp_build must name a CMake build containing the flight-cpp SDL/GL host" unless="flight_cpp_build" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/camera2d_scene.cpp" />
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
<target id="haxe">
  <lib name="${removeQuotes:flight_cpp_build}/flight_host_sdl_gl.lib" if="windows" />
  <lib name="${removeQuotes:flight_cpp_build}/flight_host_sdl.lib" if="windows" />
  <lib name="SDL3.lib" if="windows" />
  <lib name="${removeQuotes:flight_cpp_build}/libflight_host_sdl_gl.a" unless="windows" />
  <lib name="${removeQuotes:flight_cpp_build}/libflight_host_sdl.a" unless="windows" />
  <lib name="-lSDL3" unless="windows" />
</target>
')
@:include("flight_hx/camera2d_scene.hpp")
@:native("flight_hx::camera2d::Scene")
extern class Camera2dScene {
  @:native("flight_hx::camera2d::create")
  static function create(width:Int, height:Int):cpp.Pointer<Camera2dScene>;
  @:native("flight_hx::camera2d::destroy")
  static function destroy(scene:cpp.Pointer<Camera2dScene>):Void;
  @:native("flight_hx::camera2d::root")
  static function root(scene:cpp.Pointer<Camera2dScene>):Int;
  @:native("flight_hx::camera2d::create_display_object")
  static function createDisplayObject(scene:cpp.Pointer<Camera2dScene>, parent:Int):Int;
  @:native("flight_hx::camera2d::create_shape")
  static function createShape(scene:cpp.Pointer<Camera2dScene>, parent:Int):Int;
  @:native("flight_hx::camera2d::begin_fill")
  static function beginFill(scene:cpp.Pointer<Camera2dScene>, handle:Int, color:Float, alpha:Float):Void;
  @:native("flight_hx::camera2d::end_fill")
  static function endFill(scene:cpp.Pointer<Camera2dScene>, handle:Int):Void;
  @:native("flight_hx::camera2d::line_style")
  static function lineStyle(scene:cpp.Pointer<Camera2dScene>, handle:Int, thickness:Float, color:Float, alpha:Float):Void;
  @:native("flight_hx::camera2d::circle")
  static function circle(scene:cpp.Pointer<Camera2dScene>, handle:Int, x:Float, y:Float, radius:Float):Void;
  @:native("flight_hx::camera2d::ellipse")
  static function ellipse(scene:cpp.Pointer<Camera2dScene>, handle:Int, x:Float, y:Float, radiusX:Float, radiusY:Float):Void;
  @:native("flight_hx::camera2d::rectangle")
  static function rectangle(scene:cpp.Pointer<Camera2dScene>, handle:Int, x:Float, y:Float, width:Float, height:Float):Void;
  @:native("flight_hx::camera2d::triangle")
  static function triangle(scene:cpp.Pointer<Camera2dScene>, handle:Int, x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float):Void;
  @:native("flight_hx::camera2d::move_to")
  static function moveTo(scene:cpp.Pointer<Camera2dScene>, handle:Int, x:Float, y:Float):Void;
  @:native("flight_hx::camera2d::line_to")
  static function lineTo(scene:cpp.Pointer<Camera2dScene>, handle:Int, x:Float, y:Float):Void;
  @:native("flight_hx::camera2d::set_transform")
  static function setTransform(scene:cpp.Pointer<Camera2dScene>, handle:Int, scaleX:Float, skewY:Float, skewX:Float, scaleY:Float, x:Float, y:Float):Void;
  @:native("flight_hx::camera2d::render_frame")
  static function renderFrame(scene:cpp.Pointer<Camera2dScene>):Bool;
  @:native("flight_hx::camera2d::node_count")
  static function nodeCount(scene:cpp.Pointer<Camera2dScene>):Int;
  @:native("flight_hx::camera2d::shape_count")
  static function shapeCount(scene:cpp.Pointer<Camera2dScene>):Int;
  @:native("flight_hx::camera2d::verified_frames")
  static function verifiedFrames(scene:cpp.Pointer<Camera2dScene>):Int;
  @:native("flight_hx::camera2d::maximum_coverage")
  static function maximumCoverage(scene:cpp.Pointer<Camera2dScene>):Int;
}
#end
