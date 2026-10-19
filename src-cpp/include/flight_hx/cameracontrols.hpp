// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::camera_controls {

void add_camera_shake_trauma(flight::Ref<flight::types::CameraShake> shake, double amount);
flight::Ref<flight::types::FlyCameraController> clone_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> source);
flight::Ref<flight::types::OrbitCameraController> clone_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> source);
void copy_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> out, flight::Ref<flight::types::FlyCameraController> source);
void copy_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> out, flight::Ref<flight::types::OrbitCameraController> source);
flight::Ref<flight::types::CameraShake> create_camera_shake(flight::Ref<flight::types::CameraShakeOptions> options);
flight::Ref<flight::types::CameraShakeOffset> create_camera_shake_offset();
flight::Ref<flight::types::FlyCameraController> create_fly_camera_controller(flight::Ref<flight::types::FlyCameraControllerOptions> options);
flight::Ref<flight::types::OrbitCameraController> create_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraControllerOptions> options);
void dolly_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, double deltaDistance);
void look_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, double deltaYaw, double deltaPitch);
void move_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, double forward, double right, double up);
void pan_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, double deltaRight, double deltaUp);
void pan_orbit_camera_controller_in_view_plane(flight::Ref<flight::types::OrbitCameraController> controller, double deltaRight, double deltaUp);
void reset_camera_shake(flight::Ref<flight::types::CameraShake> shake);
void reset_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, flight::Ref<flight::types::FlyCameraControllerOptions> options);
void reset_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, flight::Ref<flight::types::OrbitCameraControllerOptions> options);
void rotate_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, double deltaAzimuth, double deltaPolar);
void snap_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller);
void snap_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller);
void update_camera_shake(flight::Ref<flight::types::CameraShake> shake, double dt, flight::Ref<flight::types::CameraShakeOffset> out);
double get_perspective_projection_frame_distance_to_sphere(flight::Ref<flight::types::PerspectiveProjection> projection, double radius, double aspect, bool paddingPresent, double padding);
void set_orthographic_projection_frame_to_sphere(flight::Ref<flight::types::OrthographicProjection> projection, double radius, double aspect, bool paddingPresent, double padding);
void update_camera_2d_follow(flight::Ref<flight::types::Camera2D> camera, double viewportWidth, double viewportHeight, double targetX, double targetY, double deltaTime, flight::Ref<flight::types::Camera2DFollowOptions> options);
void update_fly_camera_controller(flight::Ref<flight::types::FlyCameraController> controller, flight::Ref<flight::types::Camera3D> camera, double deltaTime);
void update_orbit_camera_controller(flight::Ref<flight::types::OrbitCameraController> controller, flight::Ref<flight::types::Camera3D> camera, double deltaTime);

} // namespace flight_hx::camera_controls
