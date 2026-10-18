// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/materials.cpp" />
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/generated/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />
</files>
')
@:include("flight_hx/materials.hpp")
extern class Materials {
  @:native("flight_hx::materials::get_pbr_metallic_from_phong_specular")
  static function getPbrMetallicFromPhongSpecular(specular:Float, diffuse:Float):Float;

  @:native("flight_hx::materials::get_pbr_roughness_from_phong_shininess")
  static function getPbrRoughnessFromPhongShininess(shininess:Float):Float;

  @:native("flight_hx::materials::get_phong_to_pbr_light_exposure")
  static function getPhongToPbrLightExposure():Float;

  @:native("flight_hx::materials::is_valid_material_clearcoat")
  static function isValidMaterialClearcoat(value:Float):Bool;

  @:native("flight_hx::materials::is_valid_material_ior")
  static function isValidMaterialIor(value:Float):Bool;

  @:native("flight_hx::materials::is_valid_material_iridescence_thickness")
  static function isValidMaterialIridescenceThickness(value:Float):Bool;

  @:native("flight_hx::materials::is_valid_material_weight")
  static function isValidMaterialWeight(value:Float):Bool;

  @:native("flight_hx::materials::is_valid_pbr_uv_set")
  static function isValidPbrUvSet(value:Float):Bool;
}
#end
