// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/camera_controls/contract.hpp>
#include <flight_hx/cameracontrols.hpp>

namespace flight_hx::camera_controls {

void add_camera_shake_trauma(flight::Ref<flight::types::CameraShake> shake, double amount) {
  flight::camera_controls::add_camera_shake_trauma(shake, amount);
}

flight::Ref<flight::types::FlyCameraController> clone_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> source) {
  return flight::camera_controls::clone_fly_camera_controller(source);
}

flight::Ref<flight::types::OrbitCameraController> clone_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> source) {
  return flight::camera_controls::clone_orbit_camera_controller(source);
}

void copy_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> out, flight::Ref<flight::types::FlyCameraController> source) {
  flight::camera_controls::copy_fly_camera_controller(out, source);
}

void copy_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> out, flight::Ref<flight::types::OrbitCameraController> source) {
  flight::camera_controls::copy_orbit_camera_controller(out, source);
}

flight::Ref<flight::types::CameraShake> create_camera_shake(flight::Ref<flight::types::CameraShakeOptions> options) {
  return flight::camera_controls::create_camera_shake((options ? std::optional<flight::Ref<flight::types::CameraShakeOptions>>{options} : std::nullopt));
}

flight::Ref<flight::types::CameraShakeOffset> create_camera_shake_offset() {
  return flight::camera_controls::create_camera_shake_offset();
}

flight::Ref<flight::types::FlyCameraController> create_fly_camera_controller(flight::Ref<flight::types::FlyCameraControllerOptions> options) {
  return flight::camera_controls::create_fly_camera_controller((options ? std::optional<flight::Ref<flight::types::FlyCameraControllerOptions>>{options} : std::nullopt));
}

flight::Ref<flight::types::OrbitCameraController> create_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraControllerOptions> options) {
  return flight::camera_controls::create_orbit_camera_controller((options ? std::optional<flight::Ref<flight::types::OrbitCameraControllerOptions>>{options} : std::nullopt));
}

void dolly_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, double deltaDistance) {
  flight::camera_controls::dolly_orbit_camera_controller(controller, deltaDistance);
}

void look_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, double deltaYaw, double deltaPitch) {
  flight::camera_controls::look_fly_camera_controller(controller, deltaYaw, deltaPitch);
}

void move_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, double forward, double right, double up) {
  flight::camera_controls::move_fly_camera_controller(controller, forward, right, up);
}

void pan_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, double deltaRight, double deltaUp) {
  flight::camera_controls::pan_orbit_camera_controller(controller, deltaRight, deltaUp);
}

void pan_orbit_camera_controller_in_view_plane(flight::Ref<flight::types::OrbitCameraController> controller, double deltaRight, double deltaUp) {
  flight::camera_controls::pan_orbit_camera_controller_in_view_plane(controller, deltaRight, deltaUp);
}

void reset_camera_shake(flight::Ref<flight::types::CameraShake> shake) {
  flight::camera_controls::reset_camera_shake(shake);
}

void reset_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, flight::Ref<flight::types::FlyCameraControllerOptions> options) {
  flight::camera_controls::reset_fly_camera_controller(controller, (options ? std::optional<flight::Ref<flight::types::FlyCameraControllerOptions>>{options} : std::nullopt));
}

void reset_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, flight::Ref<flight::types::OrbitCameraControllerOptions> options) {
  flight::camera_controls::reset_orbit_camera_controller(controller, (options ? std::optional<flight::Ref<flight::types::OrbitCameraControllerOptions>>{options} : std::nullopt));
}

void rotate_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, double deltaAzimuth, double deltaPolar) {
  flight::camera_controls::rotate_orbit_camera_controller(controller, deltaAzimuth, deltaPolar);
}

void snap_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller) {
  flight::camera_controls::snap_fly_camera_controller(controller);
}

void snap_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller) {
  flight::camera_controls::snap_orbit_camera_controller(controller);
}

void update_camera_shake(flight::Ref<flight::types::CameraShake> shake, double dt, flight::Ref<flight::types::CameraShakeOffset> out) {
  flight::camera_controls::update_camera_shake(shake, dt, out);
}

double get_perspective_projection_frame_distance_to_sphere(flight::Ref<flight::types::PerspectiveProjection> projection, double radius, double aspect, bool paddingPresent, double padding) {
  return flight::camera_controls::get_perspective_projection_frame_distance_to_sphere(projection, radius, aspect, (paddingPresent ? std::optional<double>{padding} : std::nullopt));
}

void set_orthographic_projection_frame_to_sphere(flight::Ref<flight::types::OrthographicProjection> projection, double radius, double aspect, bool paddingPresent, double padding) {
  flight::camera_controls::set_orthographic_projection_frame_to_sphere(projection, radius, aspect, (paddingPresent ? std::optional<double>{padding} : std::nullopt));
}

void update_camera_2d_follow(flight::Ref<flight::types::Camera2D> camera, double viewportWidth, double viewportHeight, double targetX, double targetY, double deltaTime, flight::Ref<flight::types::Camera2DFollowOptions> options) {
  flight::camera_controls::update_camera_2d_follow(camera, viewportWidth, viewportHeight, targetX, targetY, deltaTime, (options ? std::optional<flight::Ref<flight::types::Camera2DFollowOptions>>{options} : std::nullopt));
}

void update_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, flight::Ref<flight::types::Camera3D> camera, double deltaTime) {
  flight::camera_controls::update_fly_camera_controller(controller, camera, deltaTime);
}

void update_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, flight::Ref<flight::types::Camera3D> camera, double deltaTime) {
  flight::camera_controls::update_orbit_camera_controller(controller, camera, deltaTime);
}

} // namespace flight_hx::camera_controls
