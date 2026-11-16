package flight._cpp;

private extern class GltfAccessor_Ffi {
	@:native("flight_get_gltf_accessor_count") static function get_count(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_accessor_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_gltf_accessor_type")
	static function get_type(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_gltf_accessor_type")
	static function set_type(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract GltfAccessor(cpp.Star<cpp.Void>) {
	public var count(get, set):Single;

	inline function get_count():Single return GltfAccessor_Ffi.get_count(this);

	inline function set_count(value:Single):Single { GltfAccessor_Ffi.set_count(this, value); return value; }
	public var type(get, set):String;
	inline function get_type():String {
		final bytes = GltfAccessor_Ffi.get_type(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_type(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GltfAccessor_Ffi.set_type(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
