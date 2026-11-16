package flight._cpp;

private extern class StatechartInput_Ffi {
	@:native("flight_get_statechart_input_initial_value") static function get_initialValue(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_statechart_input_initial_value") static function set_initialValue(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract StatechartInput(cpp.Star<cpp.Void>) {
	public var initialValue(get, set):Float;

	inline function get_initialValue():Float return StatechartInput_Ffi.get_initialValue(this);

	inline function set_initialValue(value:Float):Float { StatechartInput_Ffi.set_initialValue(this, value); return value; }
}
