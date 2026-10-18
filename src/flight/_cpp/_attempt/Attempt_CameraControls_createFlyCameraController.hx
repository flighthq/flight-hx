// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_createFlyCameraController extends AttemptConfig {
  @:native("flight::camera_controls::create_fly_camera_controller")
  public static function createFlyCameraController(?options:flight.FlyCameraControllerOptions):flight.FlyCameraController;
}
#end
