package flight._cpp;

private extern class SocketMessage_Ffi {
	@:native("flight_get_socket_message_binary") static function get_binary(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_socket_message_binary") static function set_binary(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract SocketMessage(cpp.Star<cpp.Void>) {
	public var binary(get, set):Bool;

	inline function get_binary():Bool return SocketMessage_Ffi.get_binary(this);

	inline function set_binary(value:Bool):Bool { SocketMessage_Ffi.set_binary(this, value); return value; }
}
