package flight._cpp;

private extern class SocketRuntime_Ffi {
	@:native("flight_get_socket_runtime_delivering") static function get_delivering(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_socket_runtime_delivering") static function set_delivering(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_socket_runtime_disposed") static function get_disposed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_socket_runtime_disposed") static function set_disposed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract SocketRuntime(cpp.Star<cpp.Void>) {
	public var delivering(get, set):Bool;

	inline function get_delivering():Bool return SocketRuntime_Ffi.get_delivering(this);

	inline function set_delivering(value:Bool):Bool { SocketRuntime_Ffi.set_delivering(this, value); return value; }
	public var disposed(get, set):Bool;

	inline function get_disposed():Bool return SocketRuntime_Ffi.get_disposed(this);

	inline function set_disposed(value:Bool):Bool { SocketRuntime_Ffi.set_disposed(this, value); return value; }
}
