package flight._hl;

private extern class TweenManagerData_Ffi {
	@:hlNative("flight", "flight_field_get_tween_manager_data___brand")
	static function get_brand(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_tween_manager_data___brand")
	static function set_brand(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TweenManagerData(hl.Bytes) {
	public var brand(get, set):String;
	inline function get_brand():String {
		final bytes = TweenManagerData_Ffi.get_brand(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_brand(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TweenManagerData_Ffi.set_brand(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
