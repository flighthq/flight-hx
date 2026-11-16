package flight._hl;

private extern class GltfAnimationTarget_Ffi {
	@:hlNative("flight", "flight_field_get_gltf_animation_target_path")
	static function get_path(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_gltf_animation_target_path")
	static function set_path(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GltfAnimationTarget(hl.Bytes) {
	public var path(get, set):String;
	inline function get_path():String {
		final bytes = GltfAnimationTarget_Ffi.get_path(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_path(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfAnimationTarget_Ffi.set_path(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
