package flight._cpp;

private extern class ColladaFeatureElements_Ffi {
	@:native("flight_field_get_collada_feature_elements_feature")
	static function get_feature(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_feature_elements_feature")
	static function set_feature(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ColladaFeatureElements(cpp.Star<cpp.Void>) {
	public var feature(get, set):String;
	inline function get_feature():String {
		final bytes = ColladaFeatureElements_Ffi.get_feature(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_feature(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaFeatureElements_Ffi.set_feature(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
