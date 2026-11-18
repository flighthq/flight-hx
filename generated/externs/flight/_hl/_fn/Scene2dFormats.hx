package flight._hl._fn;

extern class Scene2dFormats {
	@:hlNative("flight", "flight_get_lottie_feature_names")
	public static function getLottieFeatureNames(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_apply_animation_clip_to_lottie_document")
	public static function applyAnimationClipToLottieDocument(clip:flight._hl.AnimationClip, time:Single):Void;
	@:hlNative("flight", "flight_register_all_lottie_handlers")
	public static function registerAllLottieHandlers(registry:flight._hl.LottieRegistry):Void;
	@:hlNative("flight", "flight_register_lottie_layer_handlers")
	public static function registerLottieLayerHandlers(registry:flight._hl.LottieRegistry):Void;
	@:hlNative("flight", "flight_register_lottie_mask_handlers")
	public static function registerLottieMaskHandlers(registry:flight._hl.LottieRegistry):Void;
	@:hlNative("flight", "flight_create_lottie_registry")
	public static function createLottieRegistry():flight._hl.LottieRegistry;
	@:hlNative("flight", "flight_get_lottie_layer_handler")
	public static function getLottieLayerHandler(registry:flight._hl.LottieRegistry, kind:flight._hl.LottieLayerKind):flight._hl.LottieLayerHandler;
	@:hlNative("flight", "flight_get_lottie_mask_handler")
	public static function getLottieMaskHandler(registry:flight._hl.LottieRegistry, kind:hl.Bytes):flight._hl.LottieMaskHandler;
	@:hlNative("flight", "flight_get_lottie_shape_item_handler")
	public static function getLottieShapeItemHandler(registry:flight._hl.LottieRegistry, kind:hl.Bytes):flight._hl.LottieShapeItemHandler;
	@:hlNative("flight", "flight_register_lottie_layer_handler")
	public static function registerLottieLayerHandler(registry:flight._hl.LottieRegistry, kind:flight._hl.LottieLayerKind, handle:flight._hl.LottieLayerHandler):Void;
	@:hlNative("flight", "flight_register_lottie_mask_handler")
	public static function registerLottieMaskHandler(registry:flight._hl.LottieRegistry, kind:hl.Bytes, handle:flight._hl.LottieMaskHandler):Void;
	@:hlNative("flight", "flight_register_lottie_shape_item_handler")
	public static function registerLottieShapeItemHandler(registry:flight._hl.LottieRegistry, kind:hl.Bytes, handle:flight._hl.LottieShapeItemHandler):Void;
	@:hlNative("flight", "flight_unregister_lottie_layer_handler")
	public static function unregisterLottieLayerHandler(registry:flight._hl.LottieRegistry, kind:flight._hl.LottieLayerKind):Bool;
	@:hlNative("flight", "flight_unregister_lottie_mask_handler")
	public static function unregisterLottieMaskHandler(registry:flight._hl.LottieRegistry, kind:hl.Bytes):Bool;
	@:hlNative("flight", "flight_unregister_lottie_shape_item_handler")
	public static function unregisterLottieShapeItemHandler(registry:flight._hl.LottieRegistry, kind:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_readable_lottie")
	public static function isReadableLottie(json:hl.Bytes):Bool;
	@:hlNative("flight", "flight_parse_lottie_requirements")
	public static function parseLottieRequirements(json:hl.Bytes):flight._hl.RequirementSet;
	@:hlNative("flight", "flight_register_lottie_shape_item_handlers")
	public static function registerLottieShapeItemHandlers(registry:flight._hl.LottieRegistry):Void;
	@:hlNative("flight", "flight_apply_animation_clip_to_rive_document")
	public static function applyAnimationClipToRiveDocument(clip:flight._hl.AnimationClip, time:Single):Void;
	@:hlNative("flight", "flight_register_rive_animation_handlers")
	public static function registerRiveAnimationHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_create_rive_image_sprite")
	public static function createRiveImageSprite(name:hl.Bytes, assetIndex:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_rive_image_asset_index")
	public static function getRiveImageAssetIndex(node:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_rive_image_texture")
	public static function getRiveImageTexture(node:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_rive_nested_artboard_index")
	public static function getRiveNestedArtboardIndex(node:hl.Bytes):Int;
	@:hlNative("flight", "flight_mark_rive_nested_artboard")
	public static function markRiveNestedArtboard(node:hl.Bytes, artboardIndex:Int):Void;
	@:hlNative("flight", "flight_register_rive_asset_handlers")
	public static function registerRiveAssetHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_clipping_handlers")
	public static function registerRiveClippingHandlers(pathBooleanKernel:flight._hl.PathBooleanKernel, registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_get_rive_core_property_field_type")
	public static function getRiveCorePropertyFieldType(key:Int):flight._hl.RiveFieldType;
	@:hlNative("flight", "flight_is_rive_core_bytes_property")
	public static function isRiveCoreBytesProperty(key:Int):Bool;
	@:hlNative("flight", "flight_is_readable_rive")
	public static function isReadableRive(source:hl.Bytes, sourceLen:Int):Bool;
	@:hlNative("flight", "flight_get_rive_core_type_name")
	public static function getRiveCoreTypeName(typeKey:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_rive_core_type_parent")
	public static function getRiveCoreTypeParent(typeKey:Int):haxe.Int64;
	@:hlNative("flight", "flight_is_rive_core_type_derived_from")
	public static function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool;
	@:hlNative("flight", "flight_register_rive_draw_order_handlers")
	public static function registerRiveDrawOrderHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_all_rive_handlers")
	public static function registerAllRiveHandlers(pathBooleanKernel:flight._hl.PathBooleanKernel, registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_create_rive_import_registry")
	public static function createRiveImportRegistry():flight._hl.RiveImportRegistry;
	@:hlNative("flight", "flight_register_rive_layout_handlers")
	public static function registerRiveLayoutHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_create_rive_import_registry_from_options")
	public static function createRiveImportRegistryFromOptions(options:flight._hl.RiveImportOptions, pathBooleanKernel:flight._hl.PathBooleanKernel):flight._hl.RiveImportRegistry;
	@:hlNative("flight", "flight_apply_rive_import_options")
	public static function applyRiveImportOptions(options:flight._hl.RiveImportOptions, pathBooleanKernel:flight._hl.PathBooleanKernel, registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_shape_handlers")
	public static function registerRiveShapeHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_append_rive_shape_geometry")
	public static function appendRiveShapeGeometry(shape:hl.Bytes, paths:hl.Bytes, pathsLen:Int):Void;
	@:hlNative("flight", "flight_register_rive_paint_handlers")
	public static function registerRivePaintHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_path_handlers")
	public static function registerRivePathHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_skeleton_handlers")
	public static function registerRiveSkeletonHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_solo_handlers")
	public static function registerRiveSoloHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_state_machine_handlers")
	public static function registerRiveStateMachineHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_text_handlers")
	public static function registerRiveTextHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_svg_clip_handlers")
	public static function registerSvgClipHandlers(registry:flight._hl.SvgRegistry):Void;
	@:hlNative("flight", "flight_register_svg_element_handlers")
	public static function registerSvgElementHandlers(registry:flight._hl.SvgRegistry):Void;
	@:hlNative("flight", "flight_register_all_svg_handlers")
	public static function registerAllSvgHandlers(registry:flight._hl.SvgRegistry):Void;
	@:hlNative("flight", "flight_create_svg_registry")
	public static function createSvgRegistry():flight._hl.SvgRegistry;
	@:hlNative("flight", "flight_get_svg_clip_handler")
	public static function getSvgClipHandler(registry:flight._hl.SvgRegistry, kind:hl.Bytes):flight._hl.SvgClipHandler;
	@:hlNative("flight", "flight_get_svg_element_handler")
	public static function getSvgElementHandler(registry:flight._hl.SvgRegistry, kind:hl.Bytes):flight._hl.SvgElementHandler;
	@:hlNative("flight", "flight_register_svg_clip_handler")
	public static function registerSvgClipHandler(registry:flight._hl.SvgRegistry, kind:hl.Bytes, handle:flight._hl.SvgClipHandler):Void;
	@:hlNative("flight", "flight_register_svg_element_handler")
	public static function registerSvgElementHandler(registry:flight._hl.SvgRegistry, kind:hl.Bytes, handle:flight._hl.SvgElementHandler):Void;
	@:hlNative("flight", "flight_unregister_svg_clip_handler")
	public static function unregisterSvgClipHandler(registry:flight._hl.SvgRegistry, kind:hl.Bytes):Bool;
	@:hlNative("flight", "flight_unregister_svg_element_handler")
	public static function unregisterSvgElementHandler(registry:flight._hl.SvgRegistry, kind:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_readable_svg")
	public static function isReadableSvg(source:hl.Bytes):Bool;
	@:hlNative("flight", "flight_parse_svg_requirements")
	public static function parseSvgRequirements(source:hl.Bytes):flight._hl.RequirementSet;
	@:hlNative("flight", "flight_free_lottie_registry")
	public static function freeLottieRegistry(ptr:flight._hl.LottieRegistry):Void;
	@:hlNative("flight", "flight_free_lottie_layer_handler")
	public static function freeLottieLayerHandler(ptr:flight._hl.LottieLayerHandler):Void;
	@:hlNative("flight", "flight_free_lottie_mask_handler")
	public static function freeLottieMaskHandler(ptr:flight._hl.LottieMaskHandler):Void;
	@:hlNative("flight", "flight_free_lottie_shape_item_handler")
	public static function freeLottieShapeItemHandler(ptr:flight._hl.LottieShapeItemHandler):Void;
	@:hlNative("flight", "flight_free_requirement_set")
	public static function freeRequirementSet(ptr:flight._hl.RequirementSet):Void;
	@:hlNative("flight", "flight_free_rive_field_type")
	public static function freeRiveFieldType(ptr:flight._hl.RiveFieldType):Void;
	@:hlNative("flight", "flight_free_rive_import_registry")
	public static function freeRiveImportRegistry(ptr:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_free_svg_registry")
	public static function freeSvgRegistry(ptr:flight._hl.SvgRegistry):Void;
	@:hlNative("flight", "flight_free_svg_clip_handler")
	public static function freeSvgClipHandler(ptr:flight._hl.SvgClipHandler):Void;
	@:hlNative("flight", "flight_free_svg_element_handler")
	public static function freeSvgElementHandler(ptr:flight._hl.SvgElementHandler):Void;
}
