package flight._js._fn;

@:jsRequire("flight")
extern class Scene2dFormats {
	@:native("flight_create_lottie_bezier_path")
	public static function createLottieBezierPath(value:flight._js.LottieShapePath):flight._js.Path;
	@:native("flight_flatten_lottie_shape_path")
	public static function flattenLottieShapePath(out:Dynamic, path:flight._js.LottieShapePath):Void;
	@:native("flight_unflatten_lottie_shape_path")
	public static function unflattenLottieShapePath(template:flight._js.LottieShapePath, values:Dynamic, valuesLen:Int):flight._js.LottieShapePath;
	@:native("flight_get_lottie_feature_names")
	public static function getLottieFeatureNames(out:Dynamic):Void;
	@:native("flight_apply_animation_clip_to_lottie_document")
	public static function applyAnimationClipToLottieDocument(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("flight_lottie_clamp")
	public static function lottieClamp(value:Float, minimum:Float, maximum:Float):Float;
	@:native("flight_lottie_degrees_to_radians")
	public static function lottieDegreesToRadians(value:Float):Float;
	@:native("flight_lottie_numeric_value")
	public static function lottieNumericValue(out:Dynamic, value:flight._js.Unknown, components:Int):Void;
	@:native("flight_lottie_rgba")
	public static function lottieRgba(color:Dynamic, colorLen:Int):Int;
	@:native("flight_create_lottie_gradient_matrix")
	public static function createLottieGradientMatrix(start:Dynamic, startLen:Int, end:Dynamic, endLen:Int):flight._js.Matrix;
	@:native("flight_interpolate_lottie_gradient_opacity")
	public static function interpolateLottieGradientOpacity(stops:Dynamic, stopsLen:Int, offset:Float):Float;
	@:native("flight_parse_lottie_gradient")
	public static function parseLottieGradient(values:Dynamic, valuesLen:Int, count:Int, opacity:Float):flight._js.LottieGradientPaint;
	@:native("flight_register_all_lottie_handlers")
	public static function registerAllLottieHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("flight_register_lottie_layer_handlers")
	public static function registerLottieLayerHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("flight_register_lottie_mask_handlers")
	public static function registerLottieMaskHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("flight_create_lottie_registry")
	public static function createLottieRegistry():flight._js.LottieRegistry;
	@:native("flight_get_lottie_layer_handler")
	public static function getLottieLayerHandler(registry:flight._js.LottieRegistry, kind:flight._js.LottieLayerKind):Dynamic;
	@:native("flight_get_lottie_mask_handler")
	public static function getLottieMaskHandler(registry:flight._js.LottieRegistry, kind:String):Dynamic;
	@:native("flight_get_lottie_shape_item_handler")
	public static function getLottieShapeItemHandler(registry:flight._js.LottieRegistry, kind:String):Dynamic;
	@:native("flight_register_lottie_layer_handler")
	public static function registerLottieLayerHandler(registry:flight._js.LottieRegistry, kind:flight._js.LottieLayerKind, handle:flight._js.LottieLayerHandler):Void;
	@:native("flight_register_lottie_mask_handler")
	public static function registerLottieMaskHandler(registry:flight._js.LottieRegistry, kind:String, handle:flight._js.LottieMaskHandler):Void;
	@:native("flight_register_lottie_shape_item_handler")
	public static function registerLottieShapeItemHandler(registry:flight._js.LottieRegistry, kind:String, handle:flight._js.LottieShapeItemHandler):Void;
	@:native("flight_unregister_lottie_layer_handler")
	public static function unregisterLottieLayerHandler(registry:flight._js.LottieRegistry, kind:flight._js.LottieLayerKind):Bool;
	@:native("flight_unregister_lottie_mask_handler")
	public static function unregisterLottieMaskHandler(registry:flight._js.LottieRegistry, kind:String):Bool;
	@:native("flight_unregister_lottie_shape_item_handler")
	public static function unregisterLottieShapeItemHandler(registry:flight._js.LottieRegistry, kind:String):Bool;
	@:native("flight_is_readable_lottie")
	public static function isReadableLottie(json:String):Bool;
	@:native("flight_parse_lottie_requirements")
	public static function parseLottieRequirements(json:String):flight._js.RequirementSet;
	@:native("flight_apply_lottie_shape_direction")
	public static function applyLottieShapeDirection(path:Dynamic, direction:Int):Dynamic;
	@:native("flight_register_lottie_shape_item_handlers")
	public static function registerLottieShapeItemHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("flight_map_lottie_line_cap")
	public static function mapLottieLineCap(value:Int):Int;
	@:native("flight_map_lottie_line_join")
	public static function mapLottieLineJoin(value:Int):Int;
	@:native("flight_apply_animation_clip_to_rive_document")
	public static function applyAnimationClipToRiveDocument(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("flight_register_rive_animation_handlers")
	public static function registerRiveAnimationHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_create_rive_image_sprite")
	public static function createRiveImageSprite(name:String, assetIndex:Int):Dynamic;
	@:native("flight_get_rive_image_asset_index")
	public static function getRiveImageAssetIndex(node:Dynamic):Int;
	@:native("flight_get_rive_image_texture")
	public static function getRiveImageTexture(node:Dynamic):Dynamic;
	@:native("flight_get_rive_nested_artboard_index")
	public static function getRiveNestedArtboardIndex(node:Dynamic):Int;
	@:native("flight_mark_rive_nested_artboard")
	public static function markRiveNestedArtboard(node:Dynamic, artboardIndex:Int):Void;
	@:native("flight_register_rive_asset_handlers")
	public static function registerRiveAssetHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_register_rive_clipping_handlers")
	public static function registerRiveClippingHandlers(pathBooleanKernel:flight._js.PathBooleanKernel, registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_get_rive_core_property_field_type")
	public static function getRiveCorePropertyFieldType(key:Int):Dynamic;
	@:native("flight_is_rive_core_bytes_property")
	public static function isRiveCoreBytesProperty(key:Int):Bool;
	@:native("flight_is_readable_rive")
	public static function isReadableRive(source:Dynamic, sourceLen:Int):Bool;
	@:native("flight_get_rive_core_type_name")
	public static function getRiveCoreTypeName(typeKey:Int):String;
	@:native("flight_get_rive_core_type_parent")
	public static function getRiveCoreTypeParent(typeKey:Int):Int;
	@:native("flight_is_rive_core_type_derived_from")
	public static function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool;
	@:native("flight_register_rive_draw_order_handlers")
	public static function registerRiveDrawOrderHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_register_all_rive_handlers")
	public static function registerAllRiveHandlers(pathBooleanKernel:flight._js.PathBooleanKernel, registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_create_rive_import_registry")
	public static function createRiveImportRegistry():flight._js.RiveImportRegistry;
	@:native("flight_import_rive_core_object_as_data")
	public static function importRiveCoreObjectAsData():Dynamic;
	@:native("flight_register_rive_layout_handlers")
	public static function registerRiveLayoutHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_create_rive_import_registry_from_options")
	public static function createRiveImportRegistryFromOptions(options:flight._js.RiveImportOptions, pathBooleanKernel:flight._js.PathBooleanKernel):flight._js.RiveImportRegistry;
	@:native("flight_apply_rive_import_options")
	public static function applyRiveImportOptions(options:flight._js.RiveImportOptions, pathBooleanKernel:flight._js.PathBooleanKernel, registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_register_rive_shape_handlers")
	public static function registerRiveShapeHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_append_rive_shape_geometry")
	public static function appendRiveShapeGeometry(shape:Dynamic, paths:Dynamic, pathsLen:Int):Void;
	@:native("flight_register_rive_paint_handlers")
	public static function registerRivePaintHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_register_rive_path_handlers")
	public static function registerRivePathHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_create_rive_skeleton_2d")
	public static function createRiveSkeleton2d(artboard:flight._js.RiveArtboardGraph):Dynamic;
	@:native("flight_register_rive_skeleton_handlers")
	public static function registerRiveSkeletonHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_register_rive_solo_handlers")
	public static function registerRiveSoloHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_register_rive_state_machine_handlers")
	public static function registerRiveStateMachineHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_register_rive_text_handlers")
	public static function registerRiveTextHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("flight_has_unmeasurable_svg_text")
	public static function hasUnmeasurableSvgText(target:Dynamic):Bool;
	@:native("flight_uses_svg_object_bounding_box_units")
	public static function usesSvgObjectBoundingBoxUnits(element:Dynamic):Bool;
	@:native("flight_register_svg_clip_handlers")
	public static function registerSvgClipHandlers(registry:flight._js.SvgRegistry):Void;
	@:native("flight_parse_svg_color")
	public static function parseSvgColor(value:String):Dynamic;
	@:native("flight_resolve_svg_color")
	public static function resolveSvgColor(value:String, currentColor:String):Dynamic;
	@:native("flight_register_svg_element_handlers")
	public static function registerSvgElementHandlers(registry:flight._js.SvgRegistry):Void;
	@:native("flight_create_svg_geometry_path")
	public static function createSvgGeometryPath(element:flight._js.XmlElement, winding:Int):Dynamic;
	@:native("flight_create_svg_gradient_matrix")
	public static function createSvgGradientMatrix(gradient:flight._js.SvgGradient, path:flight._js.Path):flight._js.Matrix;
	@:native("flight_has_zero_area_svg_gradient_box")
	public static function hasZeroAreaSvgGradientBox(gradient:flight._js.SvgGradient, path:flight._js.Path):Bool;
	@:native("flight_register_all_svg_handlers")
	public static function registerAllSvgHandlers(registry:flight._js.SvgRegistry):Void;
	@:native("flight_create_svg_registry")
	public static function createSvgRegistry():flight._js.SvgRegistry;
	@:native("flight_get_svg_clip_handler")
	public static function getSvgClipHandler(registry:flight._js.SvgRegistry, kind:String):Dynamic;
	@:native("flight_get_svg_element_handler")
	public static function getSvgElementHandler(registry:flight._js.SvgRegistry, kind:String):Dynamic;
	@:native("flight_register_svg_clip_handler")
	public static function registerSvgClipHandler(registry:flight._js.SvgRegistry, kind:String, handle:flight._js.SvgClipHandler):Void;
	@:native("flight_register_svg_element_handler")
	public static function registerSvgElementHandler(registry:flight._js.SvgRegistry, kind:String, handle:flight._js.SvgElementHandler):Void;
	@:native("flight_unregister_svg_clip_handler")
	public static function unregisterSvgClipHandler(registry:flight._js.SvgRegistry, kind:String):Bool;
	@:native("flight_unregister_svg_element_handler")
	public static function unregisterSvgElementHandler(registry:flight._js.SvgRegistry, kind:String):Bool;
	@:native("flight_is_readable_svg")
	public static function isReadableSvg(source:String):Bool;
	@:native("flight_parse_svg_requirements")
	public static function parseSvgRequirements(source:String):flight._js.RequirementSet;
	@:native("flight_collect_css_rules")
	public static function collectCssRules(out:Dynamic, root:flight._js.XmlElement):Void;
	@:native("flight_resolve_svg_winding")
	public static function resolveSvgWinding(value:String, fallback:Int):Int;
	@:native("flight_create_svg_view_box_matrix")
	public static function createSvgViewBoxMatrix(viewBox:Dynamic, viewBoxLen:Int, viewport:flight._js.SvgViewport, preserveAspectRatioValue:String):flight._js.Matrix;
	@:native("flight_create_svg_viewport_matrix")
	public static function createSvgViewportMatrix(element:flight._js.XmlElement, viewport:flight._js.SvgViewportOptions):Dynamic;
	@:native("flight_apply_svg_transform")
	public static function applySvgTransform(target:Dynamic, matrix:flight._js.Matrix):Void;
	@:native("flight_assign_svg_transform")
	public static function assignSvgTransform(target:Dynamic, transform:flight._js.Transform2D):Void;
	@:native("flight_multiply_svg_matrices")
	public static function multiplySvgMatrices(out:flight._js.Matrix, a:flight._js.Matrix, b:flight._js.Matrix):Void;
	@:native("flight_parse_svg_transform")
	public static function parseSvgTransform(value:String):Dynamic;
	@:native("flight_parse_svg_coordinate")
	public static function parseSvgCoordinate(value:String, fallback:Float):Float;
	@:native("flight_parse_svg_css_number")
	public static function parseSvgCssNumber(value:String, fallback:Float):Float;
	@:native("flight_parse_svg_length")
	public static function parseSvgLength(value:String, fallback:Float):Float;
	@:native("flight_parse_svg_number_list")
	public static function parseSvgNumberList(value:String):Dynamic;
	@:native("flight_parse_url_reference")
	public static function parseUrlReference(value:String):String;
	@:native("flight_svg_first_number")
	public static function svgFirstNumber(value:String, fallback:Float):Float;
	@:native("flight_svg_local_name")
	public static function svgLocalName(name:String):String;
	@:native("flight_svg_number_attribute")
	public static function svgNumberAttribute(element:flight._js.XmlElement, name:String, fallback:Float):Float;
	@:native("flight_svg_optional_number_attribute")
	public static function svgOptionalNumberAttribute(element:flight._js.XmlElement, name:String):Float;
	@:native("flight_visit_svg_elements")
	public static function visitSvgElements(element:flight._js.XmlElement, visitorFn:Dynamic, visitorCtx:Dynamic):Void;
	@:native("flight_free_lottie_shape_path")
	public static function freeLottieShapePath(ptr:flight._js.LottieShapePath):Void;
	@:native("flight_free_lottie_gradient_paint")
	public static function freeLottieGradientPaint(ptr:flight._js.LottieGradientPaint):Void;
	@:native("flight_free_lottie_registry")
	public static function freeLottieRegistry(ptr:flight._js.LottieRegistry):Void;
	@:native("flight_free_lottie_layer_handler")
	public static function freeLottieLayerHandler(ptr:flight._js.LottieLayerHandler):Void;
	@:native("flight_free_lottie_mask_handler")
	public static function freeLottieMaskHandler(ptr:flight._js.LottieMaskHandler):Void;
	@:native("flight_free_lottie_shape_item_handler")
	public static function freeLottieShapeItemHandler(ptr:flight._js.LottieShapeItemHandler):Void;
	@:native("flight_free_requirement_set")
	public static function freeRequirementSet(ptr:flight._js.RequirementSet):Void;
	@:native("flight_free_rive_field_type")
	public static function freeRiveFieldType(ptr:flight._js.RiveFieldType):Void;
	@:native("flight_free_rive_import_registry")
	public static function freeRiveImportRegistry(ptr:flight._js.RiveImportRegistry):Void;
	@:native("flight_free_rive_skeleton2_dimport")
	public static function freeRiveSkeleton2Dimport(ptr:flight._js.RiveSkeleton2DImport):Void;
	@:native("flight_free_svg_color")
	public static function freeSvgColor(ptr:flight._js.SvgColor):Void;
	@:native("flight_free_svg_registry")
	public static function freeSvgRegistry(ptr:flight._js.SvgRegistry):Void;
	@:native("flight_free_svg_clip_handler")
	public static function freeSvgClipHandler(ptr:flight._js.SvgClipHandler):Void;
	@:native("flight_free_svg_element_handler")
	public static function freeSvgElementHandler(ptr:flight._js.SvgElementHandler):Void;
}
