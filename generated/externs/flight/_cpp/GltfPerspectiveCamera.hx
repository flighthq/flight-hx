package flight._cpp;

private extern class GltfPerspectiveCamera_Ffi {
	@:native("flight_get_gltf_perspective_camera_yfov") static function get_yfov(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_perspective_camera_yfov") static function set_yfov(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_gltf_perspective_camera_znear") static function get_znear(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_perspective_camera_znear") static function set_znear(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfPerspectiveCamera(cpp.Star<cpp.Void>) {
	public var yfov(get, set):Float;

	inline function get_yfov():Float return GltfPerspectiveCamera_Ffi.get_yfov(this);

	inline function set_yfov(value:Float):Float { GltfPerspectiveCamera_Ffi.set_yfov(this, value); return value; }
	public var znear(get, set):Float;

	inline function get_znear():Float return GltfPerspectiveCamera_Ffi.get_znear(this);

	inline function set_znear(value:Float):Float { GltfPerspectiveCamera_Ffi.set_znear(this, value); return value; }
}
