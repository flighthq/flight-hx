package flight._cpp;

private extern class CameraShakeOffset_Ffi {
	@:native("flight_get_camera_shake_offset_rotation_x") static function get_rotationX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_offset_rotation_x") static function set_rotationX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_offset_rotation_y") static function get_rotationY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_offset_rotation_y") static function set_rotationY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_offset_rotation_z") static function get_rotationZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_offset_rotation_z") static function set_rotationZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_offset_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_offset_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_offset_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_offset_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_offset_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_offset_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CameraShakeOffset(cpp.Star<cpp.Void>) {
	public var rotationX(get, set):Float;

	inline function get_rotationX():Float return CameraShakeOffset_Ffi.get_rotationX(this);

	inline function set_rotationX(value:Float):Float { CameraShakeOffset_Ffi.set_rotationX(this, value); return value; }
	public var rotationY(get, set):Float;

	inline function get_rotationY():Float return CameraShakeOffset_Ffi.get_rotationY(this);

	inline function set_rotationY(value:Float):Float { CameraShakeOffset_Ffi.set_rotationY(this, value); return value; }
	public var rotationZ(get, set):Float;

	inline function get_rotationZ():Float return CameraShakeOffset_Ffi.get_rotationZ(this);

	inline function set_rotationZ(value:Float):Float { CameraShakeOffset_Ffi.set_rotationZ(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return CameraShakeOffset_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CameraShakeOffset_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CameraShakeOffset_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CameraShakeOffset_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return CameraShakeOffset_Ffi.get_z(this);

	inline function set_z(value:Float):Float { CameraShakeOffset_Ffi.set_z(this, value); return value; }
}
