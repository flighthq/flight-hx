package flight._cpp;

private extern class GltfBuffer_Ffi {
	@:native("flight_get_gltf_buffer_byte_length") static function get_byteLength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_buffer_byte_length") static function set_byteLength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfBuffer(cpp.Star<cpp.Void>) {
	public var byteLength(get, set):Float;

	inline function get_byteLength():Float return GltfBuffer_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Float):Float { GltfBuffer_Ffi.set_byteLength(this, value); return value; }
}
