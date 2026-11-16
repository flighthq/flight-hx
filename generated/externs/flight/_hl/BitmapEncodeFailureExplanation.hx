package flight._hl;

private extern class BitmapEncodeFailureExplanation_Ffi {
	@:hlNative("flight", "flight_field_get_bitmap_encode_failure_explanation_reason")
	static function get_reason(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_bitmap_encode_failure_explanation_reason")
	static function set_reason(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract BitmapEncodeFailureExplanation(hl.Bytes) {
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
		BitmapEncodeFailureExplanation_Ffi.set_reason(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
