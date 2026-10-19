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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/cameracontrols.cpp" />
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
@:include("flight_hx/cameracontrols.hpp")
extern class CameraControls {
  @:native("flight_hx::camera_controls::add_camera_shake_trauma")
  static function addCameraShakeTrauma(shake:flight.CameraShake, amount:Float):Void;

  @:native("flight_hx::camera_controls::clone_fly_camera_controller")
  static function cloneFlyCameraController(source:flight.FlyCameraController):flight.FlyCameraController;

  @:native("flight_hx::camera_controls::clone_orbit_camera_controller")
  static function cloneOrbitCameraController(source:flight.OrbitCameraController):flight.OrbitCameraController;

  @:native("flight_hx::camera_controls::copy_fly_camera_controller")
  static function copyFlyCameraController(out:flight.FlyCameraController, source:flight.FlyCameraController):Void;

  @:native("flight_hx::camera_controls::copy_orbit_camera_controller")
  static function copyOrbitCameraController(out:flight.OrbitCameraController, source:flight.OrbitCameraController):Void;

  @:native("flight_hx::camera_controls::create_camera_shake")
  static function createCameraShake(options:flight.CameraShakeOptions):flight.CameraShake;

  @:native("flight_hx::camera_controls::create_camera_shake_offset")
  static function createCameraShakeOffset():flight.CameraShakeOffset;

  @:native("flight_hx::camera_controls::create_fly_camera_controller")
  static function createFlyCameraController(options:flight.FlyCameraControllerOptions):flight.FlyCameraController;

  @:native("flight_hx::camera_controls::create_orbit_camera_controller")
  static function createOrbitCameraController(options:flight.OrbitCameraControllerOptions):flight.OrbitCameraController;

  @:native("flight_hx::camera_controls::dolly_orbit_camera_controller")
  static function dollyOrbitCameraController(controller:flight.OrbitCameraController, deltaDistance:Float):Void;

  @:native("flight_hx::camera_controls::look_fly_camera_controller")
  static function lookFlyCameraController(controller:flight.FlyCameraController, deltaYaw:Float, deltaPitch:Float):Void;

  @:native("flight_hx::camera_controls::move_fly_camera_controller")
  static function moveFlyCameraController(controller:flight.FlyCameraController, forward:Float, right:Float, up:Float):Void;

  @:native("flight_hx::camera_controls::pan_orbit_camera_controller")
  static function panOrbitCameraController(controller:flight.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;

  @:native("flight_hx::camera_controls::pan_orbit_camera_controller_in_view_plane")
  static function panOrbitCameraControllerInViewPlane(controller:flight.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;

  @:native("flight_hx::camera_controls::reset_camera_shake")
  static function resetCameraShake(shake:flight.CameraShake):Void;

  @:native("flight_hx::camera_controls::reset_fly_camera_controller")
  static function resetFlyCameraController(controller:flight.FlyCameraController, options:flight.FlyCameraControllerOptions):Void;

  @:native("flight_hx::camera_controls::reset_orbit_camera_controller")
  static function resetOrbitCameraController(controller:flight.OrbitCameraController, options:flight.OrbitCameraControllerOptions):Void;

  @:native("flight_hx::camera_controls::rotate_orbit_camera_controller")
  static function rotateOrbitCameraController(controller:flight.OrbitCameraController, deltaAzimuth:Float, deltaPolar:Float):Void;

  @:native("flight_hx::camera_controls::snap_fly_camera_controller")
  static function snapFlyCameraController(controller:flight.FlyCameraController):Void;

  @:native("flight_hx::camera_controls::snap_orbit_camera_controller")
  static function snapOrbitCameraController(controller:flight.OrbitCameraController):Void;

  @:native("flight_hx::camera_controls::update_camera_shake")
  static function updateCameraShake(shake:flight.CameraShake, dt:Float, out:flight.CameraShakeOffset):Void;
}
#end
