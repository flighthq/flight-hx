package flight._cpp;

private extern class NodeOrderList_Ffi {
	@:native("flight_get_node_order_list_entry_count") static function get_entryCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_node_order_list_entry_count") static function set_entryCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract NodeOrderList(cpp.Star<cpp.Void>) {
	public var entryCount(get, set):Int;

	inline function get_entryCount():Int return NodeOrderList_Ffi.get_entryCount(this);

	inline function set_entryCount(value:Int):Int { NodeOrderList_Ffi.set_entryCount(this, value); return value; }
}
