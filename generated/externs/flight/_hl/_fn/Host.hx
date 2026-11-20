package flight._hl._fn;

extern class Host {
	@:hlNative("flight", "flight_get_backend_explanation_layer_string")
	public static function getBackendExplanationLayerString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_backend_explanation_viability_string")
	public static function getBackendExplanationViabilityString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_backend_explanation_layer")
	public static function parseBackendExplanationLayer(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_backend_explanation_viability")
	public static function parseBackendExplanationViability(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_backend_operation_explanation_layer_string")
	public static function getBackendOperationExplanationLayerString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_backend_operation_explanation_layer")
	public static function parseBackendOperationExplanationLayer(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_free_backend_operation_explanation")
	public static function freeBackendOperationExplanation(ptr:flight._hl.BackendOperationExplanation):Void;
}
