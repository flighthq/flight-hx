// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_initializeCameraShake extends AttemptConfig {
  @:native("flight::camera_controls::initialize_camera_shake")
  public static function initializeCameraShake(out:flight.EntityConstruction<flight.CameraShake>, ?options:flight.CameraShakeOptions):Void;
}
#end
