package flight._cpp;

private extern class StatechartRegion_Ffi {
	@:native("flight_get_statechart_region_initial_state_index") static function get_initialStateIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_statechart_region_initial_state_index") static function set_initialStateIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract StatechartRegion(cpp.Star<cpp.Void>) {
	public var initialStateIndex(get, set):Int;

	inline function get_initialStateIndex():Int return StatechartRegion_Ffi.get_initialStateIndex(this);

	inline function set_initialStateIndex(value:Int):Int return StatechartRegion_Ffi.set_initialStateIndex(this, value);
}
