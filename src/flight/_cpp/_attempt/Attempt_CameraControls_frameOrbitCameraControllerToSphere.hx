// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/camera_controls/contract.hpp")
extern class Attempt_CameraControls_frameOrbitCameraControllerToSphere extends AttemptConfig {
  @:native("flight::camera_controls::frame_orbit_camera_controller_to_sphere")
  public static function frameOrbitCameraControllerToSphere(controller:flight.OrbitCameraController, projection:flight.Projection, sphere:flight.BoundingSphereLike, aspect:Float, ?padding:Float):Bool;
}
#end
