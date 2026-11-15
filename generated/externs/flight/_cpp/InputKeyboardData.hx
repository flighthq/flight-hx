package flight._cpp;

private extern class InputKeyboardData_Ffi {
	@:native("flight_get_input_keyboard_data_alt_key") static function get_altKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_keyboard_data_alt_key") static function set_altKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_input_keyboard_data_caps_lock") static function get_capsLock(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_keyboard_data_caps_lock") static function set_capsLock(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_input_keyboard_data_ctrl_key") static function get_ctrlKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_keyboard_data_ctrl_key") static function set_ctrlKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_input_keyboard_data_key_code") static function get_keyCode(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_keyboard_data_key_code") static function set_keyCode(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_input_keyboard_data_location") static function get_location(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_keyboard_data_location") static function set_location(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_input_keyboard_data_meta_key") static function get_metaKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_keyboard_data_meta_key") static function set_metaKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_input_keyboard_data_modifier") static function get_modifier(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_keyboard_data_modifier") static function set_modifier(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_input_keyboard_data_num_lock") static function get_numLock(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_keyboard_data_num_lock") static function set_numLock(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_input_keyboard_data_repeat") static function get_repeat(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_keyboard_data_repeat") static function set_repeat(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_input_keyboard_data_shift_key") static function get_shiftKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_keyboard_data_shift_key") static function set_shiftKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_input_keyboard_data_time_stamp") static function get_timeStamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_input_keyboard_data_time_stamp") static function set_timeStamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract InputKeyboardData(cpp.Star<cpp.Void>) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return InputKeyboardData_Ffi.get_altKey(this);

	inline function set_altKey(value:Bool):Bool return InputKeyboardData_Ffi.set_altKey(this, value);
	public var capsLock(get, set):Bool;

	inline function get_capsLock():Bool return InputKeyboardData_Ffi.get_capsLock(this);

	inline function set_capsLock(value:Bool):Bool return InputKeyboardData_Ffi.set_capsLock(this, value);
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return InputKeyboardData_Ffi.get_ctrlKey(this);

	inline function set_ctrlKey(value:Bool):Bool return InputKeyboardData_Ffi.set_ctrlKey(this, value);
	public var keyCode(get, set):Int;

	inline function get_keyCode():Int return InputKeyboardData_Ffi.get_keyCode(this);

	inline function set_keyCode(value:Int):Int return InputKeyboardData_Ffi.set_keyCode(this, value);
	public var location(get, set):Int;

	inline function get_location():Int return InputKeyboardData_Ffi.get_location(this);

	inline function set_location(value:Int):Int return InputKeyboardData_Ffi.set_location(this, value);
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return InputKeyboardData_Ffi.get_metaKey(this);

	inline function set_metaKey(value:Bool):Bool return InputKeyboardData_Ffi.set_metaKey(this, value);
	public var modifier(get, set):Int;

	inline function get_modifier():Int return InputKeyboardData_Ffi.get_modifier(this);

	inline function set_modifier(value:Int):Int return InputKeyboardData_Ffi.set_modifier(this, value);
	public var numLock(get, set):Bool;

	inline function get_numLock():Bool return InputKeyboardData_Ffi.get_numLock(this);

	inline function set_numLock(value:Bool):Bool return InputKeyboardData_Ffi.set_numLock(this, value);
	public var repeat(get, set):Bool;

	inline function get_repeat():Bool return InputKeyboardData_Ffi.get_repeat(this);

	inline function set_repeat(value:Bool):Bool return InputKeyboardData_Ffi.set_repeat(this, value);
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return InputKeyboardData_Ffi.get_shiftKey(this);

	inline function set_shiftKey(value:Bool):Bool return InputKeyboardData_Ffi.set_shiftKey(this, value);
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return InputKeyboardData_Ffi.get_timeStamp(this);

	inline function set_timeStamp(value:Float):Float return InputKeyboardData_Ffi.set_timeStamp(this, value);
}
