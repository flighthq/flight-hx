// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
import flight.*;
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<set name="HXCPP_NO_CPP11" value="1" />
<unset name="HXCPP_CPP11" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/types.cpp" />
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
@:include("flight_hx/types.hpp")
extern class Types {
  @:native("flight_hx::types::get_add_node_child_command_kind")
  static function get_AddNodeChildCommandKind():String;

  @:native("flight_hx::types::get_all_light_layers")
  static function get_ALL_LIGHT_LAYERS():Float;

  @:native("flight_hx::types::get_ambient_light_kind")
  static function get_AmbientLightKind():String;

  @:native("flight_hx::types::get_anchor_layout_kind")
  static function get_AnchorLayoutKind():String;

  @:native("flight_hx::types::get_animated_normal_modifier_kind")
  static function get_AnimatedNormalModifierKind():String;

  @:native("flight_hx::types::get_animation_interpolation_cubic")
  static function get_AnimationInterpolationCubic():String;

  @:native("flight_hx::types::get_animation_interpolation_linear")
  static function get_AnimationInterpolationLinear():String;

  @:native("flight_hx::types::get_animation_interpolation_step")
  static function get_AnimationInterpolationStep():String;

  @:native("flight_hx::types::get_animation_loop_mode_ping_pong")
  static function get_AnimationLoopModePingPong():String;

  @:native("flight_hx::types::get_animation_loop_mode_repeat")
  static function get_AnimationLoopModeRepeat():String;

  @:native("flight_hx::types::get_anisotropy_pbr_extension_kind")
  static function get_AnisotropyPbrExtensionKind():String;

  @:native("flight_hx::types::get_area_light_kind")
  static function get_AreaLightKind():String;

  @:native("flight_hx::types::get_attractor_force_kind")
  static function get_AttractorForceKind():String;

  @:native("flight_hx::types::get_billboard_kind")
  static function get_BillboardKind():String;

  @:native("flight_hx::types::get_bitmap_font_format_kind_bm_font_binary")
  static function get_BitmapFontFormatKindBmFontBinary():String;

  @:native("flight_hx::types::get_bitmap_font_format_kind_bm_font_json")
  static function get_BitmapFontFormatKindBmFontJson():String;

  @:native("flight_hx::types::get_bitmap_font_format_kind_bm_font_text")
  static function get_BitmapFontFormatKindBmFontText():String;

  @:native("flight_hx::types::get_bitmap_font_format_kind_bm_font_xml")
  static function get_BitmapFontFormatKindBmFontXml():String;

  @:native("flight_hx::types::get_bitmap_text_kind")
  static function get_BitmapTextKind():String;

  @:native("flight_hx::types::get_bitmap_texture_source_kind")
  static function get_BitmapTextureSourceKind():String;

  @:native("flight_hx::types::get_blinn_phong_material_kind")
  static function get_BlinnPhongMaterialKind():String;

  @:native("flight_hx::types::get_bounding_box_attachment_2d_kind")
  static function get_BoundingBoxAttachment2DKind():String;

  @:native("flight_hx::types::get_candela_light_unit")
  static function get_CandelaLightUnit():String;

  @:native("flight_hx::types::get_circle_collider_kind")
  static function get_CircleColliderKind():String;

  @:native("flight_hx::types::get_clearcoat_pbr_extension_kind")
  static function get_ClearcoatPbrExtensionKind():String;

  @:native("flight_hx::types::get_clipboard_format_bookmark")
  static function get_ClipboardFormatBookmark():String;

  @:native("flight_hx::types::get_clipboard_format_html")
  static function get_ClipboardFormatHtml():String;

  @:native("flight_hx::types::get_clipboard_format_image")
  static function get_ClipboardFormatImage():String;

  @:native("flight_hx::types::get_clipboard_format_rtf")
  static function get_ClipboardFormatRtf():String;

  @:native("flight_hx::types::get_clipboard_format_text")
  static function get_ClipboardFormatText():String;

  @:native("flight_hx::types::get_clipboard_format_uri_list")
  static function get_ClipboardFormatUriList():String;

  @:native("flight_hx::types::get_clipping_attachment_2d_kind")
  static function get_ClippingAttachment2DKind():String;

  @:native("flight_hx::types::get_composite_command_kind")
  static function get_CompositeCommandKind():String;

  @:native("flight_hx::types::get_compressed_image_texture_source_kind")
  static function get_CompressedImageTextureSourceKind():String;

  @:native("flight_hx::types::get_cube_face_negative_x")
  static function get_CubeFaceNegativeX():Float;

  @:native("flight_hx::types::get_cube_face_negative_y")
  static function get_CubeFaceNegativeY():Float;

  @:native("flight_hx::types::get_cube_face_negative_z")
  static function get_CubeFaceNegativeZ():Float;

  @:native("flight_hx::types::get_cube_face_positive_x")
  static function get_CubeFacePositiveX():Float;

  @:native("flight_hx::types::get_cube_face_positive_y")
  static function get_CubeFacePositiveY():Float;

  @:native("flight_hx::types::get_cube_face_positive_z")
  static function get_CubeFacePositiveZ():Float;

  @:native("flight_hx::types::get_curl_noise_force_kind")
  static function get_CurlNoiseForceKind():String;

  @:native("flight_hx::types::get_custom_shader_material_kind")
  static function get_CustomShaderMaterialKind():String;

  @:native("flight_hx::types::get_depth_material_kind")
  static function get_DepthMaterialKind():String;

  @:native("flight_hx::types::get_device_form_factor_car")
  static function get_DeviceFormFactorCar():String;

  @:native("flight_hx::types::get_device_form_factor_desktop")
  static function get_DeviceFormFactorDesktop():String;

  @:native("flight_hx::types::get_device_form_factor_phone")
  static function get_DeviceFormFactorPhone():String;

  @:native("flight_hx::types::get_device_form_factor_tablet")
  static function get_DeviceFormFactorTablet():String;

  @:native("flight_hx::types::get_device_form_factor_tv")
  static function get_DeviceFormFactorTV():String;

  @:native("flight_hx::types::get_device_form_factor_unknown")
  static function get_DeviceFormFactorUnknown():String;

  @:native("flight_hx::types::get_device_form_factor_watch")
  static function get_DeviceFormFactorWatch():String;

  @:native("flight_hx::types::get_directional_shadow_map_size")
  static function get_DIRECTIONAL_SHADOW_MAP_SIZE():Float;

  @:native("flight_hx::types::get_directional_light_kind")
  static function get_DirectionalLightKind():String;

  @:native("flight_hx::types::get_display_object_kind")
  static function get_DisplayObjectKind():String;

  @:native("flight_hx::types::get_dissolve_modifier_kind")
  static function get_DissolveModifierKind():String;

  @:native("flight_hx::types::get_drag_force_kind")
  static function get_DragForceKind():String;

  @:native("flight_hx::types::get_emissive_material_kind")
  static function get_EmissiveMaterialKind():String;

  @:native("flight_hx::types::get_emissive_modifier_kind")
  static function get_EmissiveModifierKind():String;

  @:native("flight_hx::types::get_environment_kind")
  static function get_EnvironmentKind():String;

  @:native("flight_hx::types::get_env_reflect_modifier_kind")
  static function get_EnvReflectModifierKind():String;

  @:native("flight_hx::types::get_extended_pbr_material_kind")
  static function get_ExtendedPbrMaterialKind():String;

  @:native("flight_hx::types::get_external_texture_source_kind")
  static function get_ExternalTextureSourceKind():String;

  @:native("flight_hx::types::get_flex_layout_kind")
  static function get_FlexLayoutKind():String;

  @:native("flight_hx::types::get_fog_modifier_kind")
  static function get_FogModifierKind():String;

  @:native("flight_hx::types::get_font_variation_italic")
  static function get_FontVariationItalic():String;

  @:native("flight_hx::types::get_font_variation_optical_size")
  static function get_FontVariationOpticalSize():String;

  @:native("flight_hx::types::get_font_variation_slant")
  static function get_FontVariationSlant():String;

  @:native("flight_hx::types::get_font_variation_weight")
  static function get_FontVariationWeight():String;

  @:native("flight_hx::types::get_font_variation_width")
  static function get_FontVariationWidth():String;

  @:native("flight_hx::types::get_grid_layout_kind")
  static function get_GridLayoutKind():String;

  @:native("flight_hx::types::get_group_kind")
  static function get_GroupKind():String;

  @:native("flight_hx::types::get_hemisphere_light_kind")
  static function get_HemisphereLightKind():String;

  @:native("flight_hx::types::get_html_view_kind")
  static function get_HtmlViewKind():String;

  @:native("flight_hx::types::get_image_texture_source_kind")
  static function get_ImageTextureSourceKind():String;

  @:native("flight_hx::types::get_instanced_mesh_kind")
  static function get_InstancedMeshKind():String;

  @:native("flight_hx::types::get_iridescence_pbr_extension_kind")
  static function get_IridescencePbrExtensionKind():String;

  @:native("flight_hx::types::get_lambert_material_kind")
  static function get_LambertMaterialKind():String;

  @:native("flight_hx::types::get_libgdx_particle_format_kind")
  static function get_LibgdxParticleFormatKind():String;

  @:native("flight_hx::types::get_light_probe_sh_floats")
  static function get_LIGHT_PROBE_SH_FLOATS():Float;

  @:native("flight_hx::types::get_lod_mesh_kind")
  static function get_LodMeshKind():String;

  @:native("flight_hx::types::get_lumen_light_unit")
  static function get_LumenLightUnit():String;

  @:native("flight_hx::types::get_lux_light_unit")
  static function get_LuxLightUnit():String;

  @:native("flight_hx::types::get_matcap_material_kind")
  static function get_MatcapMaterialKind():String;

  @:native("flight_hx::types::get_max_collision_contact_points_3_d")
  static function get_MAX_COLLISION_CONTACT_POINTS_3D():Float;

  @:native("flight_hx::types::get_max_directional_shadow_pcf_radius")
  static function get_MAX_DIRECTIONAL_SHADOW_PCF_RADIUS():Float;

  @:native("flight_hx::types::get_max_forward_lights")
  static function get_MAX_FORWARD_LIGHTS():Float;

  @:native("flight_hx::types::get_md5_material_feature")
  static function get_MD5_MATERIAL_FEATURE():String;

  @:native("flight_hx::types::get_md5_skeleton_feature")
  static function get_MD5_SKELETON_FEATURE():String;

  @:native("flight_hx::types::get_mesh_attachment_2d_kind")
  static function get_MeshAttachment2DKind():String;

  @:native("flight_hx::types::get_mesh_deformer_morph")
  static function get_MeshDeformerMorph():String;

  @:native("flight_hx::types::get_mesh_deformer_none")
  static function get_MeshDeformerNone():String;

  @:native("flight_hx::types::get_mesh_deformer_skeletal")
  static function get_MeshDeformerSkeletal():String;

  @:native("flight_hx::types::get_mesh_kind")
  static function get_MeshKind():String;

  @:native("flight_hx::types::get_morph_shape_kind")
  static function get_MorphShapeKind():String;

  @:native("flight_hx::types::get_movie_clip_kind")
  static function get_MovieClipKind():String;

  @:native("flight_hx::types::get_native_text_kind")
  static function get_NativeTextKind():String;

  @:native("flight_hx::types::get_node_2d_animation_path_alpha")
  static function get_Node2DAnimationPathAlpha():String;

  @:native("flight_hx::types::get_node_2d_animation_path_pivot")
  static function get_Node2DAnimationPathPivot():String;

  @:native("flight_hx::types::get_node_2d_animation_path_pivot_x")
  static function get_Node2DAnimationPathPivotX():String;

  @:native("flight_hx::types::get_node_2d_animation_path_pivot_y")
  static function get_Node2DAnimationPathPivotY():String;

  @:native("flight_hx::types::get_node_2d_animation_path_position")
  static function get_Node2DAnimationPathPosition():String;

  @:native("flight_hx::types::get_node_2d_animation_path_rotation")
  static function get_Node2DAnimationPathRotation():String;

  @:native("flight_hx::types::get_node_2d_animation_path_scale")
  static function get_Node2DAnimationPathScale():String;

  @:native("flight_hx::types::get_node_2d_animation_path_scale_x")
  static function get_Node2DAnimationPathScaleX():String;

  @:native("flight_hx::types::get_node_2d_animation_path_scale_y")
  static function get_Node2DAnimationPathScaleY():String;

  @:native("flight_hx::types::get_node_2d_animation_path_skew")
  static function get_Node2DAnimationPathSkew():String;

  @:native("flight_hx::types::get_node_2d_animation_path_skew_x")
  static function get_Node2DAnimationPathSkewX():String;

  @:native("flight_hx::types::get_node_2d_animation_path_skew_y")
  static function get_Node2DAnimationPathSkewY():String;

  @:native("flight_hx::types::get_node_2d_animation_path_visible")
  static function get_Node2DAnimationPathVisible():String;

  @:native("flight_hx::types::get_node_2d_animation_path_x")
  static function get_Node2DAnimationPathX():String;

  @:native("flight_hx::types::get_node_2d_animation_path_y")
  static function get_Node2DAnimationPathY():String;

  @:native("flight_hx::types::get_node_3d_kind")
  static function get_Node3DKind():String;

  @:native("flight_hx::types::get_node_kind")
  static function get_NodeKind():String;

  @:native("flight_hx::types::get_normal_material_kind")
  static function get_NormalMaterialKind():String;

  @:native("flight_hx::types::get_obj_material_blinn_phong_feature")
  static function get_OBJ_MATERIAL_BLINN_PHONG_FEATURE():String;

  @:native("flight_hx::types::get_obj_material_standard_pbr_feature")
  static function get_OBJ_MATERIAL_STANDARD_PBR_FEATURE():String;

  @:native("flight_hx::types::get_particle_designer_format_kind")
  static function get_ParticleDesignerFormatKind():String;

  @:native("flight_hx::types::get_particle_emitter_2d_kind")
  static function get_ParticleEmitter2DKind():String;

  @:native("flight_hx::types::get_particle_emitter_3d_kind")
  static function get_ParticleEmitter3DKind():String;

  @:native("flight_hx::types::get_path_attachment_2d_kind")
  static function get_PathAttachment2DKind():String;

  @:native("flight_hx::types::get_phong_material_kind")
  static function get_PhongMaterialKind():String;

  @:native("flight_hx::types::get_pixi_particle_format_kind")
  static function get_PixiParticleFormatKind():String;

  @:native("flight_hx::types::get_plane_collider_kind")
  static function get_PlaneColliderKind():String;

  @:native("flight_hx::types::get_point_attachment_2d_kind")
  static function get_PointAttachment2DKind():String;

  @:native("flight_hx::types::get_point_gravity_well_force_kind")
  static function get_PointGravityWellForceKind():String;

  @:native("flight_hx::types::get_point_light_kind")
  static function get_PointLightKind():String;

  @:native("flight_hx::types::get_quad_batch_kind")
  static function get_QuadBatchKind():String;

  @:native("flight_hx::types::get_rectangle_collider_kind")
  static function get_RectangleColliderKind():String;

  @:native("flight_hx::types::get_region_attachment_2d_kind")
  static function get_RegionAttachment2DKind():String;

  @:native("flight_hx::types::get_remove_node_child_command_kind")
  static function get_RemoveNodeChildCommandKind():String;

  @:native("flight_hx::types::get_render_cache_kind")
  static function get_RenderCacheKind():String;

  @:native("flight_hx::types::get_render_target_texture_source_kind")
  static function get_RenderTargetTextureSourceKind():String;

  @:native("flight_hx::types::get_reorder_node_child_command_kind")
  static function get_ReorderNodeChildCommandKind():String;

  @:native("flight_hx::types::get_rich_text_kind")
  static function get_RichTextKind():String;

  @:native("flight_hx::types::get_rim_modifier_kind")
  static function get_RimModifierKind():String;

  @:native("flight_hx::types::get_sampler_kind")
  static function get_SamplerKind():String;

  @:native("flight_hx::types::get_scale9_shape_kind")
  static function get_Scale9ShapeKind():String;

  @:native("flight_hx::types::get_scale9_sprite_kind")
  static function get_Scale9SpriteKind():String;

  @:native("flight_hx::types::get_scene_light_ambient_radiance_offset")
  static function get_SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET():Float;

  @:native("flight_hx::types::get_scene_light_block_floats")
  static function get_SCENE_LIGHT_BLOCK_FLOATS():Float;

  @:native("flight_hx::types::get_scene_light_directional_direction_offset")
  static function get_SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET():Float;

  @:native("flight_hx::types::get_scene_light_directional_radiance_offset")
  static function get_SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET():Float;

  @:native("flight_hx::types::get_scene_light_head_floats")
  static function get_SCENE_LIGHT_HEAD_FLOATS():Float;

  @:native("flight_hx::types::get_scene_light_hemisphere_offset")
  static function get_SCENE_LIGHT_HEMISPHERE_OFFSET():Float;

  @:native("flight_hx::types::get_scene_light_hemisphere_stride")
  static function get_SCENE_LIGHT_HEMISPHERE_STRIDE():Float;

  @:native("flight_hx::types::get_scene_light_point_offset")
  static function get_SCENE_LIGHT_POINT_OFFSET():Float;

  @:native("flight_hx::types::get_scene_light_point_stride")
  static function get_SCENE_LIGHT_POINT_STRIDE():Float;

  @:native("flight_hx::types::get_scene_light_spot_offset")
  static function get_SCENE_LIGHT_SPOT_OFFSET():Float;

  @:native("flight_hx::types::get_scene_light_spot_stride")
  static function get_SCENE_LIGHT_SPOT_STRIDE():Float;

  @:native("flight_hx::types::get_scene_3d_animation_path_rotation")
  static function get_Scene3DAnimationPathRotation():String;

  @:native("flight_hx::types::get_scene_3d_animation_path_scale")
  static function get_Scene3DAnimationPathScale():String;

  @:native("flight_hx::types::get_scene_3d_animation_path_translation")
  static function get_Scene3DAnimationPathTranslation():String;

  @:native("flight_hx::types::get_scene_3d_animation_path_weights")
  static function get_Scene3DAnimationPathWeights():String;

  @:native("flight_hx::types::get_set_node_property_command_kind")
  static function get_SetNodePropertyCommandKind():String;

  @:native("flight_hx::types::get_shaded_material_kind")
  static function get_ShadedMaterialKind():String;

  @:native("flight_hx::types::get_shape_kind")
  static function get_ShapeKind():String;

  @:native("flight_hx::types::get_sheen_pbr_extension_kind")
  static function get_SheenPbrExtensionKind():String;

  @:native("flight_hx::types::get_soft_keyboard_attach_acquisition_failed_kind")
  static function get_SoftKeyboardAttachAcquisitionFailedKind():String;

  @:native("flight_hx::types::get_soft_keyboard_attach_ok_kind")
  static function get_SoftKeyboardAttachOkKind():String;

  @:native("flight_hx::types::get_soft_keyboard_resize_body_kind")
  static function get_SoftKeyboardResizeBodyKind():String;

  @:native("flight_hx::types::get_soft_keyboard_resize_none_kind")
  static function get_SoftKeyboardResizeNoneKind():String;

  @:native("flight_hx::types::get_soft_keyboard_setter_ok_kind")
  static function get_SoftKeyboardSetterOkKind():String;

  @:native("flight_hx::types::get_soft_keyboard_setter_operation_failed_kind")
  static function get_SoftKeyboardSetterOperationFailedKind():String;

  @:native("flight_hx::types::get_soft_keyboard_setter_operation_unavailable_kind")
  static function get_SoftKeyboardSetterOperationUnavailableKind():String;

  @:native("flight_hx::types::get_soft_keyboard_style_dark_kind")
  static function get_SoftKeyboardStyleDarkKind():String;

  @:native("flight_hx::types::get_soft_keyboard_style_default_kind")
  static function get_SoftKeyboardStyleDefaultKind():String;

  @:native("flight_hx::types::get_soft_keyboard_visibility_ok_kind")
  static function get_SoftKeyboardVisibilityOkKind():String;

  @:native("flight_hx::types::get_soft_keyboard_visibility_operation_failed_kind")
  static function get_SoftKeyboardVisibilityOperationFailedKind():String;

  @:native("flight_hx::types::get_specular_glossiness_pbr_material_kind")
  static function get_SpecularGlossinessPbrMaterialKind():String;

  @:native("flight_hx::types::get_specular_pbr_extension_kind")
  static function get_SpecularPbrExtensionKind():String;

  @:native("flight_hx::types::get_sphere_collider_kind")
  static function get_SphereColliderKind():String;

  @:native("flight_hx::types::get_spine_particle_format_kind")
  static function get_SpineParticleFormatKind():String;

  @:native("flight_hx::types::get_spot_light_kind")
  static function get_SpotLightKind():String;

  @:native("flight_hx::types::get_sprite_kind")
  static function get_SpriteKind():String;

  @:native("flight_hx::types::get_spritesheet_format_kind_aseprite")
  static function get_SpritesheetFormatKindAseprite():String;

  @:native("flight_hx::types::get_spritesheet_format_kind_cocos_plist")
  static function get_SpritesheetFormatKindCocosPlist():String;

  @:native("flight_hx::types::get_spritesheet_format_kind_libgdx_atlas")
  static function get_SpritesheetFormatKindLibgdxAtlas():String;

  @:native("flight_hx::types::get_spritesheet_format_kind_starling")
  static function get_SpritesheetFormatKindStarling():String;

  @:native("flight_hx::types::get_spritesheet_format_kind_texture_packer")
  static function get_SpritesheetFormatKindTexturePacker():String;

  @:native("flight_hx::types::get_standard_material_kind")
  static function get_StandardMaterialKind():String;

  @:native("flight_hx::types::get_standard_pbr_material_kind")
  static function get_StandardPbrMaterialKind():String;

  @:native("flight_hx::types::get_starling_pex_format_kind")
  static function get_StarlingPexFormatKind():String;

  @:native("flight_hx::types::get_statechart_atomic_state_kind")
  static function get_StatechartAtomicStateKind():String;

  @:native("flight_hx::types::get_statechart_nested_state_kind")
  static function get_StatechartNestedStateKind():String;

  @:native("flight_hx::types::get_text_direction_left_to_right")
  static function get_TextDirectionLeftToRight():String;

  @:native("flight_hx::types::get_text_direction_right_to_left")
  static function get_TextDirectionRightToLeft():String;

  @:native("flight_hx::types::get_text_direction_top_to_bottom")
  static function get_TextDirectionTopToBottom():String;

  @:native("flight_hx::types::get_text_feature_capitals")
  static function get_TextFeatureCapitals():String;

  @:native("flight_hx::types::get_text_feature_contextual_alternates")
  static function get_TextFeatureContextualAlternates():String;

  @:native("flight_hx::types::get_text_feature_discretionary_ligatures")
  static function get_TextFeatureDiscretionaryLigatures():String;

  @:native("flight_hx::types::get_text_feature_fractions")
  static function get_TextFeatureFractions():String;

  @:native("flight_hx::types::get_text_feature_kerning")
  static function get_TextFeatureKerning():String;

  @:native("flight_hx::types::get_text_feature_ligatures")
  static function get_TextFeatureLigatures():String;

  @:native("flight_hx::types::get_text_feature_old_style_figures")
  static function get_TextFeatureOldStyleFigures():String;

  @:native("flight_hx::types::get_text_feature_small_caps")
  static function get_TextFeatureSmallCaps():String;

  @:native("flight_hx::types::get_text_feature_stylistic_alternates")
  static function get_TextFeatureStylisticAlternates():String;

  @:native("flight_hx::types::get_text_feature_subscript")
  static function get_TextFeatureSubscript():String;

  @:native("flight_hx::types::get_text_feature_superscript")
  static function get_TextFeatureSuperscript():String;

  @:native("flight_hx::types::get_text_feature_tabular_figures")
  static function get_TextFeatureTabularFigures():String;

  @:native("flight_hx::types::get_text_label_kind")
  static function get_TextLabelKind():String;

  @:native("flight_hx::types::get_texture_atlas_format_kind_aseprite")
  static function get_TextureAtlasFormatKindAseprite():String;

  @:native("flight_hx::types::get_texture_atlas_format_kind_cocos_plist")
  static function get_TextureAtlasFormatKindCocosPlist():String;

  @:native("flight_hx::types::get_texture_atlas_format_kind_libgdx_atlas")
  static function get_TextureAtlasFormatKindLibgdxAtlas():String;

  @:native("flight_hx::types::get_texture_atlas_format_kind_starling")
  static function get_TextureAtlasFormatKindStarling():String;

  @:native("flight_hx::types::get_texture_atlas_format_kind_texture_packer")
  static function get_TextureAtlasFormatKindTexturePacker():String;

  @:native("flight_hx::types::get_texture_kind")
  static function get_TextureKind():String;

  @:native("flight_hx::types::get_three_ds_camera")
  static function get_THREE_DS_CAMERA():Float;

  @:native("flight_hx::types::get_three_ds_camera_aperture_mm")
  static function get_THREE_DS_CAMERA_APERTURE_MM():Float;

  @:native("flight_hx::types::get_three_ds_camera_ranges")
  static function get_THREE_DS_CAMERA_RANGES():Float;

  @:native("flight_hx::types::get_three_ds_chunk_header_bytes")
  static function get_THREE_DS_CHUNK_HEADER_BYTES():Float;

  @:native("flight_hx::types::get_three_ds_color_byte")
  static function get_THREE_DS_COLOR_BYTE():Float;

  @:native("flight_hx::types::get_three_ds_color_float")
  static function get_THREE_DS_COLOR_FLOAT():Float;

  @:native("flight_hx::types::get_three_ds_editor")
  static function get_THREE_DS_EDITOR():Float;

  @:native("flight_hx::types::get_three_ds_face_material")
  static function get_THREE_DS_FACE_MATERIAL():Float;

  @:native("flight_hx::types::get_three_ds_faces")
  static function get_THREE_DS_FACES():Float;

  @:native("flight_hx::types::get_three_ds_keyframe")
  static function get_THREE_DS_KEYFRAME():Float;

  @:native("flight_hx::types::get_three_ds_keyframe_node_header")
  static function get_THREE_DS_KEYFRAME_NODE_HEADER():Float;

  @:native("flight_hx::types::get_three_ds_keyframe_object_node")
  static function get_THREE_DS_KEYFRAME_OBJECT_NODE():Float;

  @:native("flight_hx::types::get_three_ds_keyframe_pivot")
  static function get_THREE_DS_KEYFRAME_PIVOT():Float;

  @:native("flight_hx::types::get_three_ds_light")
  static function get_THREE_DS_LIGHT():Float;

  @:native("flight_hx::types::get_three_ds_light_inner_range")
  static function get_THREE_DS_LIGHT_INNER_RANGE():Float;

  @:native("flight_hx::types::get_three_ds_light_multiplier")
  static function get_THREE_DS_LIGHT_MULTIPLIER():Float;

  @:native("flight_hx::types::get_three_ds_light_off")
  static function get_THREE_DS_LIGHT_OFF():Float;

  @:native("flight_hx::types::get_three_ds_light_outer_range")
  static function get_THREE_DS_LIGHT_OUTER_RANGE():Float;

  @:native("flight_hx::types::get_three_ds_light_spot")
  static function get_THREE_DS_LIGHT_SPOT():Float;

  @:native("flight_hx::types::get_three_ds_main")
  static function get_THREE_DS_MAIN():Float;

  @:native("flight_hx::types::get_three_ds_material")
  static function get_THREE_DS_MATERIAL():Float;

  @:native("flight_hx::types::get_three_ds_material_ambient")
  static function get_THREE_DS_MATERIAL_AMBIENT():Float;

  @:native("flight_hx::types::get_three_ds_material_bump_map")
  static function get_THREE_DS_MATERIAL_BUMP_MAP():Float;

  @:native("flight_hx::types::get_three_ds_material_diffuse")
  static function get_THREE_DS_MATERIAL_DIFFUSE():Float;

  @:native("flight_hx::types::get_three_ds_material_name")
  static function get_THREE_DS_MATERIAL_NAME():Float;

  @:native("flight_hx::types::get_three_ds_material_opacity_map")
  static function get_THREE_DS_MATERIAL_OPACITY_MAP():Float;

  @:native("flight_hx::types::get_three_ds_material_shininess")
  static function get_THREE_DS_MATERIAL_SHININESS():Float;

  @:native("flight_hx::types::get_three_ds_material_specular")
  static function get_THREE_DS_MATERIAL_SPECULAR():Float;

  @:native("flight_hx::types::get_three_ds_material_texture_filename")
  static function get_THREE_DS_MATERIAL_TEXTURE_FILENAME():Float;

  @:native("flight_hx::types::get_three_ds_material_texture_map")
  static function get_THREE_DS_MATERIAL_TEXTURE_MAP():Float;

  @:native("flight_hx::types::get_three_ds_material_transparency")
  static function get_THREE_DS_MATERIAL_TRANSPARENCY():Float;

  @:native("flight_hx::types::get_three_ds_object")
  static function get_THREE_DS_OBJECT():Float;

  @:native("flight_hx::types::get_three_ds_percent_float")
  static function get_THREE_DS_PERCENT_FLOAT():Float;

  @:native("flight_hx::types::get_three_ds_percent_int")
  static function get_THREE_DS_PERCENT_INT():Float;

  @:native("flight_hx::types::get_three_ds_smooth_group")
  static function get_THREE_DS_SMOOTH_GROUP():Float;

  @:native("flight_hx::types::get_three_ds_transform_matrix")
  static function get_THREE_DS_TRANSFORM_MATRIX():Float;

  @:native("flight_hx::types::get_three_ds_trimesh")
  static function get_THREE_DS_TRIMESH():Float;

  @:native("flight_hx::types::get_three_ds_uv_coords")
  static function get_THREE_DS_UV_COORDS():Float;

  @:native("flight_hx::types::get_three_ds_vertices")
  static function get_THREE_DS_VERTICES():Float;

  @:native("flight_hx::types::get_tilemap_format_kind_tiled_tmj")
  static function get_TilemapFormatKindTiledTmj():String;

  @:native("flight_hx::types::get_tilemap_format_kind_tiled_tmx")
  static function get_TilemapFormatKindTiledTmx():String;

  @:native("flight_hx::types::get_tilemap_format_kind_tiled_tsj")
  static function get_TilemapFormatKindTiledTsj():String;

  @:native("flight_hx::types::get_tilemap_format_kind_tiled_tsx")
  static function get_TilemapFormatKindTiledTsx():String;

  @:native("flight_hx::types::get_tilemap_kind")
  static function get_TilemapKind():String;

  @:native("flight_hx::types::get_timeline_audio_cue_kind")
  static function get_TimelineAudioCueKind():String;

  @:native("flight_hx::types::get_timeline_goto_cue_kind")
  static function get_TimelineGotoCueKind():String;

  @:native("flight_hx::types::get_timeline_next_frame_cue_kind")
  static function get_TimelineNextFrameCueKind():String;

  @:native("flight_hx::types::get_timeline_play_cue_kind")
  static function get_TimelinePlayCueKind():String;

  @:native("flight_hx::types::get_timeline_previous_frame_cue_kind")
  static function get_TimelinePreviousFrameCueKind():String;

  @:native("flight_hx::types::get_timeline_stop_cue_kind")
  static function get_TimelineStopCueKind():String;

  @:native("flight_hx::types::get_timeline_stream_audio_cue_kind")
  static function get_TimelineStreamAudioCueKind():String;

  @:native("flight_hx::types::get_toon_material_kind")
  static function get_ToonMaterialKind():String;

  @:native("flight_hx::types::get_toon_modifier_kind")
  static function get_ToonModifierKind():String;

  @:native("flight_hx::types::get_transmission_volume_pbr_extension_kind")
  static function get_TransmissionVolumePbrExtensionKind():String;

  @:native("flight_hx::types::get_turbulence_force_kind")
  static function get_TurbulenceForceKind():String;

  @:native("flight_hx::types::get_unitless_light_unit")
  static function get_UnitlessLightUnit():String;

  @:native("flight_hx::types::get_unity_particle_format_kind")
  static function get_UnityParticleFormatKind():String;

  @:native("flight_hx::types::get_unlit_material_kind")
  static function get_UnlitMaterialKind():String;

  @:native("flight_hx::types::get_vertex_color_material_kind")
  static function get_VertexColorMaterialKind():String;

  @:native("flight_hx::types::get_vertex_displace_modifier_kind")
  static function get_VertexDisplaceModifierKind():String;

  @:native("flight_hx::types::get_vortex_force_kind")
  static function get_VortexForceKind():String;

  @:native("flight_hx::types::get_voxel_grid_texture_source_kind")
  static function get_VoxelGridTextureSourceKind():String;

  @:native("flight_hx::types::get_wind_force_kind")
  static function get_WindForceKind():String;

  @:native("flight_hx::types::get_wireframe_material_kind")
  static function get_WireframeMaterialKind():String;

  @:native("flight_hx::types::get_wrapped_diffuse_pbr_extension_kind")
  static function get_WrappedDiffusePbrExtensionKind():String;
}
#end
