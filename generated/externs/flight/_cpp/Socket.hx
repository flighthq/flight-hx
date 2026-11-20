package flight._cpp;

private extern class Socket_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_socket_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_socket_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Socket(cpp.Star<cpp.Void>) {
	public var url(get, set):String;
	inline function get_url():String { var raw = Socket_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Socket_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; Socket_Ffi.set_url(this, raw); return value; }

	extern inline public function freeRef():Void {
		flight._cpp._fn.Socket.freeSocketRef(cast this);
	}
}
