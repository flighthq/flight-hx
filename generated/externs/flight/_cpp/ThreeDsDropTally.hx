package flight._cpp;

private extern class ThreeDsDropTally_Ffi {
	@:native("flight_get_three_ds_drop_tally_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_three_ds_drop_tally_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_three_ds_drop_tally_kind")
	static function get_kind(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_three_ds_drop_tally_kind")
	static function set_kind(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ThreeDsDropTally(cpp.Star<cpp.Void>) {
	public var count(get, set):Int;

	inline function get_count():Int return ThreeDsDropTally_Ffi.get_count(this);

	inline function set_count(value:Int):Int { ThreeDsDropTally_Ffi.set_count(this, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = ThreeDsDropTally_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsDropTally_Ffi.set_kind(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
