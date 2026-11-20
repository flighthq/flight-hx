package flight._cpp;

private extern class GltfOrthographicCamera_Ffi {
	@:native("flight_get_gltf_orthographic_camera_xmag") static function get_xmag(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_orthographic_camera_xmag") static function set_xmag(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_gltf_orthographic_camera_ymag") static function get_ymag(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_orthographic_camera_ymag") static function set_ymag(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_gltf_orthographic_camera_zfar") static function get_zfar(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_orthographic_camera_zfar") static function set_zfar(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_gltf_orthographic_camera_znear") static function get_znear(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_orthographic_camera_znear") static function set_znear(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfOrthographicCamera(cpp.Star<cpp.Void>) {
	public var xmag(get, set):Float;

	inline function get_xmag():Float return GltfOrthographicCamera_Ffi.get_xmag(this);

	inline function set_xmag(value:Float):Float { GltfOrthographicCamera_Ffi.set_xmag(this, value); return value; }
	public var ymag(get, set):Float;

	inline function get_ymag():Float return GltfOrthographicCamera_Ffi.get_ymag(this);

	inline function set_ymag(value:Float):Float { GltfOrthographicCamera_Ffi.set_ymag(this, value); return value; }
	public var zfar(get, set):Float;

	inline function get_zfar():Float return GltfOrthographicCamera_Ffi.get_zfar(this);

	inline function set_zfar(value:Float):Float { GltfOrthographicCamera_Ffi.set_zfar(this, value); return value; }
	public var znear(get, set):Float;

	inline function get_znear():Float return GltfOrthographicCamera_Ffi.get_znear(this);

	inline function set_znear(value:Float):Float { GltfOrthographicCamera_Ffi.set_znear(this, value); return value; }
}
