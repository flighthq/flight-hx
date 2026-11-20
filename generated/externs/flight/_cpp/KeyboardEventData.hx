package flight._cpp;

private extern class KeyboardEventData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_keyboard_event_data_alt_key") static function get_altKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_keyboard_event_data_alt_key") static function set_altKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_keyboard_event_data_ctrl_key") static function get_ctrlKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_keyboard_event_data_ctrl_key") static function set_ctrlKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_keyboard_event_data_key") static function get_key(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_keyboard_event_data_key") static function set_key(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_keyboard_event_data_key_code") static function get_keyCode(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_keyboard_event_data_key_code") static function set_keyCode(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_keyboard_event_data_meta_key") static function get_metaKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_keyboard_event_data_meta_key") static function set_metaKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_keyboard_event_data_shift_key") static function get_shiftKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_keyboard_event_data_shift_key") static function set_shiftKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract KeyboardEventData(cpp.Star<cpp.Void>) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return KeyboardEventData_Ffi.get_altKey(this);

	inline function set_altKey(value:Bool):Bool { KeyboardEventData_Ffi.set_altKey(this, value); return value; }
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return KeyboardEventData_Ffi.get_ctrlKey(this);

	inline function set_ctrlKey(value:Bool):Bool { KeyboardEventData_Ffi.set_ctrlKey(this, value); return value; }
	public var key(get, set):String;
	inline function get_key():String { var raw = KeyboardEventData_Ffi.get_key(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); KeyboardEventData_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:cpp.ConstCharStar = cast value; KeyboardEventData_Ffi.set_key(this, raw); return value; }
	public var keyCode(get, set):Int;

	inline function get_keyCode():Int return KeyboardEventData_Ffi.get_keyCode(this);

	inline function set_keyCode(value:Int):Int { KeyboardEventData_Ffi.set_keyCode(this, value); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return KeyboardEventData_Ffi.get_metaKey(this);

	inline function set_metaKey(value:Bool):Bool { KeyboardEventData_Ffi.set_metaKey(this, value); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return KeyboardEventData_Ffi.get_shiftKey(this);

	inline function set_shiftKey(value:Bool):Bool { KeyboardEventData_Ffi.set_shiftKey(this, value); return value; }
}
