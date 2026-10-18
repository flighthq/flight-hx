// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_updateCameraShake extends AttemptConfig {
  @:native("flight::camera_controls::update_camera_shake")
  public static function updateCameraShake(shake:flight.CameraShake, dt:Float, out:flight.CameraShakeOffset):Void;
}
#end
