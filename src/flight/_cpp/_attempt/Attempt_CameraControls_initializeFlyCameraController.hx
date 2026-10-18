// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_initializeFlyCameraController extends AttemptConfig {
  @:native("flight::camera_controls::initialize_fly_camera_controller")
  public static function initializeFlyCameraController(out:flight.EntityConstruction<flight.FlyCameraController>, ?options:flight.FlyCameraControllerOptions):Void;
}
#end
