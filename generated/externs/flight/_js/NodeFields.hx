package flight._js;

@:jsRequire("flight")
private extern class NodeFields_Ffi {
	@:native("flight_get_node_fields_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_node_fields_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract NodeFields(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return NodeFields_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return NodeFields_Ffi.set_enabled(this, value);
}
