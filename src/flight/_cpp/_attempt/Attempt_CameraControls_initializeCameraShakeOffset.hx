// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_initializeCameraShakeOffset extends AttemptConfig {
  @:native("flight::camera_controls::initialize_camera_shake_offset")
  public static function initializeCameraShakeOffset(out:flight.EntityConstruction<flight.CameraShakeOffset>):Void;
}
#end
