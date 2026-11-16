package flight._hl;

private extern class ColladaDecodedSkin_Ffi {
	@:hlNative("flight", "flight_field_get_collada_decoded_skin_controller_id")
	static function get_controllerId(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_decoded_skin_controller_id")
	static function set_controllerId(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_collada_decoded_skin_geometry_ref")
	static function get_geometryRef(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_decoded_skin_geometry_ref")
	static function set_geometryRef(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaDecodedSkin(hl.Bytes) {
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
		ColladaDecodedSkin_Ffi.set_controllerId(this, bytes.getData().bytes, bytes.length);
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
		ColladaDecodedSkin_Ffi.set_geometryRef(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
