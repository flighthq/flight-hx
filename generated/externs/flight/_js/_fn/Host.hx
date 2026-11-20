package flight._js._fn;

@:jsRequire("@flighthq/host")
extern class Host {
	@:native("getBackendExplanationLayerString")
	public static function getBackendExplanationLayerString(value:Dynamic):String;
	@:native("getBackendExplanationViabilityString")
	public static function getBackendExplanationViabilityString(value:Dynamic):String;
	@:native("parseBackendExplanationLayer")
	public static function parseBackendExplanationLayer(value:String):Null<Dynamic>;
	@:native("parseBackendExplanationViability")
	public static function parseBackendExplanationViability(value:String):Null<Dynamic>;
	@:native("getBackendOperationExplanationLayerString")
	public static function getBackendOperationExplanationLayerString(value:Dynamic):String;
	@:native("parseBackendOperationExplanationLayer")
	public static function parseBackendOperationExplanationLayer(value:String):Null<Dynamic>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBackendOperationExplanation(ptr:flight._js.BackendOperationExplanation):Void {}
}
