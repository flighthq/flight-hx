// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::motionpath {

double get_motion_path_heading(flight::Ref<flight::types::MotionPath> mp);
double get_motion_path_progress(flight::Ref<flight::types::MotionPath> mp);
bool is_motion_path_at_end(flight::Ref<flight::types::MotionPath> mp);
void set_motion_path_distance(flight::Ref<flight::types::MotionPath> mp, double distance);
void set_motion_path_progress(flight::Ref<flight::types::MotionPath> mp, double t);
void update_motion_path(flight::Ref<flight::types::MotionPath> mp, double deltaTime);

} // namespace flight_hx::motionpath
