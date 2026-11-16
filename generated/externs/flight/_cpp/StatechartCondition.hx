package flight._cpp;

private extern class StatechartCondition_Ffi {
	@:native("flight_get_statechart_condition_input_index") static function get_inputIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_statechart_condition_input_index") static function set_inputIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_statechart_condition_value") static function get_value(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_statechart_condition_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract StatechartCondition(cpp.Star<cpp.Void>) {
	public var inputIndex(get, set):Int;

	inline function get_inputIndex():Int return StatechartCondition_Ffi.get_inputIndex(this);

	inline function set_inputIndex(value:Int):Int { StatechartCondition_Ffi.set_inputIndex(this, value); return value; }
	public var value(get, set):Float;

	inline function get_value():Float return StatechartCondition_Ffi.get_value(this);

	inline function set_value(value:Float):Float { StatechartCondition_Ffi.set_value(this, value); return value; }
}
