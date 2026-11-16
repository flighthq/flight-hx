package flight._hl;

private extern class ObjFeatureDirectives_Ffi {
	@:hlNative("flight", "flight_field_get_obj_feature_directives_feature")
	static function get_feature(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_obj_feature_directives_feature")
	static function set_feature(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ObjFeatureDirectives(hl.Bytes) {
	public var feature(get, set):String;
	inline function get_feature():String {
		final bytes = ObjFeatureDirectives_Ffi.get_feature(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_feature(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ObjFeatureDirectives_Ffi.set_feature(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
