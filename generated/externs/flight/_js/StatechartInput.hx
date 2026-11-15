package flight._js;

@:jsRequire("flight")
private extern class StatechartInput_Ffi {
	@:native("flight_get_statechart_input_initial_value") static function get_initialValue(ptr:Dynamic):Float;
	@:native("flight_set_statechart_input_initial_value") static function set_initialValue(ptr:Dynamic, value:Float):Float;
}

abstract StatechartInput(Dynamic) {
	public var initialValue(get, set):Float;

	inline function get_initialValue():Float return StatechartInput_Ffi.get_initialValue(this);

	inline function set_initialValue(value:Float):Float return StatechartInput_Ffi.set_initialValue(this, value);
}
