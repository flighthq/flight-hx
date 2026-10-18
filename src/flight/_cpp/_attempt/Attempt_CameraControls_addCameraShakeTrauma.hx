// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_addCameraShakeTrauma extends AttemptConfig {
  @:native("flight::camera_controls::add_camera_shake_trauma")
  public static function addCameraShakeTrauma(shake:flight.CameraShake, amount:Float):Void;
}
#end
