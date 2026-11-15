package flight._js;

@:jsRequire("flight")
private extern class MorphShapeTexturePaintBinding_Ffi {
	@:native("flight_get_morph_shape_texture_paint_binding_command_index") static function get_commandIndex(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_texture_paint_binding_command_index") static function set_commandIndex(ptr:Dynamic, value:Int):Int;
}

abstract MorphShapeTexturePaintBinding(Dynamic) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeTexturePaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int return MorphShapeTexturePaintBinding_Ffi.set_commandIndex(this, value);
}
