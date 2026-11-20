package flight._hl;

private extern class AddNodeChildCommand_Ffi {
	@:hlNative("flight", "flight_get_add_node_child_command_index")
	static function get_index(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_add_node_child_command_index")
	static function set_index(ptr:hl.Bytes, value:Int):Int;
}

abstract AddNodeChildCommand(hl.Bytes) {
	public var index(get, set):Int;

	inline function get_index():Int return AddNodeChildCommand_Ffi.get_index(this);

	inline function set_index(value:Int):Int { AddNodeChildCommand_Ffi.set_index(this, value); return value; }
}
