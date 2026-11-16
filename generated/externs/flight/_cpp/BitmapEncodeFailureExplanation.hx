package flight._cpp;

private extern class BitmapEncodeFailureExplanation_Ffi {
	@:native("flight_field_get_bitmap_encode_failure_explanation_reason")
	static function get_reason(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_bitmap_encode_failure_explanation_reason")
	static function set_reason(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract BitmapEncodeFailureExplanation(cpp.Star<cpp.Void>) {
	public var reason(get, set):String;
	inline function get_reason():String {
		final bytes = BitmapEncodeFailureExplanation_Ffi.get_reason(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_reason(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		BitmapEncodeFailureExplanation_Ffi.set_reason(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
