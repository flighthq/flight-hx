package flight._cpp._fn;

#if cpp
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_cpp_build must name a CMake build containing the flight-cpp SDL/GL host" unless="flight_cpp_build" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<files id="haxe">
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
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
@:include("flight_hx/host_sdl_gl.hpp")
extern class HostSdlGl {
  @:native("flight_hx::host_sdl_gl::smoke")
  static function smoke(width:Int, height:Int):Bool;
}
#end
