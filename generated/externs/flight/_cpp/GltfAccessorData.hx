package flight._cpp;

private extern class GltfAccessorData_Ffi {
	@:native("flight_get_gltf_accessor_data_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_gltf_accessor_data_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GltfAccessorData(cpp.Star<cpp.Void>) {
	public var count(get, set):Int;

	inline function get_count():Int return GltfAccessorData_Ffi.get_count(this);

	inline function set_count(value:Int):Int { GltfAccessorData_Ffi.set_count(this, value); return value; }
}
