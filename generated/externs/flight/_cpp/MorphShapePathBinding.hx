package flight._cpp;

private extern class MorphShapePathBinding_Ffi {
	@:native("flight_get_morph_shape_path_binding_command_index") static function get_commandIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_path_binding_command_index") static function set_commandIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract MorphShapePathBinding(cpp.Star<cpp.Void>) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapePathBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int return MorphShapePathBinding_Ffi.set_commandIndex(this, value);
}
