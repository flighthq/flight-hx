package flight._cpp;

private extern class ExternalImageResourceReference_Ffi {
	@:native("flight_field_get_external_image_resource_reference_uri")
	static function get_uri(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_external_image_resource_reference_uri")
	static function set_uri(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ExternalImageResourceReference(cpp.Star<cpp.Void>) {
	public var uri(get, set):String;
	inline function get_uri():String {
		final bytes = ExternalImageResourceReference_Ffi.get_uri(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_uri(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ExternalImageResourceReference_Ffi.set_uri(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
