package flight._hl;

private extern class GltfAsset_Ffi {
	@:hlNative("flight", "flight_field_get_gltf_asset_version")
	static function get_version(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_gltf_asset_version")
	static function set_version(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GltfAsset(hl.Bytes) {
	public var version(get, set):String;
	inline function get_version():String {
		final bytes = GltfAsset_Ffi.get_version(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_version(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfAsset_Ffi.set_version(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
