package flight._cpp;

private extern class GltfAnimationTarget_Ffi {
	@:native("flight_field_get_gltf_animation_target_path")
	static function get_path(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_gltf_animation_target_path")
	static function set_path(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract GltfAnimationTarget(cpp.Star<cpp.Void>) {
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
		GltfAnimationTarget_Ffi.set_path(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
