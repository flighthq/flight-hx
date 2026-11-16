package flight._cpp;

private extern class GltfOrthographicCamera_Ffi {
	@:native("flight_get_gltf_orthographic_camera_xmag") static function get_xmag(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_orthographic_camera_xmag") static function set_xmag(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_gltf_orthographic_camera_ymag") static function get_ymag(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_orthographic_camera_ymag") static function set_ymag(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_gltf_orthographic_camera_zfar") static function get_zfar(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_orthographic_camera_zfar") static function set_zfar(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_gltf_orthographic_camera_znear") static function get_znear(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_orthographic_camera_znear") static function set_znear(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfOrthographicCamera(cpp.Star<cpp.Void>) {
	public var xmag(get, set):Single;

	inline function get_xmag():Single return GltfOrthographicCamera_Ffi.get_xmag(this);

	inline function set_xmag(value:Single):Single { GltfOrthographicCamera_Ffi.set_xmag(this, value); return value; }
	public var ymag(get, set):Single;

	inline function get_ymag():Single return GltfOrthographicCamera_Ffi.get_ymag(this);

	inline function set_ymag(value:Single):Single { GltfOrthographicCamera_Ffi.set_ymag(this, value); return value; }
	public var zfar(get, set):Single;

	inline function get_zfar():Single return GltfOrthographicCamera_Ffi.get_zfar(this);

	inline function set_zfar(value:Single):Single { GltfOrthographicCamera_Ffi.set_zfar(this, value); return value; }
	public var znear(get, set):Single;

	inline function get_znear():Single return GltfOrthographicCamera_Ffi.get_znear(this);

	inline function set_znear(value:Single):Single { GltfOrthographicCamera_Ffi.set_znear(this, value); return value; }
}
