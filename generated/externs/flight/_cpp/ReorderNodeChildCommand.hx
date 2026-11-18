package flight._cpp;

private extern class ReorderNodeChildCommand_Ffi {
	@:native("flight_get_reorder_node_child_command_from_index") static function get_fromIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_reorder_node_child_command_from_index") static function set_fromIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_reorder_node_child_command_to_index") static function get_toIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_reorder_node_child_command_to_index") static function set_toIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ReorderNodeChildCommand(cpp.Star<cpp.Void>) {
	public var fromIndex(get, set):Int;

	inline function get_fromIndex():Int return ReorderNodeChildCommand_Ffi.get_fromIndex(this);

	inline function set_fromIndex(value:Int):Int { ReorderNodeChildCommand_Ffi.set_fromIndex(this, value); return value; }
	public var toIndex(get, set):Int;

	inline function get_toIndex():Int return ReorderNodeChildCommand_Ffi.get_toIndex(this);

	inline function set_toIndex(value:Int):Int { ReorderNodeChildCommand_Ffi.set_toIndex(this, value); return value; }
}
