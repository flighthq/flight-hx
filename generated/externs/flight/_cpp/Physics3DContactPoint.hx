package flight._cpp;

private extern class Physics3DContactPoint_Ffi {
	@:native("flight_get_physics3_dcontact_point_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_feature_id") static function get_featureId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_physics3_dcontact_point_feature_id") static function set_featureId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_physics3_dcontact_point_r_ax") static function get_rAx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_r_ax") static function set_rAx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_r_ay") static function get_rAy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_r_ay") static function set_rAy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_r_az") static function get_rAz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_r_az") static function set_rAz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_r_bx") static function get_rBx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_r_bx") static function set_rBx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_r_by") static function get_rBy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_r_by") static function set_rBy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_r_bz") static function get_rBz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_point_r_bz") static function set_rBz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DContactPoint(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return Physics3DContactPoint_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Physics3DContactPoint_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Physics3DContactPoint_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Physics3DContactPoint_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return Physics3DContactPoint_Ffi.get_z(this);

	inline function set_z(value:Float):Float { Physics3DContactPoint_Ffi.set_z(this, value); return value; }
	public var depth(get, set):Float;

	inline function get_depth():Float return Physics3DContactPoint_Ffi.get_depth(this);

	inline function set_depth(value:Float):Float { Physics3DContactPoint_Ffi.set_depth(this, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return Physics3DContactPoint_Ffi.get_featureId(this);

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { Physics3DContactPoint_Ffi.set_featureId(this, value); return value; }
	public var rAx(get, set):Float;

	inline function get_rAx():Float return Physics3DContactPoint_Ffi.get_rAx(this);

	inline function set_rAx(value:Float):Float { Physics3DContactPoint_Ffi.set_rAx(this, value); return value; }
	public var rAy(get, set):Float;

	inline function get_rAy():Float return Physics3DContactPoint_Ffi.get_rAy(this);

	inline function set_rAy(value:Float):Float { Physics3DContactPoint_Ffi.set_rAy(this, value); return value; }
	public var rAz(get, set):Float;

	inline function get_rAz():Float return Physics3DContactPoint_Ffi.get_rAz(this);

	inline function set_rAz(value:Float):Float { Physics3DContactPoint_Ffi.set_rAz(this, value); return value; }
	public var rBx(get, set):Float;

	inline function get_rBx():Float return Physics3DContactPoint_Ffi.get_rBx(this);

	inline function set_rBx(value:Float):Float { Physics3DContactPoint_Ffi.set_rBx(this, value); return value; }
	public var rBy(get, set):Float;

	inline function get_rBy():Float return Physics3DContactPoint_Ffi.get_rBy(this);

	inline function set_rBy(value:Float):Float { Physics3DContactPoint_Ffi.set_rBy(this, value); return value; }
	public var rBz(get, set):Float;

	inline function get_rBz():Float return Physics3DContactPoint_Ffi.get_rBz(this);

	inline function set_rBz(value:Float):Float { Physics3DContactPoint_Ffi.set_rBz(this, value); return value; }
}
