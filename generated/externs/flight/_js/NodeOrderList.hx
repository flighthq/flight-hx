package flight._js;

@:jsRequire("flight")
private extern class NodeOrderList_Ffi {
	@:native("flight_get_node_order_list_entry_count") static function get_entryCount(ptr:Dynamic):Int;
	@:native("flight_set_node_order_list_entry_count") static function set_entryCount(ptr:Dynamic, value:Int):Int;
}

abstract NodeOrderList(Dynamic) {
	public var entryCount(get, set):Int;

	inline function get_entryCount():Int return NodeOrderList_Ffi.get_entryCount(this);

	inline function set_entryCount(value:Int):Int return NodeOrderList_Ffi.set_entryCount(this, value);
}
