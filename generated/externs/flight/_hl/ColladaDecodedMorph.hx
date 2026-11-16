package flight._hl;

private extern class ColladaDecodedMorph_Ffi {
	@:hlNative("flight", "flight_field_get_collada_decoded_morph_controller_id")
	static function get_controllerId(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_decoded_morph_controller_id")
	static function set_controllerId(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_collada_decoded_morph_base_geometry")
	static function get_baseGeometry(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_decoded_morph_base_geometry")
	static function set_baseGeometry(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaDecodedMorph(hl.Bytes) {
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
		ColladaDecodedMorph_Ffi.set_controllerId(this, bytes.getData().bytes, bytes.length);
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
		ColladaDecodedMorph_Ffi.set_baseGeometry(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
