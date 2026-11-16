package flight._cpp;

private extern class Scene3DFormatFeatureRequirements_Ffi {
	@:native("flight_field_get_scene3_dformat_feature_requirements_feature")
	static function get_feature(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_scene3_dformat_feature_requirements_feature")
	static function set_feature(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract Scene3DFormatFeatureRequirements(cpp.Star<cpp.Void>) {
	public var feature(get, set):String;
	inline function get_feature():String {
		final bytes = Scene3DFormatFeatureRequirements_Ffi.get_feature(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_feature(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Scene3DFormatFeatureRequirements_Ffi.set_feature(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
