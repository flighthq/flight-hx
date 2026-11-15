package flight._js;

@:jsRequire("flight")
private extern class LayoutNode_Ffi {
	@:native("flight_get_layout_node_parent_index") static function get_parentIndex(ptr:Dynamic):Int;
	@:native("flight_set_layout_node_parent_index") static function set_parentIndex(ptr:Dynamic, value:Int):Int;
}

abstract LayoutNode(Dynamic) {
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return LayoutNode_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int return LayoutNode_Ffi.set_parentIndex(this, value);
}
