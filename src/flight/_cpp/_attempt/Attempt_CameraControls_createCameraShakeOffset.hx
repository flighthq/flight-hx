// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_createCameraShakeOffset extends AttemptConfig {
  @:native("flight::camera_controls::create_camera_shake_offset")
  public static function createCameraShakeOffset():flight.CameraShakeOffset;
}
#end
