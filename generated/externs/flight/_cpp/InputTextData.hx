package flight._cpp;

private extern class InputTextData_Ffi {
	@:native("flight_get_input_text_data_is_composing") static function get_isComposing(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_text_data_is_composing") static function set_isComposing(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract InputTextData(cpp.Star<cpp.Void>) {
	public var isComposing(get, set):Bool;

	inline function get_isComposing():Bool return InputTextData_Ffi.get_isComposing(this);

	inline function set_isComposing(value:Bool):Bool { InputTextData_Ffi.set_isComposing(this, value); return value; }
}
