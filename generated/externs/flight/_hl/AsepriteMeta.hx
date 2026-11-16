package flight._hl;

private extern class AsepriteMeta_Ffi {
	@:hlNative("flight", "flight_field_get_aseprite_meta_app")
	static function get_app(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_aseprite_meta_app")
	static function set_app(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_aseprite_meta_format")
	static function get_format(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_aseprite_meta_format")
	static function set_format(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_aseprite_meta_image")
	static function get_image(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_aseprite_meta_image")
	static function set_image(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_aseprite_meta_version")
	static function get_version(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_aseprite_meta_version")
	static function set_version(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract AsepriteMeta(hl.Bytes) {
	public var app(get, set):String;
	inline function get_app():String {
		final bytes = AsepriteMeta_Ffi.get_app(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_app(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AsepriteMeta_Ffi.set_app(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var format(get, set):String;
	inline function get_format():String {
		final bytes = AsepriteMeta_Ffi.get_format(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_format(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AsepriteMeta_Ffi.set_format(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var image(get, set):String;
	inline function get_image():String {
		final bytes = AsepriteMeta_Ffi.get_image(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_image(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AsepriteMeta_Ffi.set_image(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var version(get, set):String;
	inline function get_version():String {
		final bytes = AsepriteMeta_Ffi.get_version(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_version(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AsepriteMeta_Ffi.set_version(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
