// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_rotateOrbitCameraController extends AttemptConfig {
  @:native("flight::camera_controls::rotate_orbit_camera_controller")
  public static function rotateOrbitCameraController(controller:flight.OrbitCameraController, deltaAzimuth:Float, deltaPolar:Float):Void;
}
#end
