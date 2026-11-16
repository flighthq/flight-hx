package flight._cpp;

private extern class ColladaDecodedMorph_Ffi {
	@:native("flight_field_get_collada_decoded_morph_controller_id")
	static function get_controllerId(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_decoded_morph_controller_id")
	static function set_controllerId(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_collada_decoded_morph_base_geometry")
	static function get_baseGeometry(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_decoded_morph_base_geometry")
	static function set_baseGeometry(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ColladaDecodedMorph(cpp.Star<cpp.Void>) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String {
		final bytes = ColladaDecodedMorph_Ffi.get_controllerId(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_controllerId(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDecodedMorph_Ffi.set_controllerId(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var baseGeometry(get, set):String;
	inline function get_baseGeometry():String {
		final bytes = ColladaDecodedMorph_Ffi.get_baseGeometry(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_baseGeometry(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDecodedMorph_Ffi.set_baseGeometry(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
