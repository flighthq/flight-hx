package flight._cpp;

private extern class RegExp_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_reg_exp_flags") static function get_flags(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_reg_exp_flags") static function set_flags(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_reg_exp_last_index") static function get_lastIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_reg_exp_last_index") static function set_lastIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_reg_exp_source") static function get_source(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_reg_exp_source") static function set_source(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RegExp(cpp.Star<cpp.Void>) {
	public var flags(get, set):String;
	inline function get_flags():String { var raw = RegExp_Ffi.get_flags(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RegExp_Ffi.freeString(raw); return value; }
	inline function set_flags(value:String):String { var raw:cpp.ConstCharStar = cast value; RegExp_Ffi.set_flags(this, raw); return value; }
	public var lastIndex(get, set):Int;

	inline function get_lastIndex():Int return RegExp_Ffi.get_lastIndex(this);

	inline function set_lastIndex(value:Int):Int { RegExp_Ffi.set_lastIndex(this, value); return value; }
	public var source(get, set):String;
	inline function get_source():String { var raw = RegExp_Ffi.get_source(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RegExp_Ffi.freeString(raw); return value; }
	inline function set_source(value:String):String { var raw:cpp.ConstCharStar = cast value; RegExp_Ffi.set_source(this, raw); return value; }
}
