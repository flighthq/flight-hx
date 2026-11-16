package flight._cpp;

private extern class ColladaDecodedSkin_Ffi {
	@:native("flight_field_get_collada_decoded_skin_controller_id")
	static function get_controllerId(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_decoded_skin_controller_id")
	static function set_controllerId(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_collada_decoded_skin_geometry_ref")
	static function get_geometryRef(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_decoded_skin_geometry_ref")
	static function set_geometryRef(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ColladaDecodedSkin(cpp.Star<cpp.Void>) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String {
		final bytes = ColladaDecodedSkin_Ffi.get_controllerId(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_controllerId(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDecodedSkin_Ffi.set_controllerId(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var geometryRef(get, set):String;
	inline function get_geometryRef():String {
		final bytes = ColladaDecodedSkin_Ffi.get_geometryRef(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_geometryRef(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDecodedSkin_Ffi.set_geometryRef(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
