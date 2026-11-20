package flight._cpp;

private extern class SocketCloseInfo_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_socket_close_info_code") static function get_code(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_socket_close_info_code") static function set_code(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_socket_close_info_reason") static function get_reason(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_socket_close_info_reason") static function set_reason(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_socket_close_info_was_clean") static function get_wasClean(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_socket_close_info_was_clean") static function set_wasClean(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract SocketCloseInfo(cpp.Star<cpp.Void>) {
	public var code(get, set):Int;

	inline function get_code():Int return SocketCloseInfo_Ffi.get_code(this);

	inline function set_code(value:Int):Int { SocketCloseInfo_Ffi.set_code(this, value); return value; }
	public var reason(get, set):String;
	inline function get_reason():String { var raw = SocketCloseInfo_Ffi.get_reason(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SocketCloseInfo_Ffi.freeString(raw); return value; }
	inline function set_reason(value:String):String { var raw:cpp.ConstCharStar = cast value; SocketCloseInfo_Ffi.set_reason(this, raw); return value; }
	public var wasClean(get, set):Bool;

	inline function get_wasClean():Bool return SocketCloseInfo_Ffi.get_wasClean(this);

	inline function set_wasClean(value:Bool):Bool { SocketCloseInfo_Ffi.set_wasClean(this, value); return value; }
}
