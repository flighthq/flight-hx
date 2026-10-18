// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_moveFlyCameraController extends AttemptConfig {
  @:native("flight::camera_controls::move_fly_camera_controller")
  public static function moveFlyCameraController(controller:flight.FlyCameraController, forward:Float, right:Float, up:Float):Void;
}
#end
