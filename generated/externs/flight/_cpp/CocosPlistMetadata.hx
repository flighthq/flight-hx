package flight._cpp;

private extern class CocosPlistMetadata_Ffi {
	@:native("flight_get_cocos_plist_metadata_format") static function get_format(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_cocos_plist_metadata_format") static function set_format(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_cocos_plist_metadata_size")
	static function get_size(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_cocos_plist_metadata_size")
	static function set_size(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_cocos_plist_metadata_texture_file_name")
	static function get_textureFileName(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_cocos_plist_metadata_texture_file_name")
	static function set_textureFileName(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract CocosPlistMetadata(cpp.Star<cpp.Void>) {
	public var format(get, set):Int;

	inline function get_format():Int return CocosPlistMetadata_Ffi.get_format(this);

	inline function set_format(value:Int):Int { CocosPlistMetadata_Ffi.set_format(this, value); return value; }
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
		CocosPlistMetadata_Ffi.set_size(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		CocosPlistMetadata_Ffi.set_textureFileName(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
