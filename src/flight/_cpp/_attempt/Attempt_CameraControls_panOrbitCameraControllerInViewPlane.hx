// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_panOrbitCameraControllerInViewPlane extends AttemptConfig {
  @:native("flight::camera_controls::pan_orbit_camera_controller_in_view_plane")
  public static function panOrbitCameraControllerInViewPlane(controller:flight.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
}
#end
