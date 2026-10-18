// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_updateFlyCameraController extends AttemptConfig {
  @:native("flight::camera_controls::update_fly_camera_controller")
  public static function updateFlyCameraController(controller:flight.FlyCameraController, camera:flight.Camera3D, deltaTime:Float):Void;
}
#end
