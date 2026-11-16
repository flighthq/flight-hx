package flight._cpp;

private extern class GltfBufferView_Ffi {
	@:native("flight_get_gltf_buffer_view_buffer") static function get_buffer(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_buffer_view_buffer") static function set_buffer(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_gltf_buffer_view_byte_length") static function get_byteLength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_buffer_view_byte_length") static function set_byteLength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfBufferView(cpp.Star<cpp.Void>) {
	public var buffer(get, set):Single;

	inline function get_buffer():Single return GltfBufferView_Ffi.get_buffer(this);

	inline function set_buffer(value:Single):Single { GltfBufferView_Ffi.set_buffer(this, value); return value; }
	public var byteLength(get, set):Single;

	inline function get_byteLength():Single return GltfBufferView_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Single):Single { GltfBufferView_Ffi.set_byteLength(this, value); return value; }
}
