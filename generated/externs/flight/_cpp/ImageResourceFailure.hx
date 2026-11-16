package flight._cpp;

private extern class ImageResourceFailure_Ffi {
	@:native("flight_field_get_image_resource_failure_message")
	static function get_message(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_image_resource_failure_message")
	static function set_message(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ImageResourceFailure(cpp.Star<cpp.Void>) {
	public var message(get, set):String;
	inline function get_message():String {
		final bytes = ImageResourceFailure_Ffi.get_message(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_message(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ImageResourceFailure_Ffi.set_message(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
