package flight._hl;

private extern class GltfPunctualLight_Ffi {
	@:hlNative("flight", "flight_field_get_gltf_punctual_light_type")
	static function get_type(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_gltf_punctual_light_type")
	static function set_type(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GltfPunctualLight(hl.Bytes) {
	public var type(get, set):String;
	inline function get_type():String {
		final bytes = GltfPunctualLight_Ffi.get_type(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_type(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfPunctualLight_Ffi.set_type(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
