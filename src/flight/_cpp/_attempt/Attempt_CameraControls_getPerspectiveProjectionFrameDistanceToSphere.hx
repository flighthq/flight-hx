// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_getPerspectiveProjectionFrameDistanceToSphere extends AttemptConfig {
  @:native("flight::camera_controls::get_perspective_projection_frame_distance_to_sphere")
  public static function getPerspectiveProjectionFrameDistanceToSphere(projection:flight.PerspectiveProjection, radius:Float, aspect:Float, ?padding:Float):Float;
}
#end
