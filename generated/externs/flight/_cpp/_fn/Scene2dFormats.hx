package flight._cpp._fn;

extern class Scene2dFormats {
	@:native("flight_create_lottie_bezier_path")
	public static function createLottieBezierPath(value:flight._cpp.LottieShapePath):flight._cpp.Path;
	@:native("flight_flatten_lottie_shape_path")
	public static function flattenLottieShapePath(out:cpp.Star<cpp.Void>, path:flight._cpp.LottieShapePath):Void;
	@:native("flight_unflatten_lottie_shape_path")
	public static function unflattenLottieShapePath(template:flight._cpp.LottieShapePath, values:cpp.Star<cpp.Void>, valuesLen:Int):flight._cpp.LottieShapePath;
	@:native("flight_get_lottie_feature_names")
	public static function getLottieFeatureNames(out:cpp.Star<cpp.Void>):Void;
	@:native("flight_apply_animation_clip_to_lottie_document")
	public static function applyAnimationClipToLottieDocument(clip:flight._cpp.AnimationClip, time:Single):Void;
	@:native("flight_lottie_clamp")
	public static function lottieClamp(value:Single, minimum:Single, maximum:Single):Single;
	@:native("flight_lottie_degrees_to_radians")
	public static function lottieDegreesToRadians(value:Single):Single;
	@:native("flight_lottie_numeric_value")
	public static function lottieNumericValue(out:cpp.Star<cpp.Void>, value:flight._cpp.Unknown, components:Int):Void;
	@:native("flight_lottie_rgba")
	public static function lottieRgba(color:cpp.Star<cpp.Void>, colorLen:Int):Int;
	@:native("flight_create_lottie_gradient_matrix")
	public static function createLottieGradientMatrix(start:cpp.Star<cpp.Void>, startLen:Int, end:cpp.Star<cpp.Void>, endLen:Int):flight._cpp.Matrix;
	@:native("flight_interpolate_lottie_gradient_opacity")
	public static function interpolateLottieGradientOpacity(stops:cpp.Star<cpp.Void>, stopsLen:Int, offset:Single):Single;
	@:native("flight_parse_lottie_gradient")
	public static function parseLottieGradient(values:cpp.Star<cpp.Void>, valuesLen:Int, count:Int, opacity:Single):flight._cpp.LottieGradientPaint;
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
	@:native("flight_apply_lottie_shape_direction")
	public static function applyLottieShapeDirection(path:cpp.Star<cpp.Void>, direction:Int):cpp.Star<cpp.Void>;
	@:native("flight_register_lottie_shape_item_handlers")
	public static function registerLottieShapeItemHandlers(registry:flight._cpp.LottieRegistry):Void;
	@:native("flight_map_lottie_line_cap")
	public static function mapLottieLineCap(value:Int):Int;
	@:native("flight_map_lottie_line_join")
	public static function mapLottieLineJoin(value:Int):Int;
	@:native("flight_apply_animation_clip_to_rive_document")
	public static function applyAnimationClipToRiveDocument(clip:flight._cpp.AnimationClip, time:Single):Void;
	@:native("flight_register_rive_animation_handlers")
	public static function registerRiveAnimationHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_create_rive_image_sprite")
	public static function createRiveImageSprite(name:cpp.ConstCharStar, assetIndex:Int):cpp.Star<cpp.Void>;
	@:native("flight_get_rive_image_asset_index")
	public static function getRiveImageAssetIndex(node:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_rive_image_texture")
	public static function getRiveImageTexture(node:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_rive_nested_artboard_index")
	public static function getRiveNestedArtboardIndex(node:cpp.Star<cpp.Void>):Int;
	@:native("flight_mark_rive_nested_artboard")
	public static function markRiveNestedArtboard(node:cpp.Star<cpp.Void>, artboardIndex:Int):Void;
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
	public static function getRiveCoreTypeParent(typeKey:Int):Int;
	@:native("flight_is_rive_core_type_derived_from")
	public static function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool;
	@:native("flight_register_rive_draw_order_handlers")
	public static function registerRiveDrawOrderHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_all_rive_handlers")
	public static function registerAllRiveHandlers(pathBooleanKernel:flight._cpp.PathBooleanKernel, registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_create_rive_import_registry")
	public static function createRiveImportRegistry():flight._cpp.RiveImportRegistry;
	@:native("flight_import_rive_core_object_as_data")
	public static function importRiveCoreObjectAsData():cpp.Star<cpp.Void>;
	@:native("flight_register_rive_layout_handlers")
	public static function registerRiveLayoutHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_create_rive_import_registry_from_options")
	public static function createRiveImportRegistryFromOptions(options:flight._cpp.RiveImportOptions, pathBooleanKernel:flight._cpp.PathBooleanKernel):flight._cpp.RiveImportRegistry;
	@:native("flight_apply_rive_import_options")
	public static function applyRiveImportOptions(options:flight._cpp.RiveImportOptions, pathBooleanKernel:flight._cpp.PathBooleanKernel, registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_shape_handlers")
	public static function registerRiveShapeHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_append_rive_shape_geometry")
	public static function appendRiveShapeGeometry(shape:cpp.Star<cpp.Void>, paths:cpp.Star<cpp.Void>, pathsLen:Int):Void;
	@:native("flight_register_rive_paint_handlers")
	public static function registerRivePaintHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_path_handlers")
	public static function registerRivePathHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_create_rive_skeleton_2d")
	public static function createRiveSkeleton2d(artboard:flight._cpp.RiveArtboardGraph):flight._cpp.RiveSkeleton2DImport;
	@:native("flight_register_rive_skeleton_handlers")
	public static function registerRiveSkeletonHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_solo_handlers")
	public static function registerRiveSoloHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_state_machine_handlers")
	public static function registerRiveStateMachineHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_register_rive_text_handlers")
	public static function registerRiveTextHandlers(registry:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_has_unmeasurable_svg_text")
	public static function hasUnmeasurableSvgText(target:cpp.Star<cpp.Void>):Bool;
	@:native("flight_uses_svg_object_bounding_box_units")
	public static function usesSvgObjectBoundingBoxUnits(element:cpp.Star<cpp.Void>):Bool;
	@:native("flight_register_svg_clip_handlers")
	public static function registerSvgClipHandlers(registry:flight._cpp.SvgRegistry):Void;
	@:native("flight_parse_svg_color")
	public static function parseSvgColor(value:cpp.ConstCharStar):flight._cpp.SvgColor;
	@:native("flight_resolve_svg_color")
	public static function resolveSvgColor(value:cpp.ConstCharStar, currentColor:cpp.ConstCharStar):flight._cpp.SvgColor;
	@:native("flight_register_svg_element_handlers")
	public static function registerSvgElementHandlers(registry:flight._cpp.SvgRegistry):Void;
	@:native("flight_create_svg_geometry_path")
	public static function createSvgGeometryPath(element:flight._cpp.XmlElement, winding:Int):flight._cpp.Path;
	@:native("flight_create_svg_gradient_matrix")
	public static function createSvgGradientMatrix(gradient:flight._cpp.SvgGradient, path:flight._cpp.Path):flight._cpp.Matrix;
	@:native("flight_has_zero_area_svg_gradient_box")
	public static function hasZeroAreaSvgGradientBox(gradient:flight._cpp.SvgGradient, path:flight._cpp.Path):Bool;
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
	@:native("flight_collect_css_rules")
	public static function collectCssRules(out:cpp.Star<cpp.Void>, root:flight._cpp.XmlElement):Void;
	@:native("flight_resolve_svg_winding")
	public static function resolveSvgWinding(value:cpp.ConstCharStar, fallback:Int):Int;
	@:native("flight_create_svg_view_box_matrix")
	public static function createSvgViewBoxMatrix(viewBox:cpp.Star<cpp.Void>, viewBoxLen:Int, viewport:flight._cpp.SvgViewport, preserveAspectRatioValue:cpp.ConstCharStar):flight._cpp.Matrix;
	@:native("flight_create_svg_viewport_matrix")
	public static function createSvgViewportMatrix(element:flight._cpp.XmlElement, viewport:flight._cpp.SvgViewportOptions):flight._cpp.Matrix;
	@:native("flight_apply_svg_transform")
	public static function applySvgTransform(target:cpp.Star<cpp.Void>, matrix:flight._cpp.Matrix):Void;
	@:native("flight_assign_svg_transform")
	public static function assignSvgTransform(target:cpp.Star<cpp.Void>, transform:flight._cpp.Transform2D):Void;
	@:native("flight_multiply_svg_matrices")
	public static function multiplySvgMatrices(out:flight._cpp.Matrix, a:flight._cpp.Matrix, b:flight._cpp.Matrix):Void;
	@:native("flight_parse_svg_transform")
	public static function parseSvgTransform(value:cpp.ConstCharStar):flight._cpp.Matrix;
	@:native("flight_parse_svg_coordinate")
	public static function parseSvgCoordinate(value:cpp.ConstCharStar, fallback:Single):Single;
	@:native("flight_parse_svg_css_number")
	public static function parseSvgCssNumber(value:cpp.ConstCharStar, fallback:Single):Single;
	@:native("flight_parse_svg_length")
	public static function parseSvgLength(value:cpp.ConstCharStar, fallback:Single):Single;
	@:native("flight_parse_svg_number_list")
	public static function parseSvgNumberList(value:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_parse_url_reference")
	public static function parseUrlReference(value:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_svg_first_number")
	public static function svgFirstNumber(value:cpp.ConstCharStar, fallback:Single):Single;
	@:native("flight_svg_local_name")
	public static function svgLocalName(name:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_svg_number_attribute")
	public static function svgNumberAttribute(element:flight._cpp.XmlElement, name:cpp.ConstCharStar, fallback:Single):Single;
	@:native("flight_svg_optional_number_attribute")
	public static function svgOptionalNumberAttribute(element:flight._cpp.XmlElement, name:cpp.ConstCharStar):Single;
	@:native("flight_visit_svg_elements")
	public static function visitSvgElements(element:flight._cpp.XmlElement, visitorFn:cpp.Star<cpp.Void>, visitorCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_free_lottie_shape_path")
	public static function freeLottieShapePath(ptr:flight._cpp.LottieShapePath):Void;
	@:native("flight_free_lottie_gradient_paint")
	public static function freeLottieGradientPaint(ptr:flight._cpp.LottieGradientPaint):Void;
	@:native("flight_free_lottie_registry")
	public static function freeLottieRegistry(ptr:flight._cpp.LottieRegistry):Void;
	@:native("flight_free_lottie_layer_handler")
	public static function freeLottieLayerHandler(ptr:flight._cpp.LottieLayerHandler):Void;
	@:native("flight_free_lottie_mask_handler")
	public static function freeLottieMaskHandler(ptr:flight._cpp.LottieMaskHandler):Void;
	@:native("flight_free_lottie_shape_item_handler")
	public static function freeLottieShapeItemHandler(ptr:flight._cpp.LottieShapeItemHandler):Void;
	@:native("flight_free_requirement_set")
	public static function freeRequirementSet(ptr:flight._cpp.RequirementSet):Void;
	@:native("flight_free_rive_field_type")
	public static function freeRiveFieldType(ptr:flight._cpp.RiveFieldType):Void;
	@:native("flight_free_rive_import_registry")
	public static function freeRiveImportRegistry(ptr:flight._cpp.RiveImportRegistry):Void;
	@:native("flight_free_rive_skeleton2_dimport")
	public static function freeRiveSkeleton2Dimport(ptr:flight._cpp.RiveSkeleton2DImport):Void;
	@:native("flight_free_svg_color")
	public static function freeSvgColor(ptr:flight._cpp.SvgColor):Void;
	@:native("flight_free_svg_registry")
	public static function freeSvgRegistry(ptr:flight._cpp.SvgRegistry):Void;
	@:native("flight_free_svg_clip_handler")
	public static function freeSvgClipHandler(ptr:flight._cpp.SvgClipHandler):Void;
	@:native("flight_free_svg_element_handler")
	public static function freeSvgElementHandler(ptr:flight._cpp.SvgElementHandler):Void;
}
