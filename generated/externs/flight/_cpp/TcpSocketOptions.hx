package flight._cpp;

private extern class TcpSocketOptions_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_tcp_socket_options_host") static function get_host(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_tcp_socket_options_host") static function set_host(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_tcp_socket_options_port") static function get_port(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_tcp_socket_options_port") static function set_port(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TcpSocketOptions(cpp.Star<cpp.Void>) {
	public var host(get, set):String;
	inline function get_host():String { var raw = TcpSocketOptions_Ffi.get_host(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TcpSocketOptions_Ffi.freeString(raw); return value; }
	inline function set_host(value:String):String { var raw:cpp.ConstCharStar = cast value; TcpSocketOptions_Ffi.set_host(this, raw); return value; }
	public var port(get, set):Int;

	inline function get_port():Int return TcpSocketOptions_Ffi.get_port(this);

	inline function set_port(value:Int):Int { TcpSocketOptions_Ffi.set_port(this, value); return value; }
}
