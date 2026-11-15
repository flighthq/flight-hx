package flight._js;

@:jsRequire("flight")
private extern class InputPointerData_Ffi {
	@:native("flight_get_input_pointer_data_alt_key") static function get_altKey(ptr:Dynamic):Bool;
	@:native("flight_set_input_pointer_data_alt_key") static function set_altKey(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_input_pointer_data_button") static function get_button(ptr:Dynamic):Int;
	@:native("flight_set_input_pointer_data_button") static function set_button(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_input_pointer_data_buttons") static function get_buttons(ptr:Dynamic):Int;
	@:native("flight_set_input_pointer_data_buttons") static function set_buttons(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_input_pointer_data_ctrl_key") static function get_ctrlKey(ptr:Dynamic):Bool;
	@:native("flight_set_input_pointer_data_ctrl_key") static function set_ctrlKey(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_input_pointer_data_delta_x") static function get_deltaX(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_delta_x") static function set_deltaX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_delta_y") static function get_deltaY(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_delta_y") static function set_deltaY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_is_primary") static function get_isPrimary(ptr:Dynamic):Bool;
	@:native("flight_set_input_pointer_data_is_primary") static function set_isPrimary(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_input_pointer_data_meta_key") static function get_metaKey(ptr:Dynamic):Bool;
	@:native("flight_set_input_pointer_data_meta_key") static function set_metaKey(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_input_pointer_data_pointer_id") static function get_pointerId(ptr:Dynamic):Int;
	@:native("flight_set_input_pointer_data_pointer_id") static function set_pointerId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_input_pointer_data_pressure") static function get_pressure(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_pressure") static function set_pressure(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_shift_key") static function get_shiftKey(ptr:Dynamic):Bool;
	@:native("flight_set_input_pointer_data_shift_key") static function set_shiftKey(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_input_pointer_data_tilt_x") static function get_tiltX(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_tilt_x") static function set_tiltX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_tilt_y") static function get_tiltY(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_tilt_y") static function set_tiltY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_time_stamp") static function get_timeStamp(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_time_stamp") static function set_timeStamp(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_twist") static function get_twist(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_twist") static function set_twist(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_pointer_data_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_input_pointer_data_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract InputPointerData(Dynamic) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return InputPointerData_Ffi.get_altKey(this);

	inline function set_altKey(value:Bool):Bool return InputPointerData_Ffi.set_altKey(this, value);
	public var button(get, set):Int;

	inline function get_button():Int return InputPointerData_Ffi.get_button(this);

	inline function set_button(value:Int):Int return InputPointerData_Ffi.set_button(this, value);
	public var buttons(get, set):Int;

	inline function get_buttons():Int return InputPointerData_Ffi.get_buttons(this);

	inline function set_buttons(value:Int):Int return InputPointerData_Ffi.set_buttons(this, value);
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return InputPointerData_Ffi.get_ctrlKey(this);

	inline function set_ctrlKey(value:Bool):Bool return InputPointerData_Ffi.set_ctrlKey(this, value);
	public var deltaX(get, set):Float;

	inline function get_deltaX():Float return InputPointerData_Ffi.get_deltaX(this);

	inline function set_deltaX(value:Float):Float return InputPointerData_Ffi.set_deltaX(this, value);
	public var deltaY(get, set):Float;

	inline function get_deltaY():Float return InputPointerData_Ffi.get_deltaY(this);

	inline function set_deltaY(value:Float):Float return InputPointerData_Ffi.set_deltaY(this, value);
	public var height(get, set):Float;

	inline function get_height():Float return InputPointerData_Ffi.get_height(this);

	inline function set_height(value:Float):Float return InputPointerData_Ffi.set_height(this, value);
	public var isPrimary(get, set):Bool;

	inline function get_isPrimary():Bool return InputPointerData_Ffi.get_isPrimary(this);

	inline function set_isPrimary(value:Bool):Bool return InputPointerData_Ffi.set_isPrimary(this, value);
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return InputPointerData_Ffi.get_metaKey(this);

	inline function set_metaKey(value:Bool):Bool return InputPointerData_Ffi.set_metaKey(this, value);
	public var pointerId(get, set):Int;

	inline function get_pointerId():Int return InputPointerData_Ffi.get_pointerId(this);

	inline function set_pointerId(value:Int):Int return InputPointerData_Ffi.set_pointerId(this, value);
	public var pressure(get, set):Float;

	inline function get_pressure():Float return InputPointerData_Ffi.get_pressure(this);

	inline function set_pressure(value:Float):Float return InputPointerData_Ffi.set_pressure(this, value);
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return InputPointerData_Ffi.get_shiftKey(this);

	inline function set_shiftKey(value:Bool):Bool return InputPointerData_Ffi.set_shiftKey(this, value);
	public var tiltX(get, set):Float;

	inline function get_tiltX():Float return InputPointerData_Ffi.get_tiltX(this);

	inline function set_tiltX(value:Float):Float return InputPointerData_Ffi.set_tiltX(this, value);
	public var tiltY(get, set):Float;

	inline function get_tiltY():Float return InputPointerData_Ffi.get_tiltY(this);

	inline function set_tiltY(value:Float):Float return InputPointerData_Ffi.set_tiltY(this, value);
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return InputPointerData_Ffi.get_timeStamp(this);

	inline function set_timeStamp(value:Float):Float return InputPointerData_Ffi.set_timeStamp(this, value);
	public var twist(get, set):Float;

	inline function get_twist():Float return InputPointerData_Ffi.get_twist(this);

	inline function set_twist(value:Float):Float return InputPointerData_Ffi.set_twist(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return InputPointerData_Ffi.get_width(this);

	inline function set_width(value:Float):Float return InputPointerData_Ffi.set_width(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return InputPointerData_Ffi.get_x(this);

	inline function set_x(value:Float):Float return InputPointerData_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return InputPointerData_Ffi.get_y(this);

	inline function set_y(value:Float):Float return InputPointerData_Ffi.set_y(this, value);
}
