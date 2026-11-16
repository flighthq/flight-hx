package flight._cpp;

private extern class GltfBuffer_Ffi {
	@:native("flight_get_gltf_buffer_byte_length") static function get_byteLength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_buffer_byte_length") static function set_byteLength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfBuffer(cpp.Star<cpp.Void>) {
	public var byteLength(get, set):Single;

	inline function get_byteLength():Single return GltfBuffer_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Single):Single { GltfBuffer_Ffi.set_byteLength(this, value); return value; }
}
