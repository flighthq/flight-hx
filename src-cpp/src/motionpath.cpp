// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/motionpath/contract.hpp>
#include <flight_hx/motionpath.hpp>

namespace flight_hx::motionpath {

double get_motion_path_heading(flight::Ref<flight::types::MotionPath> mp) {
  return flight::motionpath::get_motion_path_heading(mp);
}

double get_motion_path_progress(flight::Ref<flight::types::MotionPath> mp) {
  return flight::motionpath::get_motion_path_progress(mp);
}

bool is_motion_path_at_end(flight::Ref<flight::types::MotionPath> mp) {
  return flight::motionpath::is_motion_path_at_end(mp);
}

void set_motion_path_distance(flight::Ref<flight::types::MotionPath> mp, double distance) {
  flight::motionpath::set_motion_path_distance(mp, distance);
}

void set_motion_path_progress(flight::Ref<flight::types::MotionPath> mp, double t) {
  flight::motionpath::set_motion_path_progress(mp, t);
}

void update_motion_path(flight::Ref<flight::types::MotionPath> mp, double deltaTime) {
  flight::motionpath::update_motion_path(mp, deltaTime);
}

} // namespace flight_hx::motionpath
