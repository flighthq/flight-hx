// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/materials/material_validation.hpp>
#include <flight/materials/pbr_extension.hpp>
#include <flight/materials/phong_to_pbr.hpp>
#include <flight_hx/materials.hpp>

namespace flight_hx::materials {

double get_pbr_metallic_from_phong_specular(double specular, double diffuse) {
  return flight::materials::get_pbr_metallic_from_phong_specular(specular, diffuse);
}

double get_pbr_roughness_from_phong_shininess(double shininess) {
  return flight::materials::get_pbr_roughness_from_phong_shininess(shininess);
}

double get_phong_to_pbr_light_exposure() {
  return flight::materials::get_phong_to_pbr_light_exposure();
}

bool is_valid_material_clearcoat(double value) {
  return flight::materials::is_valid_material_clearcoat(value);
}

bool is_valid_material_ior(double value) {
  return flight::materials::is_valid_material_ior(value);
}

bool is_valid_material_iridescence_thickness(double value) {
  return flight::materials::is_valid_material_iridescence_thickness(value);
}

bool is_valid_material_weight(double value) {
  return flight::materials::is_valid_material_weight(value);
}

bool is_valid_pbr_uv_set(double value) {
  return flight::materials::is_valid_pbr_uv_set(value);
}

} // namespace flight_hx::materials
