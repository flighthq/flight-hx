package flight._cpp._fn;

extern class Scene2dFormats {
	@:native("flight_get_lottie_feature_names")
	public static function getLottieFeatureNames(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_apply_animation_clip_to_lottie_document")
	public static function applyAnimationClipToLottieDocument(clip:flight._cpp.AnimationClip, time:Float):Void;
	@:native("flight_register_all_lottie_handlers")
	public static function registerAllLottieHandlers(registry:flight._cpp.LottieRegistry):Void;
	@:native("flight_register_lottie_layer_handlers")
	public static function registerLottieLayerHandlers(registry:flight._cpp.LottieRegistry):Void;
	@:native("flight_register_lottie_mask_handlers")
	public static function registerLottieMaskHandlers(registry:flight._cpp.LottieRegistry):Void;
	@:native("flight_create_lottie_registry")
	public static function createLottieRegistry():flight._cpp.LottieRegistry;
	@:native("flight_get_lottie_layer_handler")
	public static function getLottieLayerHandler(registry:flight._cpp.LottieRegistry, kind:flight._cpp.LottieLayerKind):flight._cpp.LottieLayerHandler;
	@:native("flight_get_lottie_mask_handler")
	public static function getLottieMaskHandler(registry:flight._cpp.LottieRegistry, kind:cpp.ConstCharStar):flight._cpp.LottieMaskHandler;
	@:native("flight_get_lottie_shape_item_handler")
	public static function getLottieShapeItemHandler(registry:flight._cpp.LottieRegistry, kind:cpp.ConstCharStar):flight._cpp.LottieShapeItemHandler;
	@:native("flight_register_lottie_layer_handler")
	public static function registerLottieLayerHandler(registry:flight._cpp.LottieRegistry, kind:flight._cpp.LottieLayerKind, handle:flight._cpp.LottieLayerHandler):Void;
	@:native("flight_register_lottie_mask_handler")
	public static function registerLottieMaskHandler(registry:flight._cpp.LottieRegistry, kind:cpp.ConstCharStar, handle:flight._cpp.LottieMaskHandler):Void;
	@:native("flight_register_lottie_shape_item_handler")
	public static function registerLottieShapeItemHandler(registry:flight._cpp.LottieRegistry, kind:cpp.ConstCharStar, handle:flight._cpp.LottieShapeItemHandler):Void;
	@:native("flight_unregister_lottie_layer_handler")
	public static function unregisterLottieLayerHandler(registry:flight._cpp.LottieRegistry, kind:flight._cpp.LottieLayerKind):Bool;
	@:native("flight_unregister_lottie_mask_handler")
	public static function unregisterLottieMaskHandler(registry:flight._cpp.LottieRegistry, kind:cpp.ConstCharStar):Bool;
	@:native("flight_unregister_lottie_shape_item_handler")
	public static function unregisterLottieShapeItemHandler(registry:flight._cpp.LottieRegistry, kind:cpp.ConstCharStar):Bool;
	@:native("flight_is_readable_lottie")
	public static function isReadableLottie(json:cpp.ConstCharStar):Bool;
	@:native("flight_parse_lottie_requirements")
	public static function parseLottieRequirements(json:cpp.ConstCharStar):flight._cpp.RequirementSet;
	@:native("flight_register_lottie_shape_item_handlers")
	public static function registerLottieShapeItemHandlers(registry:flight._cpp.LottieRegistry):Void;
	@:native("flight_apply_animation_clip_to_rive_document")
	public static function applyAnimationClipToRiveDocument(clip:flight._cpp.AnimationClip, time:Float):Void;
	@:native("flight_register_rive_animation_handlers")
	public static function registerRiveAnimationHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_create_rive_image_sprite")
	public static function createRiveImageSprite(name:cpp.ConstCharStar, assetIndex:Int):flight._cpp.FlightNode;
	@:native("flight_get_rive_image_asset_index")
	public static function getRiveImageAssetIndex(node:flight._cpp.FlightNode):Int;
	@:native("flight_get_rive_image_texture")
	public static function getRiveImageTexture(node:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_rive_nested_artboard_index")
	public static function getRiveNestedArtboardIndex(node:flight._cpp.FlightNode):Int;
	@:native("flight_mark_rive_nested_artboard")
	public static function markRiveNestedArtboard(node:flight._cpp.FlightNode, artboardIndex:Int):Void;
	@:native("flight_register_rive_asset_handlers")
	public static function registerRiveAssetHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_clipping_handlers")
	public static function registerRiveClippingHandlers(pathBooleanKernel:flight._cpp.PathBooleanKernel, registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_get_rive_core_property_field_type")
	public static function getRiveCorePropertyFieldType(key:Int):flight._cpp.RiveFieldType;
	@:native("flight_is_rive_core_bytes_property")
	public static function isRiveCoreBytesProperty(key:Int):Bool;
	@:native("flight_is_readable_rive")
	public static function isReadableRive(source:cpp.Star<cpp.Void>, sourceLen:Int):Bool;
	@:native("flight_get_rive_core_type_name")
	public static function getRiveCoreTypeName(typeKey:Int):cpp.ConstCharStar;
	@:native("flight_get_rive_core_type_parent")
	public static function getRiveCoreTypeParent(typeKey:Int):haxe.Int64;
	@:native("flight_is_rive_core_type_derived_from")
	public static function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool;
	@:native("flight_register_rive_draw_order_handlers")
	public static function registerRiveDrawOrderHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_all_rive_handlers")
	public static function registerAllRiveHandlers(pathBooleanKernel:flight._cpp.PathBooleanKernel, registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_create_rive_import_registry")
	public static function createRiveImportRegistry():flight._cpp.RiveImportRegistry;
	@:native("flight_register_rive_layout_handlers")
	public static function registerRiveLayoutHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_create_rive_import_registry_from_options")
	public static function createRiveImportRegistryFromOptions(options:flight._cpp.RiveImportOptions, pathBooleanKernel:flight._cpp.PathBooleanKernel):flight._cpp.RiveImportRegistry;
	@:native("flight_apply_rive_import_options")
	public static function applyRiveImportOptions(options:flight._cpp.RiveImportOptions, pathBooleanKernel:flight._cpp.PathBooleanKernel, registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_shape_handlers")
	public static function registerRiveShapeHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_append_rive_shape_geometry")
	public static function appendRiveShapeGeometry(shape:flight._cpp.FlightNode, paths:cpp.Star<cpp.Void>, pathsLen:Int):Void;
	@:native("flight_register_rive_paint_handlers")
	public static function registerRivePaintHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_path_handlers")
	public static function registerRivePathHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_skeleton_handlers")
	public static function registerRiveSkeletonHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_solo_handlers")
	public static function registerRiveSoloHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_state_machine_handlers")
	public static function registerRiveStateMachineHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_text_handlers")
	public static function registerRiveTextHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_svg_clip_handlers")
	public static function registerSvgClipHandlers(registry:flight._cpp.SvgRegistry):Void;
	@:native("flight_register_svg_element_handlers")
	public static function registerSvgElementHandlers(registry:flight._cpp.SvgRegistry):Void;
	@:native("flight_register_all_svg_handlers")
	public static function registerAllSvgHandlers(registry:flight._cpp.SvgRegistry):Void;
	@:native("flight_create_svg_registry")
	public static function createSvgRegistry():flight._cpp.SvgRegistry;
	@:native("flight_get_svg_clip_handler")
	public static function getSvgClipHandler(registry:flight._cpp.SvgRegistry, kind:cpp.ConstCharStar):flight._cpp.SvgClipHandler;
	@:native("flight_get_svg_element_handler")
	public static function getSvgElementHandler(registry:flight._cpp.SvgRegistry, kind:cpp.ConstCharStar):flight._cpp.SvgElementHandler;
	@:native("flight_register_svg_clip_handler")
	public static function registerSvgClipHandler(registry:flight._cpp.SvgRegistry, kind:cpp.ConstCharStar, handle:flight._cpp.SvgClipHandler):Void;
	@:native("flight_register_svg_element_handler")
	public static function registerSvgElementHandler(registry:flight._cpp.SvgRegistry, kind:cpp.ConstCharStar, handle:flight._cpp.SvgElementHandler):Void;
	@:native("flight_unregister_svg_clip_handler")
	public static function unregisterSvgClipHandler(registry:flight._cpp.SvgRegistry, kind:cpp.ConstCharStar):Bool;
	@:native("flight_unregister_svg_element_handler")
	public static function unregisterSvgElementHandler(registry:flight._cpp.SvgRegistry, kind:cpp.ConstCharStar):Bool;
	@:native("flight_is_readable_svg")
	public static function isReadableSvg(source:cpp.ConstCharStar):Bool;
	@:native("flight_parse_svg_requirements")
	public static function parseSvgRequirements(source:cpp.ConstCharStar):flight._cpp.RequirementSet;
	@:native("flight_free_lottie_registry")
	public static function freeLottieRegistry(ptr:flight._cpp.LottieRegistry):Void;
	@:native("flight_free_lottie_layer_handler")
	public static function freeLottieLayerHandler(ptr:flight._cpp.LottieLayerHandler):Void;
	@:native("flight_free_lottie_mask_handler")
	public static function freeLottieMaskHandler(ptr:flight._cpp.LottieMaskHandler):Void;
	@:native("flight_free_lottie_shape_item_handler")
	public static function freeLottieShapeItemHandler(ptr:flight._cpp.LottieShapeItemHandler):Void;
	@:native("flight_free_path_ref")
	public static function freePathRef(ptr:flight._cpp.Path):Void;
	@:native("flight_free_rive_field_type")
	public static function freeRiveFieldType(ptr:flight._cpp.RiveFieldType):Void;
	@:native("flight_free_rive_import_registry")
	public static function freeRiveImportRegistry(ptr:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_free_svg_registry")
	public static function freeSvgRegistry(ptr:flight._cpp.SvgRegistry):Void;
	@:native("flight_free_svg_clip_handler")
	public static function freeSvgClipHandler(ptr:flight._cpp.SvgClipHandler):Void;
	@:native("flight_free_svg_element_handler")
	public static function freeSvgElementHandler(ptr:flight._cpp.SvgElementHandler):Void;
}
