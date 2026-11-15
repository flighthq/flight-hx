package flight._js;

@:jsRequire("flight")
private extern class NodeGuardState_Ffi {
	@:native("flight_get_node_guard_state_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_node_guard_state_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract NodeGuardState(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return NodeGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return NodeGuardState_Ffi.set_enabled(this, value);
}
