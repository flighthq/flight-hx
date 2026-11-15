package flight._cpp;

private extern class NodeFields_Ffi {
	@:native("flight_get_node_fields_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node_fields_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract NodeFields(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return NodeFields_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return NodeFields_Ffi.set_enabled(this, value);
}
