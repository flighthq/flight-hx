// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::materials {

double get_pbr_metallic_from_phong_specular(double specular, double diffuse);
double get_pbr_roughness_from_phong_shininess(double shininess);
double get_phong_to_pbr_light_exposure();
bool is_valid_material_clearcoat(double value);
bool is_valid_material_ior(double value);
bool is_valid_material_iridescence_thickness(double value);
bool is_valid_material_weight(double value);
bool is_valid_pbr_uv_set(double value);

} // namespace flight_hx::materials
