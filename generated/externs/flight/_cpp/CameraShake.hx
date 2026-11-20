package flight._cpp;

private extern class CameraShake_Ffi {
	@:native("flight_get_camera_shake_trauma") static function get_trauma(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_trauma") static function set_trauma(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_decay") static function get_decay(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_decay") static function set_decay(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_frequency") static function get_frequency(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_frequency") static function set_frequency(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_translation_amplitude") static function get_translationAmplitude(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_translation_amplitude") static function set_translationAmplitude(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_rotation_amplitude") static function get_rotationAmplitude(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_rotation_amplitude") static function set_rotationAmplitude(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_camera_shake_time") static function get_time(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_camera_shake_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CameraShake(cpp.Star<cpp.Void>) {
	public var trauma(get, set):Float;

	inline function get_trauma():Float return CameraShake_Ffi.get_trauma(this);

	inline function set_trauma(value:Float):Float { CameraShake_Ffi.set_trauma(this, value); return value; }
	public var decay(get, set):Float;

	inline function get_decay():Float return CameraShake_Ffi.get_decay(this);

	inline function set_decay(value:Float):Float { CameraShake_Ffi.set_decay(this, value); return value; }
	public var frequency(get, set):Float;

	inline function get_frequency():Float return CameraShake_Ffi.get_frequency(this);

	inline function set_frequency(value:Float):Float { CameraShake_Ffi.set_frequency(this, value); return value; }
	public var translationAmplitude(get, set):Float;

	inline function get_translationAmplitude():Float return CameraShake_Ffi.get_translationAmplitude(this);

	inline function set_translationAmplitude(value:Float):Float { CameraShake_Ffi.set_translationAmplitude(this, value); return value; }
	public var rotationAmplitude(get, set):Float;

	inline function get_rotationAmplitude():Float return CameraShake_Ffi.get_rotationAmplitude(this);

	inline function set_rotationAmplitude(value:Float):Float { CameraShake_Ffi.set_rotationAmplitude(this, value); return value; }
	public var time(get, set):Float;

	inline function get_time():Float return CameraShake_Ffi.get_time(this);

	inline function set_time(value:Float):Float { CameraShake_Ffi.set_time(this, value); return value; }
}
