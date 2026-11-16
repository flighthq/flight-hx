package flight._cpp;

private extern class TweenManagerData_Ffi {
	@:native("flight_field_get_tween_manager_data___brand")
	static function get_brand(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_tween_manager_data___brand")
	static function set_brand(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract TweenManagerData(cpp.Star<cpp.Void>) {
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
		TweenManagerData_Ffi.set_brand(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
