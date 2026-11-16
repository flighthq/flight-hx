package flight._cpp;

private extern class Physics2DContactPoint_Ffi {
	@:native("flight_get_physics2_dcontact_point_bias") static function get_bias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_bias") static function set_bias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_feature_id") static function get_featureId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_physics2_dcontact_point_feature_id") static function set_featureId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_physics2_dcontact_point_normal_impulse") static function get_normalImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_normal_impulse") static function set_normalImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_normal_mass") static function get_normalMass(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_normal_mass") static function set_normalMass(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_r_ax") static function get_rAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_r_ax") static function set_rAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_r_ay") static function get_rAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_r_ay") static function set_rAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_r_bx") static function get_rBx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_r_bx") static function set_rBx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_r_by") static function get_rBy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_r_by") static function set_rBy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_tangent_impulse") static function get_tangentImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_tangent_impulse") static function set_tangentImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_tangent_mass") static function get_tangentMass(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_tangent_mass") static function set_tangentMass(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dcontact_point_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dcontact_point_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DContactPoint(cpp.Star<cpp.Void>) {
	public var bias(get, set):Single;

	inline function get_bias():Single return Physics2DContactPoint_Ffi.get_bias(this);

	inline function set_bias(value:Single):Single { Physics2DContactPoint_Ffi.set_bias(this, value); return value; }
	public var depth(get, set):Single;

	inline function get_depth():Single return Physics2DContactPoint_Ffi.get_depth(this);

	inline function set_depth(value:Single):Single { Physics2DContactPoint_Ffi.set_depth(this, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return Physics2DContactPoint_Ffi.get_featureId(this);

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { Physics2DContactPoint_Ffi.set_featureId(this, value); return value; }
	public var normalImpulse(get, set):Single;

	inline function get_normalImpulse():Single return Physics2DContactPoint_Ffi.get_normalImpulse(this);

	inline function set_normalImpulse(value:Single):Single { Physics2DContactPoint_Ffi.set_normalImpulse(this, value); return value; }
	public var normalMass(get, set):Single;

	inline function get_normalMass():Single return Physics2DContactPoint_Ffi.get_normalMass(this);

	inline function set_normalMass(value:Single):Single { Physics2DContactPoint_Ffi.set_normalMass(this, value); return value; }
	public var rAx(get, set):Single;

	inline function get_rAx():Single return Physics2DContactPoint_Ffi.get_rAx(this);

	inline function set_rAx(value:Single):Single { Physics2DContactPoint_Ffi.set_rAx(this, value); return value; }
	public var rAy(get, set):Single;

	inline function get_rAy():Single return Physics2DContactPoint_Ffi.get_rAy(this);

	inline function set_rAy(value:Single):Single { Physics2DContactPoint_Ffi.set_rAy(this, value); return value; }
	public var rBx(get, set):Single;

	inline function get_rBx():Single return Physics2DContactPoint_Ffi.get_rBx(this);

	inline function set_rBx(value:Single):Single { Physics2DContactPoint_Ffi.set_rBx(this, value); return value; }
	public var rBy(get, set):Single;

	inline function get_rBy():Single return Physics2DContactPoint_Ffi.get_rBy(this);

	inline function set_rBy(value:Single):Single { Physics2DContactPoint_Ffi.set_rBy(this, value); return value; }
	public var tangentImpulse(get, set):Single;

	inline function get_tangentImpulse():Single return Physics2DContactPoint_Ffi.get_tangentImpulse(this);

	inline function set_tangentImpulse(value:Single):Single { Physics2DContactPoint_Ffi.set_tangentImpulse(this, value); return value; }
	public var tangentMass(get, set):Single;

	inline function get_tangentMass():Single return Physics2DContactPoint_Ffi.get_tangentMass(this);

	inline function set_tangentMass(value:Single):Single { Physics2DContactPoint_Ffi.set_tangentMass(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return Physics2DContactPoint_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Physics2DContactPoint_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Physics2DContactPoint_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Physics2DContactPoint_Ffi.set_y(this, value); return value; }
}
