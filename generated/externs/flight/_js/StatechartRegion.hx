package flight._js;

@:jsRequire("flight")
private extern class StatechartRegion_Ffi {
	@:native("flight_get_statechart_region_initial_state_index") static function get_initialStateIndex(ptr:Dynamic):Int;
	@:native("flight_set_statechart_region_initial_state_index") static function set_initialStateIndex(ptr:Dynamic, value:Int):Int;
}

abstract StatechartRegion(Dynamic) {
	public var initialStateIndex(get, set):Int;

	inline function get_initialStateIndex():Int return StatechartRegion_Ffi.get_initialStateIndex(this);

	inline function set_initialStateIndex(value:Int):Int return StatechartRegion_Ffi.set_initialStateIndex(this, value);
}
