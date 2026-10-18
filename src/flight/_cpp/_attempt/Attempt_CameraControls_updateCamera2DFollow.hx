// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_updateCamera2DFollow extends AttemptConfig {
  @:native("flight::camera_controls::update_camera_2d_follow")
  public static function updateCamera2DFollow(camera:flight.Camera2D, viewportWidth:Float, viewportHeight:Float, targetX:Float, targetY:Float, deltaTime:Float, ?options:flight.Camera2DFollowOptions):Void;
}
#end
