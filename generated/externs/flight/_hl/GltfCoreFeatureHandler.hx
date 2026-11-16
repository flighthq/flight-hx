package flight._hl;

private extern class GltfCoreFeatureHandler_Ffi {
	@:hlNative("flight", "flight_field_get_gltf_core_feature_handler_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_gltf_core_feature_handler_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GltfCoreFeatureHandler(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = GltfCoreFeatureHandler_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfCoreFeatureHandler_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
