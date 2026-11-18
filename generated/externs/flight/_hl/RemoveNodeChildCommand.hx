package flight._hl;

private extern class RemoveNodeChildCommand_Ffi {
	@:hlNative("flight", "flight_get_remove_node_child_command_index")
	static function get_index(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_remove_node_child_command_index")
	static function set_index(ptr:hl.Bytes, value:Int):Int;
}

abstract RemoveNodeChildCommand(hl.Bytes) {
	public var index(get, set):Int;

	inline function get_index():Int return RemoveNodeChildCommand_Ffi.get_index(this);
	inline function set_index(value:Int):Int { RemoveNodeChildCommand_Ffi.set_index(this, value); return value; }
}
