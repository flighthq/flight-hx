// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_setOrthographicProjectionFrameToSphere extends AttemptConfig {
  @:native("flight::camera_controls::set_orthographic_projection_frame_to_sphere")
  public static function setOrthographicProjectionFrameToSphere(projection:flight.OrthographicProjection, radius:Float, aspect:Float, ?padding:Float):Void;
}
#end
