package flight._hl;

private extern class CocosPlistMetadata_Ffi {
	@:hlNative("flight", "flight_field_get_cocos_plist_metadata_size")
	static function get_size(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_cocos_plist_metadata_size")
	static function set_size(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_metadata_texture_file_name")
	static function get_textureFileName(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_cocos_plist_metadata_texture_file_name")
	static function set_textureFileName(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract CocosPlistMetadata(hl.Bytes) {
	public var format(get, set):Int;

	inline function get_format():Int return this.getI32(0);

	inline function set_format(value:Int):Int { this.setI32(0, value); return value; }
	public var size(get, set):String;
	inline function get_size():String {
		final bytes = CocosPlistMetadata_Ffi.get_size(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_size(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CocosPlistMetadata_Ffi.set_size(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var textureFileName(get, set):String;
	inline function get_textureFileName():String {
		final bytes = CocosPlistMetadata_Ffi.get_textureFileName(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_textureFileName(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CocosPlistMetadata_Ffi.set_textureFileName(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
