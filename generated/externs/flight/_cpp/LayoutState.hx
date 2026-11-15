package flight._cpp;

private extern class LayoutState_Ffi {
	@:native("flight_get_layout_state_last_failure_actual_length") static function get_lastFailureActualLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_layout_state_last_failure_actual_length") static function set_lastFailureActualLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_layout_state_last_failure_node_index") static function get_lastFailureNodeIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_layout_state_last_failure_node_index") static function set_lastFailureNodeIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_layout_state_last_failure_parent_index") static function get_lastFailureParentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_layout_state_last_failure_parent_index") static function set_lastFailureParentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_layout_state_last_failure_required_length") static function get_lastFailureRequiredLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_layout_state_last_failure_required_length") static function set_lastFailureRequiredLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract LayoutState(cpp.Star<cpp.Void>) {
	public var lastFailureActualLength(get, set):Int;

	inline function get_lastFailureActualLength():Int return LayoutState_Ffi.get_lastFailureActualLength(this);

	inline function set_lastFailureActualLength(value:Int):Int return LayoutState_Ffi.set_lastFailureActualLength(this, value);
	public var lastFailureNodeIndex(get, set):Int;

	inline function get_lastFailureNodeIndex():Int return LayoutState_Ffi.get_lastFailureNodeIndex(this);

	inline function set_lastFailureNodeIndex(value:Int):Int return LayoutState_Ffi.set_lastFailureNodeIndex(this, value);
	public var lastFailureParentIndex(get, set):Int;

	inline function get_lastFailureParentIndex():Int return LayoutState_Ffi.get_lastFailureParentIndex(this);

	inline function set_lastFailureParentIndex(value:Int):Int return LayoutState_Ffi.set_lastFailureParentIndex(this, value);
	public var lastFailureRequiredLength(get, set):Int;

	inline function get_lastFailureRequiredLength():Int return LayoutState_Ffi.get_lastFailureRequiredLength(this);

	inline function set_lastFailureRequiredLength(value:Int):Int return LayoutState_Ffi.set_lastFailureRequiredLength(this, value);
}
