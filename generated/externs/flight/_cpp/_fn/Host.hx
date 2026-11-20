package flight._cpp._fn;

extern class Host {
	@:native("flight_get_backend_explanation_layer_string")
	public static function getBackendExplanationLayerString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_backend_explanation_viability_string")
	public static function getBackendExplanationViabilityString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_backend_explanation_layer")
	public static function parseBackendExplanationLayer(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_backend_explanation_viability")
	public static function parseBackendExplanationViability(value:cpp.ConstCharStar):Int;
	@:native("flight_get_backend_operation_explanation_layer_string")
	public static function getBackendOperationExplanationLayerString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_backend_operation_explanation_layer")
	public static function parseBackendOperationExplanationLayer(value:cpp.ConstCharStar):Int;
	@:native("flight_free_backend_operation_explanation")
	public static function freeBackendOperationExplanation(ptr:flight._cpp.BackendOperationExplanation):Void;
}
