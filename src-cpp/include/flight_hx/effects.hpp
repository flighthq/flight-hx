// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::effects {

double compute_aces_tone_map(double x);
double compute_box_blur_pass_radius(double sigma, double passes, double pass);
double compute_box_blur_radius(double sigma, double passes);
double compute_depth_of_field_coc(double depth, double focusDistance, double aperture, double focalLength);
double compute_exposure_scale(double exposure);
double compute_gaussian_radius_from_sigma(double sigma);
double compute_gaussian_sigma_for_blur_radius(double radius, double passes);
double compute_gaussian_sigma_from_radius(double radius);
double compute_linear_depth_from_nonlinear(double depth, double near, double far);
double compute_reinhard_extended_tone_map(double x, double white);
double compute_reinhard_tone_map(double x);
double compute_uncharted2_tone_map(double x);
double get_blur_downsample_level(double sigma);
double get_blur_residual_sigma(double sigma, double level);
double get_gaussian_kernel_size(double sigma);
double get_linear_sampled_gaussian_tap_count(double sigma);

} // namespace flight_hx::effects
