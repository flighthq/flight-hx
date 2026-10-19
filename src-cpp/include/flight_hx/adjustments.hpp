// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::adjustments {

double apply_color_matrix_to_color(::Array<double> matrix, double packedRgba);
void concat_color_matrix(::Array<double> target, ::Array<double> source);
::Array<double> fuse_color_matrices(::Array<::Array<double>> matrices);
::Array<double> create_brightness_color_matrix(double amount);
::Array<double> create_channel_mixer_color_matrix(::Array<double> redOut, ::Array<double> greenOut, ::Array<double> blueOut);
::Array<double> create_color_balance_color_matrix(::Array<double> shadows, ::Array<double> midtones, ::Array<double> highlights);
::Array<double> create_color_matrix_from_tint(double packedRgba, double amount);
::Array<double> create_contrast_color_matrix(double amount);
::Array<double> create_desaturate_color_matrix(double amount);
::Array<double> create_grayscale_color_matrix();
::Array<double> create_hue_rotate_color_matrix(double degrees);
::Array<double> create_identity_color_matrix();
::Array<double> create_invert_color_matrix();
::Array<double> create_levels_color_matrix(double inBlack, double inWhite, double outBlack, double outWhite, bool gammaPresent, double gamma);
::Array<double> create_opacity_color_matrix(double alpha);
::Array<double> create_polaroid_color_matrix();
::Array<double> create_saturation_color_matrix(double amount);
::Array<double> create_sepia_color_matrix();
::Array<double> create_technicolor_color_matrix();
::Array<double> create_vintage_color_matrix();
::Array<double> create_white_balance_color_matrix(double temperature, double tint);
bool is_affine_color_matrix(::Array<double> matrix);
::Array<double> multiply_color_matrix(::Array<double> a, ::Array<double> b, bool outPresent, ::Array<double> out);
flight::Ref<flight::types::ColorLutCache> create_color_lut_cache();
flight::Ref<flight::types::TintAdjustment> create_tint_adjustment(double rgba);

} // namespace flight_hx::adjustments
