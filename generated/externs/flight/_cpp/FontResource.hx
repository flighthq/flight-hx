package flight._cpp;

private extern class FontResource_Ffi {
	@:native("flight_field_get_font_resource_family")
	static function get_family(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_font_resource_family")
	static function set_family(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract FontResource(cpp.Star<cpp.Void>) {
	public var family(get, set):String;
	inline function get_family():String {
		final bytes = FontResource_Ffi.get_family(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_family(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		FontResource_Ffi.set_family(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
