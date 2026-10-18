// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_resetOrbitCameraController extends AttemptConfig {
  @:native("flight::camera_controls::reset_orbit_camera_controller")
  public static function resetOrbitCameraController(controller:flight.OrbitCameraController, ?options:flight.OrbitCameraControllerOptions):Void;
}
#end
