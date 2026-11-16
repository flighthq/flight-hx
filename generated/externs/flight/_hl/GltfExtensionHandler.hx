package flight._hl;

private extern class GltfExtensionHandler_Ffi {
	@:hlNative("flight", "flight_field_get_gltf_extension_handler_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_gltf_extension_handler_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GltfExtensionHandler(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = GltfExtensionHandler_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfExtensionHandler_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
