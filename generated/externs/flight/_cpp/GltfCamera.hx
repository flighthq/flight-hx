package flight._cpp;

private extern class GltfCamera_Ffi {
	@:native("flight_field_get_gltf_camera_type")
	static function get_type(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_gltf_camera_type")
	static function set_type(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract GltfCamera(cpp.Star<cpp.Void>) {
	public var type(get, set):String;
	inline function get_type():String {
		final bytes = GltfCamera_Ffi.get_type(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_type(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfCamera_Ffi.set_type(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
