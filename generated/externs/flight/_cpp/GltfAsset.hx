package flight._cpp;

private extern class GltfAsset_Ffi {
	@:native("flight_field_get_gltf_asset_version")
	static function get_version(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_gltf_asset_version")
	static function set_version(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract GltfAsset(cpp.Star<cpp.Void>) {
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
		GltfAsset_Ffi.set_version(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
