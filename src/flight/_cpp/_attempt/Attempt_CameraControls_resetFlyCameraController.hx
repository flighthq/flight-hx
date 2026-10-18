// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_resetFlyCameraController extends AttemptConfig {
  @:native("flight::camera_controls::reset_fly_camera_controller")
  public static function resetFlyCameraController(controller:flight.FlyCameraController, ?options:flight.FlyCameraControllerOptions):Void;
}
#end
