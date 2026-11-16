package flight._cpp;

private extern class CameraShakeOffset_Ffi {
	@:native("flight_get_camera_shake_offset_rotation_x") static function get_rotationX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera_shake_offset_rotation_x") static function set_rotationX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera_shake_offset_rotation_y") static function get_rotationY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera_shake_offset_rotation_y") static function set_rotationY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera_shake_offset_rotation_z") static function get_rotationZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera_shake_offset_rotation_z") static function set_rotationZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera_shake_offset_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera_shake_offset_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera_shake_offset_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera_shake_offset_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera_shake_offset_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera_shake_offset_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CameraShakeOffset(cpp.Star<cpp.Void>) {
	public var rotationX(get, set):Single;

	inline function get_rotationX():Single return CameraShakeOffset_Ffi.get_rotationX(this);

	inline function set_rotationX(value:Single):Single { CameraShakeOffset_Ffi.set_rotationX(this, value); return value; }
	public var rotationY(get, set):Single;

	inline function get_rotationY():Single return CameraShakeOffset_Ffi.get_rotationY(this);

	inline function set_rotationY(value:Single):Single { CameraShakeOffset_Ffi.set_rotationY(this, value); return value; }
	public var rotationZ(get, set):Single;

	inline function get_rotationZ():Single return CameraShakeOffset_Ffi.get_rotationZ(this);

	inline function set_rotationZ(value:Single):Single { CameraShakeOffset_Ffi.set_rotationZ(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return CameraShakeOffset_Ffi.get_x(this);

	inline function set_x(value:Single):Single { CameraShakeOffset_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return CameraShakeOffset_Ffi.get_y(this);

	inline function set_y(value:Single):Single { CameraShakeOffset_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return CameraShakeOffset_Ffi.get_z(this);

	inline function set_z(value:Single):Single { CameraShakeOffset_Ffi.set_z(this, value); return value; }
}
