package flight._cpp;

private extern class SocketGuardState_Ffi {
	@:native("flight_get_socket_guard_state_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_socket_guard_state_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract SocketGuardState(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return SocketGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { SocketGuardState_Ffi.set_enabled(this, value); return value; }
}
