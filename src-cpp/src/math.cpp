// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/math/comparison.hpp>
#include <flight/math/contract.hpp>
#include <flight_hx/math.hpp>

namespace flight_hx::math {

bool approx_equal(double a, double b, bool epsilonPresent, double epsilon) {
  return flight::math::approx_equal(a, b, (epsilonPresent ? std::optional<double>{epsilon} : std::nullopt));
}

bool approx_equal_relative(double a, double b, bool relativeEpsilonPresent, double relativeEpsilon) {
  return flight::math::approx_equal_relative(a, b, (relativeEpsilonPresent ? std::optional<double>{relativeEpsilon} : std::nullopt));
}

bool approx_zero(double value, bool epsilonPresent, double epsilon) {
  return flight::math::approx_zero(value, (epsilonPresent ? std::optional<double>{epsilon} : std::nullopt));
}

double ceil_power_of_two(double n) {
  return flight::math::ceil_power_of_two(n);
}

double ceil_to(double value, double step) {
  return flight::math::ceil_to(value, step);
}

double clamp(double value, double min, double max) {
  return flight::math::clamp(value, min, max);
}

double damp(double current, double target, double lambda, double deltaTime) {
  return flight::math::damp(current, target, lambda, deltaTime);
}

double deg_to_rad_flight_value_function_deg_u000054_o_u000052_ad_flight_source_59eefa411bb2f66d(double degrees) {
  return flight::math::deg_to_rad_flight_value_function_deg_u000054_o_u000052_ad_flight_source_59eefa411bb2f66d(degrees);
}

double delta_angle(double from, double to) {
  return flight::math::delta_angle(from, to);
}

double euclidean_mod(double value, double divisor) {
  return flight::math::euclidean_mod(value, divisor);
}

double factorial(double n) {
  return flight::math::factorial(n);
}

double floor_power_of_two(double n) {
  return flight::math::floor_power_of_two(n);
}

double floor_to(double value, double step) {
  return flight::math::floor_to(value, step);
}

double fract(double value) {
  return flight::math::fract(value);
}

double gcd(double a, double b) {
  return flight::math::gcd(a, b);
}

double hash_2d(double x, double y) {
  return flight::math::hash_2d(x, y);
}

double hash_3d(double x, double y, double z) {
  return flight::math::hash_3d(x, y, z);
}

double hash_combine(double seed, double value) {
  return flight::math::hash_combine(seed, value);
}

double hash_uint32(double value) {
  return flight::math::hash_uint32(value);
}

double hypot2(double x, double y) {
  return flight::math::hypot2(x, y);
}

bool in_range(double value, double min, double max) {
  return flight::math::in_range(value, min, max);
}

double inverse_lerp(double a, double b, double value) {
  return flight::math::inverse_lerp(a, b, value);
}

bool is_even(double n) {
  return flight::math::is_even(n);
}

bool is_odd(double n) {
  return flight::math::is_odd(n);
}

bool is_power_of_two(double n) {
  return flight::math::is_power_of_two(n);
}

double lcm(double a, double b) {
  return flight::math::lcm(a, b);
}

double lerp(double a, double b, double t) {
  return flight::math::lerp(a, b, t);
}

double lerp_angle(double a, double b, double t) {
  return flight::math::lerp_angle(a, b, t);
}

double move_towards(double current, double target, double maxDelta) {
  return flight::math::move_towards(current, target, maxDelta);
}

double next_multiple_of(double value, double multiple) {
  return flight::math::next_multiple_of(value, multiple);
}

double next_power_of_two(double n) {
  return flight::math::next_power_of_two(n);
}

double normalize_angle(double radians) {
  return flight::math::normalize_angle(radians);
}

double ping_pong(double t, double length) {
  return flight::math::ping_pong(t, length);
}

double previous_power_of_two(double n) {
  return flight::math::previous_power_of_two(n);
}

double quantize(double value, double steps, double min, double max) {
  return flight::math::quantize(value, steps, min, max);
}

double rad_to_deg_flight_value_function_rad_u000054_o_u000044_eg_flight_source_59eefa411bb2f66d(double radians) {
  return flight::math::rad_to_deg_flight_value_function_rad_u000054_o_u000044_eg_flight_source_59eefa411bb2f66d(radians);
}

double remap(double value, double inMin, double inMax, double outMin, double outMax) {
  return flight::math::remap(value, inMin, inMax, outMin, outMax);
}

double repeat(double t, double length) {
  return flight::math::repeat(t, length);
}

double round_to(double value, double step) {
  return flight::math::round_to(value, step);
}

double saturate(double value) {
  return flight::math::saturate(value);
}

double sign(double value) {
  return flight::math::sign(value);
}

double smoother_step(double edge0, double edge1, double x) {
  return flight::math::smoother_step(edge0, edge1, x);
}

double smooth_step(double edge0, double edge1, double x) {
  return flight::math::smooth_step(edge0, edge1, x);
}

double step(double edge, double x) {
  return flight::math::step(edge, x);
}

} // namespace flight_hx::math
