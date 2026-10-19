// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::spring {

void add_spring_impulse(flight::Ref<flight::types::Spring> spring, double velocity);
void add_spring_impulse_2d(flight::Ref<flight::types::Spring2D> spring2D, double velocityX, double velocityY);
void add_spring_impulse_3d(flight::Ref<flight::types::Spring3D> spring3D, double velocityX, double velocityY, double velocityZ);
flight::Ref<flight::types::Spring> create_spring(bool valuePresent, double value, bool velocityPresent, double velocity);
flight::Ref<flight::types::Spring2D> create_spring_2d(bool valueXPresent, double valueX, bool valueYPresent, double valueY, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY);
flight::Ref<flight::types::Spring3D> create_spring_3d(bool valueXPresent, double valueX, bool valueYPresent, double valueY, bool valueZPresent, double valueZ, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY, bool velocityZPresent, double velocityZ);
flight::Ref<flight::types::SpringConfig> create_spring_config(double frequency, double dampingRatio);
flight::Ref<flight::types::SpringConfig> create_spring_config_from_physical(double stiffness, double damping, double mass);
bool is_spring_2d_settled(flight::Ref<flight::types::Spring2D> spring2D, double targetX, double targetY, bool positionEpsilonPresent, double positionEpsilon, bool velocityEpsilonPresent, double velocityEpsilon);
bool is_spring_3d_settled(flight::Ref<flight::types::Spring3D> spring3D, double targetX, double targetY, double targetZ, bool positionEpsilonPresent, double positionEpsilon, bool velocityEpsilonPresent, double velocityEpsilon);
bool is_spring_settled(flight::Ref<flight::types::Spring> spring, double target, bool positionEpsilonPresent, double positionEpsilon, bool velocityEpsilonPresent, double velocityEpsilon);
void reset_spring(flight::Ref<flight::types::Spring> spring, double value, bool velocityPresent, double velocity);
void reset_spring_2d(flight::Ref<flight::types::Spring2D> spring2D, double valueX, double valueY, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY);
void reset_spring_3d(flight::Ref<flight::types::Spring3D> spring3D, double valueX, double valueY, double valueZ, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY, bool velocityZPresent, double velocityZ);
void update_spring(flight::Ref<flight::types::Spring> spring, double target, flight::Ref<flight::types::SpringConfig> config, double deltaTime);
void update_spring_2d(flight::Ref<flight::types::Spring2D> spring2D, double targetX, double targetY, flight::Ref<flight::types::SpringConfig> config, double deltaTime);
void update_spring_3d(flight::Ref<flight::types::Spring3D> spring3D, double targetX, double targetY, double targetZ, flight::Ref<flight::types::SpringConfig> config, double deltaTime);
void update_spring_angle(flight::Ref<flight::types::Spring> spring, double target, double fullTurn, flight::Ref<flight::types::SpringConfig> config, double deltaTime);

} // namespace flight_hx::spring
