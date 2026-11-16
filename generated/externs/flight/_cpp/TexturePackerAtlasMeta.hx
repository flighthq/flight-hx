package flight._cpp;

private extern class TexturePackerAtlasMeta_Ffi {
	@:native("flight_field_get_texture_packer_atlas_meta_app")
	static function get_app(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_packer_atlas_meta_app")
	static function set_app(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_texture_packer_atlas_meta_format")
	static function get_format(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_packer_atlas_meta_format")
	static function set_format(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_texture_packer_atlas_meta_image")
	static function get_image(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_packer_atlas_meta_image")
	static function set_image(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_texture_packer_atlas_meta_version")
	static function get_version(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_packer_atlas_meta_version")
	static function set_version(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract TexturePackerAtlasMeta(cpp.Star<cpp.Void>) {
	public var app(get, set):String;
	inline function get_app():String {
		final bytes = TexturePackerAtlasMeta_Ffi.get_app(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_app(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasMeta_Ffi.set_app(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var format(get, set):String;
	inline function get_format():String {
		final bytes = TexturePackerAtlasMeta_Ffi.get_format(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_format(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasMeta_Ffi.set_format(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var image(get, set):String;
	inline function get_image():String {
		final bytes = TexturePackerAtlasMeta_Ffi.get_image(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_image(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasMeta_Ffi.set_image(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var version(get, set):String;
	inline function get_version():String {
		final bytes = TexturePackerAtlasMeta_Ffi.get_version(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_version(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasMeta_Ffi.set_version(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
