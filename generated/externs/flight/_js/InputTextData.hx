package flight._js;

@:jsRequire("flight")
private extern class InputTextData_Ffi {
	@:native("flight_get_input_text_data_is_composing") static function get_isComposing(ptr:Dynamic):Bool;
	@:native("flight_set_input_text_data_is_composing") static function set_isComposing(ptr:Dynamic, value:Bool):Bool;
}

abstract InputTextData(Dynamic) {
	public var isComposing(get, set):Bool;

	inline function get_isComposing():Bool return InputTextData_Ffi.get_isComposing(this);

	inline function set_isComposing(value:Bool):Bool return InputTextData_Ffi.set_isComposing(this, value);
}
