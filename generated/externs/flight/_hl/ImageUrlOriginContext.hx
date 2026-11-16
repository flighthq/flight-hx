package flight._hl;

private extern class ImageUrlOriginContext_Ffi {
	@:hlNative("flight", "flight_field_get_image_url_origin_context_href")
	static function get_href(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_image_url_origin_context_href")
	static function set_href(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_image_url_origin_context_origin")
	static function get_origin(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_image_url_origin_context_origin")
	static function set_origin(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ImageUrlOriginContext(hl.Bytes) {
	public var href(get, set):String;
	inline function get_href():String {
		final bytes = ImageUrlOriginContext_Ffi.get_href(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_href(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ImageUrlOriginContext_Ffi.set_href(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var origin(get, set):String;
	inline function get_origin():String {
		final bytes = ImageUrlOriginContext_Ffi.get_origin(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_origin(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ImageUrlOriginContext_Ffi.set_origin(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
