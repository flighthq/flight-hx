package flight._cpp;

private extern class ColladaElementCount_Ffi {
	@:native("flight_field_get_collada_element_count_feature")
	static function get_feature(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_element_count_feature")
	static function set_feature(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_collada_element_count_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_element_count_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColladaElementCount(cpp.Star<cpp.Void>) {
	public var feature(get, set):String;
	inline function get_feature():String {
		final bytes = ColladaElementCount_Ffi.get_feature(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_feature(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaElementCount_Ffi.set_feature(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var count(get, set):Int;

	inline function get_count():Int return ColladaElementCount_Ffi.get_count(this);

	inline function set_count(value:Int):Int { ColladaElementCount_Ffi.set_count(this, value); return value; }
}
