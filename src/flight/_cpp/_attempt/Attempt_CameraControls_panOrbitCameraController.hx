// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_panOrbitCameraController extends AttemptConfig {
  @:native("flight::camera_controls::pan_orbit_camera_controller")
  public static function panOrbitCameraController(controller:flight.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
}
#end
