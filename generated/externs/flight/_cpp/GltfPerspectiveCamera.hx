package flight._cpp;

private extern class GltfPerspectiveCamera_Ffi {
	@:native("flight_get_gltf_perspective_camera_yfov") static function get_yfov(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_perspective_camera_yfov") static function set_yfov(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_gltf_perspective_camera_znear") static function get_znear(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_perspective_camera_znear") static function set_znear(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfPerspectiveCamera(cpp.Star<cpp.Void>) {
	public var yfov(get, set):Single;

	inline function get_yfov():Single return GltfPerspectiveCamera_Ffi.get_yfov(this);

	inline function set_yfov(value:Single):Single { GltfPerspectiveCamera_Ffi.set_yfov(this, value); return value; }
	public var znear(get, set):Single;

	inline function get_znear():Single return GltfPerspectiveCamera_Ffi.get_znear(this);

	inline function set_znear(value:Single):Single { GltfPerspectiveCamera_Ffi.set_znear(this, value); return value; }
}
