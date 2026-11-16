package flight._cpp;

private extern class ImageUrlOriginContext_Ffi {
	@:native("flight_field_get_image_url_origin_context_href")
	static function get_href(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_image_url_origin_context_href")
	static function set_href(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_image_url_origin_context_origin")
	static function get_origin(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_image_url_origin_context_origin")
	static function set_origin(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ImageUrlOriginContext(cpp.Star<cpp.Void>) {
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
		ImageUrlOriginContext_Ffi.set_href(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		ImageUrlOriginContext_Ffi.set_origin(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
