package flight._cpp;

private extern class LayoutNode_Ffi {
	@:native("flight_get_layout_node_parent_index") static function get_parentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_layout_node_parent_index") static function set_parentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract LayoutNode(cpp.Star<cpp.Void>) {
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return LayoutNode_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int return LayoutNode_Ffi.set_parentIndex(this, value);
}
