package flight._cpp;

private extern class MorphShapeTexturePaintBinding_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_morph_shape_texture_paint_binding_command_index") static function get_commandIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_texture_paint_binding_command_index") static function set_commandIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_morph_shape_texture_paint_binding_command_key") static function get_commandKey(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_morph_shape_texture_paint_binding_command_key") static function set_commandKey(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract MorphShapeTexturePaintBinding(cpp.Star<cpp.Void>) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeTexturePaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int { MorphShapeTexturePaintBinding_Ffi.set_commandIndex(this, value); return value; }
	public var commandKey(get, set):String;
	inline function get_commandKey():String { var raw = MorphShapeTexturePaintBinding_Ffi.get_commandKey(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); MorphShapeTexturePaintBinding_Ffi.freeString(raw); return value; }
	inline function set_commandKey(value:String):String { var raw:cpp.ConstCharStar = cast value; MorphShapeTexturePaintBinding_Ffi.set_commandKey(this, raw); return value; }
}
