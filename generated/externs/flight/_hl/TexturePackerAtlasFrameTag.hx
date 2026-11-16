package flight._hl;

private extern class TexturePackerAtlasFrameTag_Ffi {
	@:hlNative("flight", "flight_field_get_texture_packer_atlas_frame_tag_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_texture_packer_atlas_frame_tag_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TexturePackerAtlasFrameTag(hl.Bytes) {
	public var from(get, set):Int;

	inline function get_from():Int return this.getI32(4);

	inline function set_from(value:Int):Int { this.setI32(4, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = TexturePackerAtlasFrameTag_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasFrameTag_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var to(get, set):Int;

	inline function get_to():Int return this.getI32(32);

	inline function set_to(value:Int):Int { this.setI32(32, value); return value; }
}
