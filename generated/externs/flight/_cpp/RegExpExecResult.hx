package flight._cpp;

private extern class RegExpExecResult_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_reg_exp_exec_result_index") static function get_index(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_reg_exp_exec_result_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_reg_exp_exec_result_input") static function get_input(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_reg_exp_exec_result_input") static function set_input(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RegExpExecResult(cpp.Star<cpp.Void>) {
	public var index(get, set):Int;

	inline function get_index():Int return RegExpExecResult_Ffi.get_index(this);

	inline function set_index(value:Int):Int { RegExpExecResult_Ffi.set_index(this, value); return value; }
	public var input(get, set):String;
	inline function get_input():String { var raw = RegExpExecResult_Ffi.get_input(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RegExpExecResult_Ffi.freeString(raw); return value; }
	inline function set_input(value:String):String { var raw:cpp.ConstCharStar = cast value; RegExpExecResult_Ffi.set_input(this, raw); return value; }
}
