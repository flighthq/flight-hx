package flight._cpp;

private extern class Physics3DJointFrames_Ffi {
	@:native("flight_get_physics3_djoint_frames_local_rotation_ax") static function get_localRotationAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_ax") static function set_localRotationAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_frames_local_rotation_ay") static function get_localRotationAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_ay") static function set_localRotationAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_frames_local_rotation_az") static function get_localRotationAz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_az") static function set_localRotationAz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_frames_local_rotation_aw") static function get_localRotationAw(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_aw") static function set_localRotationAw(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_frames_local_rotation_bx") static function get_localRotationBx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_bx") static function set_localRotationBx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_frames_local_rotation_by") static function get_localRotationBy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_by") static function set_localRotationBy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_frames_local_rotation_bz") static function get_localRotationBz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_bz") static function set_localRotationBz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_frames_local_rotation_bw") static function get_localRotationBw(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_frames_local_rotation_bw") static function set_localRotationBw(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DJointFrames(cpp.Star<cpp.Void>) {
	public var localRotationAx(get, set):Single;

	inline function get_localRotationAx():Single return Physics3DJointFrames_Ffi.get_localRotationAx(this);

	inline function set_localRotationAx(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationAx(this, value); return value; }
	public var localRotationAy(get, set):Single;

	inline function get_localRotationAy():Single return Physics3DJointFrames_Ffi.get_localRotationAy(this);

	inline function set_localRotationAy(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationAy(this, value); return value; }
	public var localRotationAz(get, set):Single;

	inline function get_localRotationAz():Single return Physics3DJointFrames_Ffi.get_localRotationAz(this);

	inline function set_localRotationAz(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationAz(this, value); return value; }
	public var localRotationAw(get, set):Single;

	inline function get_localRotationAw():Single return Physics3DJointFrames_Ffi.get_localRotationAw(this);

	inline function set_localRotationAw(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationAw(this, value); return value; }
	public var localRotationBx(get, set):Single;

	inline function get_localRotationBx():Single return Physics3DJointFrames_Ffi.get_localRotationBx(this);

	inline function set_localRotationBx(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationBx(this, value); return value; }
	public var localRotationBy(get, set):Single;

	inline function get_localRotationBy():Single return Physics3DJointFrames_Ffi.get_localRotationBy(this);

	inline function set_localRotationBy(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationBy(this, value); return value; }
	public var localRotationBz(get, set):Single;

	inline function get_localRotationBz():Single return Physics3DJointFrames_Ffi.get_localRotationBz(this);

	inline function set_localRotationBz(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationBz(this, value); return value; }
	public var localRotationBw(get, set):Single;

	inline function get_localRotationBw():Single return Physics3DJointFrames_Ffi.get_localRotationBw(this);

	inline function set_localRotationBw(value:Single):Single { Physics3DJointFrames_Ffi.set_localRotationBw(this, value); return value; }
}
