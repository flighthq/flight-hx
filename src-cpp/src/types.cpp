// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/types/contract.hpp>
#include <flight_hx/types.hpp>

namespace flight_hx::types {

::String get_add_node_child_command_kind() {
  const std::string result_utf8 = flight::types::add_node_child_command_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

double get_all_light_layers() {
  return flight::types::all_light_layers;
}

::String get_ambient_light_kind() {
  const std::string result_utf8 = flight::types::ambient_light_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_anchor_layout_kind() {
  const std::string result_utf8 = flight::types::anchor_layout_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_animated_normal_modifier_kind() {
  const std::string result_utf8 = flight::types::animated_normal_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_animation_interpolation_cubic() {
  const std::string result_utf8 = flight::types::animation_interpolation_cubic.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_animation_interpolation_linear() {
  const std::string result_utf8 = flight::types::animation_interpolation_linear.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_animation_interpolation_step() {
  const std::string result_utf8 = flight::types::animation_interpolation_step.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_animation_loop_mode_ping_pong() {
  const std::string result_utf8 = flight::types::animation_loop_mode_ping_pong.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_animation_loop_mode_repeat() {
  const std::string result_utf8 = flight::types::animation_loop_mode_repeat.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_anisotropy_pbr_extension_kind() {
  const std::string result_utf8 = flight::types::anisotropy_pbr_extension_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_area_light_kind() {
  const std::string result_utf8 = flight::types::area_light_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_attractor_force_kind() {
  const std::string result_utf8 = flight::types::attractor_force_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_billboard_kind() {
  const std::string result_utf8 = flight::types::billboard_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_bitmap_font_format_kind_bm_font_binary() {
  const std::string result_utf8 = flight::types::bitmap_font_format_kind_bm_font_binary.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_bitmap_font_format_kind_bm_font_json() {
  const std::string result_utf8 = flight::types::bitmap_font_format_kind_bm_font_json.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_bitmap_font_format_kind_bm_font_text() {
  const std::string result_utf8 = flight::types::bitmap_font_format_kind_bm_font_text.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_bitmap_font_format_kind_bm_font_xml() {
  const std::string result_utf8 = flight::types::bitmap_font_format_kind_bm_font_xml.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_bitmap_text_kind() {
  const std::string result_utf8 = flight::types::bitmap_text_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_bitmap_texture_source_kind() {
  const std::string result_utf8 = flight::types::bitmap_texture_source_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_blinn_phong_material_kind() {
  const std::string result_utf8 = flight::types::blinn_phong_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_bounding_box_attachment_2d_kind() {
  const std::string result_utf8 = flight::types::bounding_box_attachment_2d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_candela_light_unit() {
  const std::string result_utf8 = flight::types::candela_light_unit.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_circle_collider_kind() {
  const std::string result_utf8 = flight::types::circle_collider_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clearcoat_pbr_extension_kind() {
  const std::string result_utf8 = flight::types::clearcoat_pbr_extension_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clipboard_format_bookmark() {
  const std::string result_utf8 = flight::types::clipboard_format_bookmark.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clipboard_format_html() {
  const std::string result_utf8 = flight::types::clipboard_format_html.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clipboard_format_image() {
  const std::string result_utf8 = flight::types::clipboard_format_image.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clipboard_format_rtf() {
  const std::string result_utf8 = flight::types::clipboard_format_rtf.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clipboard_format_text() {
  const std::string result_utf8 = flight::types::clipboard_format_text.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clipboard_format_uri_list() {
  const std::string result_utf8 = flight::types::clipboard_format_uri_list.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_clipping_attachment_2d_kind() {
  const std::string result_utf8 = flight::types::clipping_attachment_2d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_composite_command_kind() {
  const std::string result_utf8 = flight::types::composite_command_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_compressed_image_texture_source_kind() {
  const std::string result_utf8 = flight::types::compressed_image_texture_source_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

double get_cube_face_negative_x() {
  return flight::types::cube_face_negative_x;
}

double get_cube_face_negative_y() {
  return flight::types::cube_face_negative_y;
}

double get_cube_face_negative_z() {
  return flight::types::cube_face_negative_z;
}

double get_cube_face_positive_x() {
  return flight::types::cube_face_positive_x;
}

double get_cube_face_positive_y() {
  return flight::types::cube_face_positive_y;
}

double get_cube_face_positive_z() {
  return flight::types::cube_face_positive_z;
}

::String get_curl_noise_force_kind() {
  const std::string result_utf8 = flight::types::curl_noise_force_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_custom_shader_material_kind() {
  const std::string result_utf8 = flight::types::custom_shader_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_depth_material_kind() {
  const std::string result_utf8 = flight::types::depth_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_device_form_factor_car() {
  const std::string result_utf8 = flight::types::device_form_factor_car.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_device_form_factor_desktop() {
  const std::string result_utf8 = flight::types::device_form_factor_desktop.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_device_form_factor_phone() {
  const std::string result_utf8 = flight::types::device_form_factor_phone.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_device_form_factor_tablet() {
  const std::string result_utf8 = flight::types::device_form_factor_tablet.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_device_form_factor_tv() {
  const std::string result_utf8 = flight::types::device_form_factor_tv.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_device_form_factor_unknown() {
  const std::string result_utf8 = flight::types::device_form_factor_unknown.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_device_form_factor_watch() {
  const std::string result_utf8 = flight::types::device_form_factor_watch.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

double get_directional_shadow_map_size() {
  return flight::types::directional_shadow_map_size;
}

::String get_directional_light_kind() {
  const std::string result_utf8 = flight::types::directional_light_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_display_object_kind() {
  const std::string result_utf8 = flight::types::display_object_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_dissolve_modifier_kind() {
  const std::string result_utf8 = flight::types::dissolve_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_drag_force_kind() {
  const std::string result_utf8 = flight::types::drag_force_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_emissive_material_kind() {
  const std::string result_utf8 = flight::types::emissive_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_emissive_modifier_kind() {
  const std::string result_utf8 = flight::types::emissive_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_environment_kind() {
  const std::string result_utf8 = flight::types::environment_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_env_reflect_modifier_kind() {
  const std::string result_utf8 = flight::types::env_reflect_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_extended_pbr_material_kind() {
  const std::string result_utf8 = flight::types::extended_pbr_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_external_texture_source_kind() {
  const std::string result_utf8 = flight::types::external_texture_source_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_flex_layout_kind() {
  const std::string result_utf8 = flight::types::flex_layout_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_fog_modifier_kind() {
  const std::string result_utf8 = flight::types::fog_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_font_variation_italic() {
  const std::string result_utf8 = flight::types::font_variation_italic.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_font_variation_optical_size() {
  const std::string result_utf8 = flight::types::font_variation_optical_size.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_font_variation_slant() {
  const std::string result_utf8 = flight::types::font_variation_slant.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_font_variation_weight() {
  const std::string result_utf8 = flight::types::font_variation_weight.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_font_variation_width() {
  const std::string result_utf8 = flight::types::font_variation_width.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_grid_layout_kind() {
  const std::string result_utf8 = flight::types::grid_layout_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_group_kind() {
  const std::string result_utf8 = flight::types::group_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_hemisphere_light_kind() {
  const std::string result_utf8 = flight::types::hemisphere_light_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_html_view_kind() {
  const std::string result_utf8 = flight::types::html_view_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_image_texture_source_kind() {
  const std::string result_utf8 = flight::types::image_texture_source_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_instanced_mesh_kind() {
  const std::string result_utf8 = flight::types::instanced_mesh_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_iridescence_pbr_extension_kind() {
  const std::string result_utf8 = flight::types::iridescence_pbr_extension_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_lambert_material_kind() {
  const std::string result_utf8 = flight::types::lambert_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_libgdx_particle_format_kind() {
  const std::string result_utf8 = flight::types::libgdx_particle_format_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

double get_light_probe_sh_floats() {
  return flight::types::light_probe_sh_floats;
}

::String get_lod_mesh_kind() {
  const std::string result_utf8 = flight::types::lod_mesh_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_lumen_light_unit() {
  const std::string result_utf8 = flight::types::lumen_light_unit.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_lux_light_unit() {
  const std::string result_utf8 = flight::types::lux_light_unit.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_matcap_material_kind() {
  const std::string result_utf8 = flight::types::matcap_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

double get_max_collision_contact_points_3_d() {
  return flight::types::max_collision_contact_points_3_d;
}

double get_max_directional_shadow_pcf_radius() {
  return flight::types::max_directional_shadow_pcf_radius;
}

double get_max_forward_lights() {
  return flight::types::max_forward_lights;
}

::String get_md5_material_feature() {
  const std::string result_utf8 = flight::types::md5_material_feature.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_md5_skeleton_feature() {
  const std::string result_utf8 = flight::types::md5_skeleton_feature.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_mesh_attachment_2d_kind() {
  const std::string result_utf8 = flight::types::mesh_attachment_2d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_mesh_deformer_morph() {
  const std::string result_utf8 = flight::types::mesh_deformer_morph.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_mesh_deformer_none() {
  const std::string result_utf8 = flight::types::mesh_deformer_none.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_mesh_deformer_skeletal() {
  const std::string result_utf8 = flight::types::mesh_deformer_skeletal.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_mesh_kind() {
  const std::string result_utf8 = flight::types::mesh_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_morph_shape_kind() {
  const std::string result_utf8 = flight::types::morph_shape_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_movie_clip_kind() {
  const std::string result_utf8 = flight::types::movie_clip_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_native_text_kind() {
  const std::string result_utf8 = flight::types::native_text_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_alpha() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_alpha.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_pivot() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_pivot.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_pivot_x() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_pivot_x.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_pivot_y() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_pivot_y.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_position() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_position.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_rotation() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_rotation.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_scale() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_scale.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_scale_x() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_scale_x.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_scale_y() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_scale_y.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_skew() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_skew.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_skew_x() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_skew_x.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_skew_y() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_skew_y.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_visible() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_visible.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_x() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_x.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_2d_animation_path_y() {
  const std::string result_utf8 = flight::types::node_2d_animation_path_y.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_3d_kind() {
  const std::string result_utf8 = flight::types::node_3d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_node_kind() {
  const std::string result_utf8 = flight::types::node_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_normal_material_kind() {
  const std::string result_utf8 = flight::types::normal_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_obj_material_blinn_phong_feature() {
  const std::string result_utf8 = flight::types::obj_material_blinn_phong_feature.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_obj_material_standard_pbr_feature() {
  const std::string result_utf8 = flight::types::obj_material_standard_pbr_feature.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_particle_designer_format_kind() {
  const std::string result_utf8 = flight::types::particle_designer_format_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_particle_emitter_2d_kind() {
  const std::string result_utf8 = flight::types::particle_emitter_2d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_particle_emitter_3d_kind() {
  const std::string result_utf8 = flight::types::particle_emitter_3d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_path_attachment_2d_kind() {
  const std::string result_utf8 = flight::types::path_attachment_2d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_phong_material_kind() {
  const std::string result_utf8 = flight::types::phong_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_pixi_particle_format_kind() {
  const std::string result_utf8 = flight::types::pixi_particle_format_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_plane_collider_kind() {
  const std::string result_utf8 = flight::types::plane_collider_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_point_attachment_2d_kind() {
  const std::string result_utf8 = flight::types::point_attachment_2d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_point_gravity_well_force_kind() {
  const std::string result_utf8 = flight::types::point_gravity_well_force_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_point_light_kind() {
  const std::string result_utf8 = flight::types::point_light_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_quad_batch_kind() {
  const std::string result_utf8 = flight::types::quad_batch_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_rectangle_collider_kind() {
  const std::string result_utf8 = flight::types::rectangle_collider_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_region_attachment_2d_kind() {
  const std::string result_utf8 = flight::types::region_attachment_2d_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_remove_node_child_command_kind() {
  const std::string result_utf8 = flight::types::remove_node_child_command_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_render_cache_kind() {
  const std::string result_utf8 = flight::types::render_cache_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_render_target_texture_source_kind() {
  const std::string result_utf8 = flight::types::render_target_texture_source_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_reorder_node_child_command_kind() {
  const std::string result_utf8 = flight::types::reorder_node_child_command_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_rich_text_kind() {
  const std::string result_utf8 = flight::types::rich_text_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_rim_modifier_kind() {
  const std::string result_utf8 = flight::types::rim_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_sampler_kind() {
  const std::string result_utf8 = flight::types::sampler_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_scale9_shape_kind() {
  const std::string result_utf8 = flight::types::scale9_shape_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_scale9_sprite_kind() {
  const std::string result_utf8 = flight::types::scale9_sprite_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

double get_scene_light_ambient_radiance_offset() {
  return flight::types::scene_light_ambient_radiance_offset;
}

double get_scene_light_block_floats() {
  return flight::types::scene_light_block_floats;
}

double get_scene_light_directional_direction_offset() {
  return flight::types::scene_light_directional_direction_offset;
}

double get_scene_light_directional_radiance_offset() {
  return flight::types::scene_light_directional_radiance_offset;
}

double get_scene_light_head_floats() {
  return flight::types::scene_light_head_floats;
}

double get_scene_light_hemisphere_offset() {
  return flight::types::scene_light_hemisphere_offset;
}

double get_scene_light_hemisphere_stride() {
  return flight::types::scene_light_hemisphere_stride;
}

double get_scene_light_point_offset() {
  return flight::types::scene_light_point_offset;
}

double get_scene_light_point_stride() {
  return flight::types::scene_light_point_stride;
}

double get_scene_light_spot_offset() {
  return flight::types::scene_light_spot_offset;
}

double get_scene_light_spot_stride() {
  return flight::types::scene_light_spot_stride;
}

::String get_scene_3d_animation_path_rotation() {
  const std::string result_utf8 = flight::types::scene_3d_animation_path_rotation.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_scene_3d_animation_path_scale() {
  const std::string result_utf8 = flight::types::scene_3d_animation_path_scale.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_scene_3d_animation_path_translation() {
  const std::string result_utf8 = flight::types::scene_3d_animation_path_translation.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_scene_3d_animation_path_weights() {
  const std::string result_utf8 = flight::types::scene_3d_animation_path_weights.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_set_node_property_command_kind() {
  const std::string result_utf8 = flight::types::set_node_property_command_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_shaded_material_kind() {
  const std::string result_utf8 = flight::types::shaded_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_shape_kind() {
  const std::string result_utf8 = flight::types::shape_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_sheen_pbr_extension_kind() {
  const std::string result_utf8 = flight::types::sheen_pbr_extension_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_attach_acquisition_failed_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_attach_acquisition_failed_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_attach_ok_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_attach_ok_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_resize_body_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_resize_body_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_resize_none_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_resize_none_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_setter_ok_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_setter_ok_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_setter_operation_failed_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_setter_operation_failed_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_setter_operation_unavailable_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_setter_operation_unavailable_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_style_dark_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_style_dark_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_style_default_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_style_default_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_visibility_ok_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_visibility_ok_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_soft_keyboard_visibility_operation_failed_kind() {
  const std::string result_utf8 = flight::types::soft_keyboard_visibility_operation_failed_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_specular_glossiness_pbr_material_kind() {
  const std::string result_utf8 = flight::types::specular_glossiness_pbr_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_specular_pbr_extension_kind() {
  const std::string result_utf8 = flight::types::specular_pbr_extension_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_sphere_collider_kind() {
  const std::string result_utf8 = flight::types::sphere_collider_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_spine_particle_format_kind() {
  const std::string result_utf8 = flight::types::spine_particle_format_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_spot_light_kind() {
  const std::string result_utf8 = flight::types::spot_light_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_sprite_kind() {
  const std::string result_utf8 = flight::types::sprite_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_spritesheet_format_kind_aseprite() {
  const std::string result_utf8 = flight::types::spritesheet_format_kind_aseprite.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_spritesheet_format_kind_cocos_plist() {
  const std::string result_utf8 = flight::types::spritesheet_format_kind_cocos_plist.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_spritesheet_format_kind_libgdx_atlas() {
  const std::string result_utf8 = flight::types::spritesheet_format_kind_libgdx_atlas.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_spritesheet_format_kind_starling() {
  const std::string result_utf8 = flight::types::spritesheet_format_kind_starling.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_spritesheet_format_kind_texture_packer() {
  const std::string result_utf8 = flight::types::spritesheet_format_kind_texture_packer.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_standard_material_kind() {
  const std::string result_utf8 = flight::types::standard_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_standard_pbr_material_kind() {
  const std::string result_utf8 = flight::types::standard_pbr_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_starling_pex_format_kind() {
  const std::string result_utf8 = flight::types::starling_pex_format_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_statechart_atomic_state_kind() {
  const std::string result_utf8 = flight::types::statechart_atomic_state_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_statechart_nested_state_kind() {
  const std::string result_utf8 = flight::types::statechart_nested_state_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_direction_left_to_right() {
  const std::string result_utf8 = flight::types::text_direction_left_to_right.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_direction_right_to_left() {
  const std::string result_utf8 = flight::types::text_direction_right_to_left.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_direction_top_to_bottom() {
  const std::string result_utf8 = flight::types::text_direction_top_to_bottom.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_capitals() {
  const std::string result_utf8 = flight::types::text_feature_capitals.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_contextual_alternates() {
  const std::string result_utf8 = flight::types::text_feature_contextual_alternates.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_discretionary_ligatures() {
  const std::string result_utf8 = flight::types::text_feature_discretionary_ligatures.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_fractions() {
  const std::string result_utf8 = flight::types::text_feature_fractions.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_kerning() {
  const std::string result_utf8 = flight::types::text_feature_kerning.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_ligatures() {
  const std::string result_utf8 = flight::types::text_feature_ligatures.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_old_style_figures() {
  const std::string result_utf8 = flight::types::text_feature_old_style_figures.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_small_caps() {
  const std::string result_utf8 = flight::types::text_feature_small_caps.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_stylistic_alternates() {
  const std::string result_utf8 = flight::types::text_feature_stylistic_alternates.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_subscript() {
  const std::string result_utf8 = flight::types::text_feature_subscript.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_superscript() {
  const std::string result_utf8 = flight::types::text_feature_superscript.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_feature_tabular_figures() {
  const std::string result_utf8 = flight::types::text_feature_tabular_figures.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_text_label_kind() {
  const std::string result_utf8 = flight::types::text_label_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_texture_atlas_format_kind_aseprite() {
  const std::string result_utf8 = flight::types::texture_atlas_format_kind_aseprite.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_texture_atlas_format_kind_cocos_plist() {
  const std::string result_utf8 = flight::types::texture_atlas_format_kind_cocos_plist.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_texture_atlas_format_kind_libgdx_atlas() {
  const std::string result_utf8 = flight::types::texture_atlas_format_kind_libgdx_atlas.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_texture_atlas_format_kind_starling() {
  const std::string result_utf8 = flight::types::texture_atlas_format_kind_starling.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_texture_atlas_format_kind_texture_packer() {
  const std::string result_utf8 = flight::types::texture_atlas_format_kind_texture_packer.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_texture_kind() {
  const std::string result_utf8 = flight::types::texture_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

double get_three_ds_camera() {
  return flight::types::three_ds_camera;
}

double get_three_ds_camera_aperture_mm() {
  return flight::types::three_ds_camera_aperture_mm;
}

double get_three_ds_camera_ranges() {
  return flight::types::three_ds_camera_ranges;
}

double get_three_ds_chunk_header_bytes() {
  return flight::types::three_ds_chunk_header_bytes;
}

double get_three_ds_color_byte() {
  return flight::types::three_ds_color_byte;
}

double get_three_ds_color_float() {
  return flight::types::three_ds_color_float;
}

double get_three_ds_editor() {
  return flight::types::three_ds_editor;
}

double get_three_ds_face_material() {
  return flight::types::three_ds_face_material;
}

double get_three_ds_faces() {
  return flight::types::three_ds_faces;
}

double get_three_ds_keyframe() {
  return flight::types::three_ds_keyframe;
}

double get_three_ds_keyframe_node_header() {
  return flight::types::three_ds_keyframe_node_header;
}

double get_three_ds_keyframe_object_node() {
  return flight::types::three_ds_keyframe_object_node;
}

double get_three_ds_keyframe_pivot() {
  return flight::types::three_ds_keyframe_pivot;
}

double get_three_ds_light() {
  return flight::types::three_ds_light;
}

double get_three_ds_light_inner_range() {
  return flight::types::three_ds_light_inner_range;
}

double get_three_ds_light_multiplier() {
  return flight::types::three_ds_light_multiplier;
}

double get_three_ds_light_off() {
  return flight::types::three_ds_light_off;
}

double get_three_ds_light_outer_range() {
  return flight::types::three_ds_light_outer_range;
}

double get_three_ds_light_spot() {
  return flight::types::three_ds_light_spot;
}

double get_three_ds_main() {
  return flight::types::three_ds_main;
}

double get_three_ds_material() {
  return flight::types::three_ds_material;
}

double get_three_ds_material_ambient() {
  return flight::types::three_ds_material_ambient;
}

double get_three_ds_material_bump_map() {
  return flight::types::three_ds_material_bump_map;
}

double get_three_ds_material_diffuse() {
  return flight::types::three_ds_material_diffuse;
}

double get_three_ds_material_name() {
  return flight::types::three_ds_material_name;
}

double get_three_ds_material_opacity_map() {
  return flight::types::three_ds_material_opacity_map;
}

double get_three_ds_material_shininess() {
  return flight::types::three_ds_material_shininess;
}

double get_three_ds_material_specular() {
  return flight::types::three_ds_material_specular;
}

double get_three_ds_material_texture_filename() {
  return flight::types::three_ds_material_texture_filename;
}

double get_three_ds_material_texture_map() {
  return flight::types::three_ds_material_texture_map;
}

double get_three_ds_material_transparency() {
  return flight::types::three_ds_material_transparency;
}

double get_three_ds_object() {
  return flight::types::three_ds_object;
}

double get_three_ds_percent_float() {
  return flight::types::three_ds_percent_float;
}

double get_three_ds_percent_int() {
  return flight::types::three_ds_percent_int;
}

double get_three_ds_smooth_group() {
  return flight::types::three_ds_smooth_group;
}

double get_three_ds_transform_matrix() {
  return flight::types::three_ds_transform_matrix;
}

double get_three_ds_trimesh() {
  return flight::types::three_ds_trimesh;
}

double get_three_ds_uv_coords() {
  return flight::types::three_ds_uv_coords;
}

double get_three_ds_vertices() {
  return flight::types::three_ds_vertices;
}

::String get_tilemap_format_kind_tiled_tmj() {
  const std::string result_utf8 = flight::types::tilemap_format_kind_tiled_tmj.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_tilemap_format_kind_tiled_tmx() {
  const std::string result_utf8 = flight::types::tilemap_format_kind_tiled_tmx.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_tilemap_format_kind_tiled_tsj() {
  const std::string result_utf8 = flight::types::tilemap_format_kind_tiled_tsj.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_tilemap_format_kind_tiled_tsx() {
  const std::string result_utf8 = flight::types::tilemap_format_kind_tiled_tsx.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_tilemap_kind() {
  const std::string result_utf8 = flight::types::tilemap_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_timeline_audio_cue_kind() {
  const std::string result_utf8 = flight::types::timeline_audio_cue_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_timeline_goto_cue_kind() {
  const std::string result_utf8 = flight::types::timeline_goto_cue_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_timeline_next_frame_cue_kind() {
  const std::string result_utf8 = flight::types::timeline_next_frame_cue_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_timeline_play_cue_kind() {
  const std::string result_utf8 = flight::types::timeline_play_cue_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_timeline_previous_frame_cue_kind() {
  const std::string result_utf8 = flight::types::timeline_previous_frame_cue_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_timeline_stop_cue_kind() {
  const std::string result_utf8 = flight::types::timeline_stop_cue_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_timeline_stream_audio_cue_kind() {
  const std::string result_utf8 = flight::types::timeline_stream_audio_cue_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_toon_material_kind() {
  const std::string result_utf8 = flight::types::toon_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_toon_modifier_kind() {
  const std::string result_utf8 = flight::types::toon_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_transmission_volume_pbr_extension_kind() {
  const std::string result_utf8 = flight::types::transmission_volume_pbr_extension_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_turbulence_force_kind() {
  const std::string result_utf8 = flight::types::turbulence_force_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_unitless_light_unit() {
  const std::string result_utf8 = flight::types::unitless_light_unit.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_unity_particle_format_kind() {
  const std::string result_utf8 = flight::types::unity_particle_format_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_unlit_material_kind() {
  const std::string result_utf8 = flight::types::unlit_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_vertex_color_material_kind() {
  const std::string result_utf8 = flight::types::vertex_color_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_vertex_displace_modifier_kind() {
  const std::string result_utf8 = flight::types::vertex_displace_modifier_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_vortex_force_kind() {
  const std::string result_utf8 = flight::types::vortex_force_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_voxel_grid_texture_source_kind() {
  const std::string result_utf8 = flight::types::voxel_grid_texture_source_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_wind_force_kind() {
  const std::string result_utf8 = flight::types::wind_force_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_wireframe_material_kind() {
  const std::string result_utf8 = flight::types::wireframe_material_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::String get_wrapped_diffuse_pbr_extension_kind() {
  const std::string result_utf8 = flight::types::wrapped_diffuse_pbr_extension_kind.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

} // namespace flight_hx::types
