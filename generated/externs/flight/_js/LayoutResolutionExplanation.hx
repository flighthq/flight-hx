package flight._js;

@:jsRequire("flight")
private extern class LayoutResolutionExplanation_Ffi {
	@:native("flight_get_layout_resolution_explanation_actual_length") static function get_actualLength(ptr:Dynamic):Int;
	@:native("flight_set_layout_resolution_explanation_actual_length") static function set_actualLength(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_layout_resolution_explanation_node_index") static function get_nodeIndex(ptr:Dynamic):Int;
	@:native("flight_set_layout_resolution_explanation_node_index") static function set_nodeIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_layout_resolution_explanation_parent_index") static function get_parentIndex(ptr:Dynamic):Int;
	@:native("flight_set_layout_resolution_explanation_parent_index") static function set_parentIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_layout_resolution_explanation_required_length") static function get_requiredLength(ptr:Dynamic):Int;
	@:native("flight_set_layout_resolution_explanation_required_length") static function set_requiredLength(ptr:Dynamic, value:Int):Int;
}

abstract LayoutResolutionExplanation(Dynamic) {
	public var actualLength(get, set):Int;

	inline function get_actualLength():Int return LayoutResolutionExplanation_Ffi.get_actualLength(this);

	inline function set_actualLength(value:Int):Int return LayoutResolutionExplanation_Ffi.set_actualLength(this, value);
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return LayoutResolutionExplanation_Ffi.get_nodeIndex(this);

	inline function set_nodeIndex(value:Int):Int return LayoutResolutionExplanation_Ffi.set_nodeIndex(this, value);
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return LayoutResolutionExplanation_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int return LayoutResolutionExplanation_Ffi.set_parentIndex(this, value);
	public var requiredLength(get, set):Int;

	inline function get_requiredLength():Int return LayoutResolutionExplanation_Ffi.get_requiredLength(this);

	inline function set_requiredLength(value:Int):Int return LayoutResolutionExplanation_Ffi.set_requiredLength(this, value);
}
