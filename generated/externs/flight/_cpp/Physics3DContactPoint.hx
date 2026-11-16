package flight._cpp;

private extern class Physics3DContactPoint_Ffi {
	@:native("flight_get_physics3_dcontact_point_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_feature_id") static function get_featureId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_physics3_dcontact_point_feature_id") static function set_featureId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_physics3_dcontact_point_r_ax") static function get_rAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_r_ax") static function set_rAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_r_ay") static function get_rAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_r_ay") static function set_rAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_r_az") static function get_rAz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_r_az") static function set_rAz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_r_bx") static function get_rBx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_r_bx") static function set_rBx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_r_by") static function get_rBy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_r_by") static function set_rBy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_point_r_bz") static function get_rBz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_point_r_bz") static function set_rBz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DContactPoint(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return Physics3DContactPoint_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Physics3DContactPoint_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Physics3DContactPoint_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Physics3DContactPoint_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return Physics3DContactPoint_Ffi.get_z(this);

	inline function set_z(value:Single):Single { Physics3DContactPoint_Ffi.set_z(this, value); return value; }
	public var depth(get, set):Single;

	inline function get_depth():Single return Physics3DContactPoint_Ffi.get_depth(this);

	inline function set_depth(value:Single):Single { Physics3DContactPoint_Ffi.set_depth(this, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return Physics3DContactPoint_Ffi.get_featureId(this);

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { Physics3DContactPoint_Ffi.set_featureId(this, value); return value; }
	public var rAx(get, set):Single;

	inline function get_rAx():Single return Physics3DContactPoint_Ffi.get_rAx(this);

	inline function set_rAx(value:Single):Single { Physics3DContactPoint_Ffi.set_rAx(this, value); return value; }
	public var rAy(get, set):Single;

	inline function get_rAy():Single return Physics3DContactPoint_Ffi.get_rAy(this);

	inline function set_rAy(value:Single):Single { Physics3DContactPoint_Ffi.set_rAy(this, value); return value; }
	public var rAz(get, set):Single;

	inline function get_rAz():Single return Physics3DContactPoint_Ffi.get_rAz(this);

	inline function set_rAz(value:Single):Single { Physics3DContactPoint_Ffi.set_rAz(this, value); return value; }
	public var rBx(get, set):Single;

	inline function get_rBx():Single return Physics3DContactPoint_Ffi.get_rBx(this);

	inline function set_rBx(value:Single):Single { Physics3DContactPoint_Ffi.set_rBx(this, value); return value; }
	public var rBy(get, set):Single;

	inline function get_rBy():Single return Physics3DContactPoint_Ffi.get_rBy(this);

	inline function set_rBy(value:Single):Single { Physics3DContactPoint_Ffi.set_rBy(this, value); return value; }
	public var rBz(get, set):Single;

	inline function get_rBz():Single return Physics3DContactPoint_Ffi.get_rBz(this);

	inline function set_rBz(value:Single):Single { Physics3DContactPoint_Ffi.set_rBz(this, value); return value; }
}
