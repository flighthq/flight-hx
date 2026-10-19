// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/spring/contract.hpp>
#include <flight_hx/spring.hpp>

namespace flight_hx::spring {

void add_spring_impulse(flight::Ref<flight::types::Spring> spring, double velocity) {
  flight::spring::add_spring_impulse(spring, velocity);
}

void add_spring_impulse_2d(flight::Ref<flight::types::Spring2D> spring2D, double velocityX, double velocityY) {
  flight::spring::add_spring_impulse_2d(spring2D, velocityX, velocityY);
}

void add_spring_impulse_3d(flight::Ref<flight::types::Spring3D> spring3D, double velocityX, double velocityY, double velocityZ) {
  flight::spring::add_spring_impulse_3d(spring3D, velocityX, velocityY, velocityZ);
}

flight::Ref<flight::types::Spring> create_spring(bool valuePresent, double value, bool velocityPresent, double velocity) {
  return flight::spring::create_spring((valuePresent ? std::optional<double>{value} : std::nullopt), (velocityPresent ? std::optional<double>{velocity} : std::nullopt));
}

flight::Ref<flight::types::Spring2D> create_spring_2d(bool valueXPresent, double valueX, bool valueYPresent, double valueY, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY) {
  return flight::spring::create_spring_2d((valueXPresent ? std::optional<double>{valueX} : std::nullopt), (valueYPresent ? std::optional<double>{valueY} : std::nullopt), (velocityXPresent ? std::optional<double>{velocityX} : std::nullopt), (velocityYPresent ? std::optional<double>{velocityY} : std::nullopt));
}

flight::Ref<flight::types::Spring3D> create_spring_3d(bool valueXPresent, double valueX, bool valueYPresent, double valueY, bool valueZPresent, double valueZ, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY, bool velocityZPresent, double velocityZ) {
  return flight::spring::create_spring_3d((valueXPresent ? std::optional<double>{valueX} : std::nullopt), (valueYPresent ? std::optional<double>{valueY} : std::nullopt), (valueZPresent ? std::optional<double>{valueZ} : std::nullopt), (velocityXPresent ? std::optional<double>{velocityX} : std::nullopt), (velocityYPresent ? std::optional<double>{velocityY} : std::nullopt), (velocityZPresent ? std::optional<double>{velocityZ} : std::nullopt));
}

flight::Ref<flight::types::SpringConfig> create_spring_config(double frequency, double dampingRatio) {
  return flight::spring::create_spring_config(frequency, dampingRatio);
}

flight::Ref<flight::types::SpringConfig> create_spring_config_from_physical(double stiffness, double damping, double mass) {
  return flight::spring::create_spring_config_from_physical(stiffness, damping, mass);
}

bool is_spring_2d_settled(flight::Ref<flight::types::Spring2D> spring2D, double targetX, double targetY, bool positionEpsilonPresent, double positionEpsilon, bool velocityEpsilonPresent, double velocityEpsilon) {
  return flight::spring::is_spring_2d_settled(spring2D, targetX, targetY, (positionEpsilonPresent ? std::optional<double>{positionEpsilon} : std::nullopt), (velocityEpsilonPresent ? std::optional<double>{velocityEpsilon} : std::nullopt));
}

bool is_spring_3d_settled(flight::Ref<flight::types::Spring3D> spring3D, double targetX, double targetY, double targetZ, bool positionEpsilonPresent, double positionEpsilon, bool velocityEpsilonPresent, double velocityEpsilon) {
  return flight::spring::is_spring_3d_settled(spring3D, targetX, targetY, targetZ, (positionEpsilonPresent ? std::optional<double>{positionEpsilon} : std::nullopt), (velocityEpsilonPresent ? std::optional<double>{velocityEpsilon} : std::nullopt));
}

bool is_spring_settled(flight::Ref<flight::types::Spring> spring, double target, bool positionEpsilonPresent, double positionEpsilon, bool velocityEpsilonPresent, double velocityEpsilon) {
  return flight::spring::is_spring_settled(spring, target, (positionEpsilonPresent ? std::optional<double>{positionEpsilon} : std::nullopt), (velocityEpsilonPresent ? std::optional<double>{velocityEpsilon} : std::nullopt));
}

void reset_spring(flight::Ref<flight::types::Spring> spring, double value, bool velocityPresent, double velocity) {
  flight::spring::reset_spring(spring, value, (velocityPresent ? std::optional<double>{velocity} : std::nullopt));
}

void reset_spring_2d(flight::Ref<flight::types::Spring2D> spring2D, double valueX, double valueY, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY) {
  flight::spring::reset_spring_2d(spring2D, valueX, valueY, (velocityXPresent ? std::optional<double>{velocityX} : std::nullopt), (velocityYPresent ? std::optional<double>{velocityY} : std::nullopt));
}

void reset_spring_3d(flight::Ref<flight::types::Spring3D> spring3D, double valueX, double valueY, double valueZ, bool velocityXPresent, double velocityX, bool velocityYPresent, double velocityY, bool velocityZPresent, double velocityZ) {
  flight::spring::reset_spring_3d(spring3D, valueX, valueY, valueZ, (velocityXPresent ? std::optional<double>{velocityX} : std::nullopt), (velocityYPresent ? std::optional<double>{velocityY} : std::nullopt), (velocityZPresent ? std::optional<double>{velocityZ} : std::nullopt));
}

void update_spring(flight::Ref<flight::types::Spring> spring, double target, flight::Ref<flight::types::SpringConfig> config, double deltaTime) {
  flight::spring::update_spring(spring, target, config, deltaTime);
}

void update_spring_2d(flight::Ref<flight::types::Spring2D> spring2D, double targetX, double targetY, flight::Ref<flight::types::SpringConfig> config, double deltaTime) {
  flight::spring::update_spring_2d(spring2D, targetX, targetY, config, deltaTime);
}

void update_spring_3d(flight::Ref<flight::types::Spring3D> spring3D, double targetX, double targetY, double targetZ, flight::Ref<flight::types::SpringConfig> config, double deltaTime) {
  flight::spring::update_spring_3d(spring3D, targetX, targetY, targetZ, config, deltaTime);
}

void update_spring_angle(flight::Ref<flight::types::Spring> spring, double target, double fullTurn, flight::Ref<flight::types::SpringConfig> config, double deltaTime) {
  flight::spring::update_spring_angle(spring, target, fullTurn, config, deltaTime);
}

} // namespace flight_hx::spring
