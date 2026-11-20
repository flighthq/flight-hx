package flight._cpp;

private extern class InputTextData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_input_text_data_is_composing") static function get_isComposing(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_text_data_is_composing") static function set_isComposing(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_input_text_data_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_input_text_data_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract InputTextData(cpp.Star<cpp.Void>) {
	public var isComposing(get, set):Bool;

	inline function get_isComposing():Bool return InputTextData_Ffi.get_isComposing(this);

	inline function set_isComposing(value:Bool):Bool { InputTextData_Ffi.set_isComposing(this, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = InputTextData_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); InputTextData_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; InputTextData_Ffi.set_text(this, raw); return value; }
}
