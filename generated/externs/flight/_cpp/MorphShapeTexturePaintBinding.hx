package flight._cpp;

private extern class MorphShapeTexturePaintBinding_Ffi {
	@:native("flight_get_morph_shape_texture_paint_binding_command_index") static function get_commandIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_texture_paint_binding_command_index") static function set_commandIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_morph_shape_texture_paint_binding_command_key")
	static function get_commandKey(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_morph_shape_texture_paint_binding_command_key")
	static function set_commandKey(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract MorphShapeTexturePaintBinding(cpp.Star<cpp.Void>) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return MorphShapeTexturePaintBinding_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int { MorphShapeTexturePaintBinding_Ffi.set_commandIndex(this, value); return value; }
	public var commandKey(get, set):String;
	inline function get_commandKey():String {
		final bytes = MorphShapeTexturePaintBinding_Ffi.get_commandKey(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_commandKey(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		MorphShapeTexturePaintBinding_Ffi.set_commandKey(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
