package flight._hl._fn;

extern class Scene2dFormats {
	@:hlNative("flight", "flight_create_lottie_bezier_path")
	public static function createLottieBezierPath(value:flight._hl.LottieShapePath):flight._hl.Path;
	@:hlNative("flight", "flight_flatten_lottie_shape_path")
	public static function flattenLottieShapePath(out:hl.Bytes, path:flight._hl.LottieShapePath):Void;
	@:hlNative("flight", "flight_unflatten_lottie_shape_path")
	public static function unflattenLottieShapePath(template:flight._hl.LottieShapePath, values:hl.Bytes, valuesLen:Int):flight._hl.LottieShapePath;
	@:hlNative("flight", "flight_get_lottie_feature_names")
	public static function getLottieFeatureNames(out:hl.Bytes):Void;
	@:hlNative("flight", "flight_apply_animation_clip_to_lottie_document")
	public static function applyAnimationClipToLottieDocument(clip:flight._hl.AnimationClip, time:Single):Void;
	@:hlNative("flight", "flight_lottie_clamp")
	public static function lottieClamp(value:Single, minimum:Single, maximum:Single):Single;
	@:hlNative("flight", "flight_lottie_degrees_to_radians")
	public static function lottieDegreesToRadians(value:Single):Single;
	@:hlNative("flight", "flight_lottie_numeric_value")
	public static function lottieNumericValue(out:hl.Bytes, value:flight._hl.Unknown, components:Int):Void;
	@:hlNative("flight", "flight_lottie_rgba")
	public static function lottieRgba(color:hl.Bytes, colorLen:Int):Int;
	@:hlNative("flight", "flight_create_lottie_gradient_matrix")
	public static function createLottieGradientMatrix(start:hl.Bytes, startLen:Int, end:hl.Bytes, endLen:Int):flight._hl.Matrix;
	@:hlNative("flight", "flight_interpolate_lottie_gradient_opacity")
	public static function interpolateLottieGradientOpacity(stops:hl.Bytes, stopsLen:Int, offset:Single):Single;
	@:hlNative("flight", "flight_parse_lottie_gradient")
	public static function parseLottieGradient(values:hl.Bytes, valuesLen:Int, count:Int, opacity:Single):flight._hl.LottieGradientPaint;
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
	@:hlNative("flight", "flight_apply_lottie_shape_direction")
	public static function applyLottieShapeDirection(path:hl.Bytes, direction:Int):hl.Bytes;
	@:hlNative("flight", "flight_register_lottie_shape_item_handlers")
	public static function registerLottieShapeItemHandlers(registry:flight._hl.LottieRegistry):Void;
	@:hlNative("flight", "flight_map_lottie_line_cap")
	public static function mapLottieLineCap(value:Int):Int;
	@:hlNative("flight", "flight_map_lottie_line_join")
	public static function mapLottieLineJoin(value:Int):Int;
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
	@:hlNative("flight", "flight_import_rive_core_object_as_data")
	public static function importRiveCoreObjectAsData():hl.Bytes;
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
	@:hlNative("flight", "flight_create_rive_skeleton_2d")
	public static function createRiveSkeleton2d(artboard:flight._hl.RiveArtboardGraph):flight._hl.RiveSkeleton2DImport;
	@:hlNative("flight", "flight_register_rive_skeleton_handlers")
	public static function registerRiveSkeletonHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_solo_handlers")
	public static function registerRiveSoloHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_state_machine_handlers")
	public static function registerRiveStateMachineHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_register_rive_text_handlers")
	public static function registerRiveTextHandlers(registry:flight._hl.RiveImportRegistry):Void;
	@:hlNative("flight", "flight_has_unmeasurable_svg_text")
	public static function hasUnmeasurableSvgText(target:hl.Bytes):Bool;
	@:hlNative("flight", "flight_uses_svg_object_bounding_box_units")
	public static function usesSvgObjectBoundingBoxUnits(element:hl.Bytes):Bool;
	@:hlNative("flight", "flight_register_svg_clip_handlers")
	public static function registerSvgClipHandlers(registry:flight._hl.SvgRegistry):Void;
	@:hlNative("flight", "flight_parse_svg_color")
	public static function parseSvgColor(value:hl.Bytes):flight._hl.SvgColor;
	@:hlNative("flight", "flight_resolve_svg_color")
	public static function resolveSvgColor(value:hl.Bytes, currentColor:hl.Bytes):flight._hl.SvgColor;
	@:hlNative("flight", "flight_register_svg_element_handlers")
	public static function registerSvgElementHandlers(registry:flight._hl.SvgRegistry):Void;
	@:hlNative("flight", "flight_create_svg_geometry_path")
	public static function createSvgGeometryPath(element:flight._hl.XmlElement, winding:Int):flight._hl.Path;
	@:hlNative("flight", "flight_create_svg_gradient_matrix")
	public static function createSvgGradientMatrix(gradient:flight._hl.SvgGradient, path:flight._hl.Path):flight._hl.Matrix;
	@:hlNative("flight", "flight_has_zero_area_svg_gradient_box")
	public static function hasZeroAreaSvgGradientBox(gradient:flight._hl.SvgGradient, path:flight._hl.Path):Bool;
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
	@:hlNative("flight", "flight_collect_css_rules")
	public static function collectCssRules(out:hl.Bytes, root:flight._hl.XmlElement):Void;
	@:hlNative("flight", "flight_resolve_svg_winding")
	public static function resolveSvgWinding(value:hl.Bytes, fallback:Int):Int;
	@:hlNative("flight", "flight_create_svg_view_box_matrix")
	public static function createSvgViewBoxMatrix(viewBox:hl.Bytes, viewBoxLen:Int, viewport:flight._hl.SvgViewport, preserveAspectRatioValue:hl.Bytes):flight._hl.Matrix;
	@:hlNative("flight", "flight_create_svg_viewport_matrix")
	public static function createSvgViewportMatrix(element:flight._hl.XmlElement, viewport:flight._hl.SvgViewportOptions):flight._hl.Matrix;
	@:hlNative("flight", "flight_apply_svg_transform")
	public static function applySvgTransform(target:hl.Bytes, matrix:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_assign_svg_transform")
	public static function assignSvgTransform(target:hl.Bytes, transform:flight._hl.Transform2D):Void;
	@:hlNative("flight", "flight_multiply_svg_matrices")
	public static function multiplySvgMatrices(out:flight._hl.Matrix, a:flight._hl.Matrix, b:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_parse_svg_transform")
	public static function parseSvgTransform(value:hl.Bytes):flight._hl.Matrix;
	@:hlNative("flight", "flight_parse_svg_coordinate")
	public static function parseSvgCoordinate(value:hl.Bytes, fallback:Single):Single;
	@:hlNative("flight", "flight_parse_svg_css_number")
	public static function parseSvgCssNumber(value:hl.Bytes, fallback:Single):Single;
	@:hlNative("flight", "flight_parse_svg_length")
	public static function parseSvgLength(value:hl.Bytes, fallback:Single):Single;
	@:hlNative("flight", "flight_parse_svg_number_list")
	public static function parseSvgNumberList(value:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_parse_url_reference")
	public static function parseUrlReference(value:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_svg_first_number")
	public static function svgFirstNumber(value:hl.Bytes, fallback:Single):Single;
	@:hlNative("flight", "flight_svg_local_name")
	public static function svgLocalName(name:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_svg_number_attribute")
	public static function svgNumberAttribute(element:flight._hl.XmlElement, name:hl.Bytes, fallback:Single):Single;
	@:hlNative("flight", "flight_svg_optional_number_attribute")
	public static function svgOptionalNumberAttribute(element:flight._hl.XmlElement, name:hl.Bytes):Single;
	@:hlNative("flight", "flight_visit_svg_elements")
	public static function visitSvgElements(element:flight._hl.XmlElement, visitorFn:hl.Bytes, visitorCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_lottie_shape_path")
	public static function freeLottieShapePath(ptr:flight._hl.LottieShapePath):Void;
	@:hlNative("flight", "flight_free_lottie_gradient_paint")
	public static function freeLottieGradientPaint(ptr:flight._hl.LottieGradientPaint):Void;
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
	@:hlNative("flight", "flight_free_rive_skeleton2_dimport")
	public static function freeRiveSkeleton2Dimport(ptr:flight._hl.RiveSkeleton2DImport):Void;
	@:hlNative("flight", "flight_free_svg_color")
	public static function freeSvgColor(ptr:flight._hl.SvgColor):Void;
	@:hlNative("flight", "flight_free_svg_registry")
	public static function freeSvgRegistry(ptr:flight._hl.SvgRegistry):Void;
	@:hlNative("flight", "flight_free_svg_clip_handler")
	public static function freeSvgClipHandler(ptr:flight._hl.SvgClipHandler):Void;
	@:hlNative("flight", "flight_free_svg_element_handler")
	public static function freeSvgElementHandler(ptr:flight._hl.SvgElementHandler):Void;
}
