package flight._cpp;

private extern class SetNodePropertyCommand_Ffi {
	@:native("flight_get_set_node_property_command_merge_window") static function get_mergeWindow(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_set_node_property_command_merge_window") static function set_mergeWindow(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_set_node_property_command_time") static function get_time(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_set_node_property_command_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract SetNodePropertyCommand(cpp.Star<cpp.Void>) {
	public var mergeWindow(get, set):Float;

	inline function get_mergeWindow():Float return SetNodePropertyCommand_Ffi.get_mergeWindow(this);

	inline function set_mergeWindow(value:Float):Float { SetNodePropertyCommand_Ffi.set_mergeWindow(this, value); return value; }
	public var time(get, set):Float;

	inline function get_time():Float return SetNodePropertyCommand_Ffi.get_time(this);

	inline function set_time(value:Float):Float { SetNodePropertyCommand_Ffi.set_time(this, value); return value; }
}
