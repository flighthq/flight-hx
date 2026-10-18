// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/effects/blur_downsample.hpp>
#include <flight/effects/box_blur_math.hpp>
#include <flight/effects/depth_math.hpp>
#include <flight/effects/gaussian_kernel.hpp>
#include <flight/effects/gaussian_math.hpp>
#include <flight/effects/linear_sampled_gaussian.hpp>
#include <flight/effects/tone_map_math.hpp>
#include <flight_hx/effects.hpp>

namespace flight_hx::effects {

double compute_aces_tone_map(double x) {
  return flight::effects::compute_aces_tone_map(x);
}

double compute_box_blur_pass_radius(double sigma, double passes, double pass) {
  return flight::effects::compute_box_blur_pass_radius(sigma, passes, pass);
}

double compute_box_blur_radius(double sigma, double passes) {
  return flight::effects::compute_box_blur_radius(sigma, passes);
}

double compute_depth_of_field_coc(double depth, double focusDistance, double aperture, double focalLength) {
  return flight::effects::compute_depth_of_field_coc(depth, focusDistance, aperture, focalLength);
}

double compute_exposure_scale(double exposure) {
  return flight::effects::compute_exposure_scale(exposure);
}

double compute_gaussian_radius_from_sigma(double sigma) {
  return flight::effects::compute_gaussian_radius_from_sigma(sigma);
}

double compute_gaussian_sigma_for_blur_radius(double radius, double passes) {
  return flight::effects::compute_gaussian_sigma_for_blur_radius(radius, passes);
}

double compute_gaussian_sigma_from_radius(double radius) {
  return flight::effects::compute_gaussian_sigma_from_radius(radius);
}

double compute_linear_depth_from_nonlinear(double depth, double near, double far) {
  return flight::effects::compute_linear_depth_from_nonlinear(depth, near, far);
}

double compute_reinhard_extended_tone_map(double x, double white) {
  return flight::effects::compute_reinhard_extended_tone_map(x, white);
}

double compute_reinhard_tone_map(double x) {
  return flight::effects::compute_reinhard_tone_map(x);
}

double compute_uncharted2_tone_map(double x) {
  return flight::effects::compute_uncharted2_tone_map(x);
}

double get_blur_downsample_level(double sigma) {
  return flight::effects::get_blur_downsample_level(sigma);
}

double get_blur_residual_sigma(double sigma, double level) {
  return flight::effects::get_blur_residual_sigma(sigma, level);
}

double get_gaussian_kernel_size(double sigma) {
  return flight::effects::get_gaussian_kernel_size(sigma);
}

double get_linear_sampled_gaussian_tap_count(double sigma) {
  return flight::effects::get_linear_sampled_gaussian_tap_count(sigma);
}

} // namespace flight_hx::effects
