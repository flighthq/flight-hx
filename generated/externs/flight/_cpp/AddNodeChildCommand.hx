package flight._cpp;

private extern class AddNodeChildCommand_Ffi {
	@:native("flight_get_add_node_child_command_index") static function get_index(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_add_node_child_command_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract AddNodeChildCommand(cpp.Star<cpp.Void>) {
	public var index(get, set):Int;

	inline function get_index():Int return AddNodeChildCommand_Ffi.get_index(this);

	inline function set_index(value:Int):Int { AddNodeChildCommand_Ffi.set_index(this, value); return value; }
}
