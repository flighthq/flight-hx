// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::math {

double ceil_power_of_two(double n);
double ceil_to(double value, double step);
double clamp(double value, double min, double max);
double damp(double current, double target, double lambda, double deltaTime);
double deg_to_rad_flight_value_function_deg_u000054_o_u000052_ad_flight_source_59eefa411bb2f66d(double degrees);
double delta_angle(double from, double to);
double euclidean_mod(double value, double divisor);
double factorial(double n);
double floor_power_of_two(double n);
double floor_to(double value, double step);
double fract(double value);
double gcd(double a, double b);
double hash_2d(double x, double y);
double hash_3d(double x, double y, double z);
double hash_combine(double seed, double value);
double hash_uint32(double value);
double hypot2(double x, double y);
bool in_range(double value, double min, double max);
double inverse_lerp(double a, double b, double value);
bool is_even(double n);
bool is_odd(double n);
bool is_power_of_two(double n);
double lcm(double a, double b);
double lerp(double a, double b, double t);
double lerp_angle(double a, double b, double t);
double move_towards(double current, double target, double maxDelta);
double next_multiple_of(double value, double multiple);
double next_power_of_two(double n);
double normalize_angle(double radians);
double ping_pong(double t, double length);
double previous_power_of_two(double n);
double quantize(double value, double steps, double min, double max);
double rad_to_deg_flight_value_function_rad_u000054_o_u000044_eg_flight_source_59eefa411bb2f66d(double radians);
double remap(double value, double inMin, double inMax, double outMin, double outMax);
double repeat(double t, double length);
double round_to(double value, double step);
double saturate(double value);
double sign(double value);
double smoother_step(double edge0, double edge1, double x);
double smooth_step(double edge0, double edge1, double x);
double step(double edge, double x);

} // namespace flight_hx::math
