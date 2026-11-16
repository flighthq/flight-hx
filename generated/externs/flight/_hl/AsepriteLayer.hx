package flight._hl;

private extern class AsepriteLayer_Ffi {
	@:hlNative("flight", "flight_field_get_aseprite_layer_blend_mode")
	static function get_blendMode(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_aseprite_layer_blend_mode")
	static function set_blendMode(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_aseprite_layer_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_aseprite_layer_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract AsepriteLayer(hl.Bytes) {
	public var blendMode(get, set):String;
	inline function get_blendMode():String {
		final bytes = AsepriteLayer_Ffi.get_blendMode(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_blendMode(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AsepriteLayer_Ffi.set_blendMode(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var name(get, set):String;
	inline function get_name():String {
		final bytes = AsepriteLayer_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AsepriteLayer_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var opacity(get, set):Single;

	inline function get_opacity():Single return this.getF32(48);

	inline function set_opacity(value:Single):Single { this.setF32(48, value); return value; }
}
