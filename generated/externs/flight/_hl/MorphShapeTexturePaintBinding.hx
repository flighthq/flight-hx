package flight._hl;

private extern class MorphShapeTexturePaintBinding_Ffi {
	@:hlNative("flight", "flight_field_get_morph_shape_texture_paint_binding_command_key")
	static function get_commandKey(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_morph_shape_texture_paint_binding_command_key")
	static function set_commandKey(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract MorphShapeTexturePaintBinding(hl.Bytes) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(0);

	inline function set_commandIndex(value:Int):Int { this.setI32(0, value); return value; }
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
		MorphShapeTexturePaintBinding_Ffi.set_commandKey(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
