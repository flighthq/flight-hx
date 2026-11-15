package flight._js;

@:jsRequire("flight")
private extern class Physics2DContactPoint_Ffi {
	@:native("flight_get_physics2_dcontact_point_bias") static function get_bias(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_bias") static function set_bias(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_depth") static function get_depth(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_depth") static function set_depth(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_feature_id") static function get_featureId(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_physics2_dcontact_point_feature_id") static function set_featureId(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_physics2_dcontact_point_normal_impulse") static function get_normalImpulse(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_normal_impulse") static function set_normalImpulse(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_normal_mass") static function get_normalMass(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_normal_mass") static function set_normalMass(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_r_ax") static function get_rAx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_r_ax") static function set_rAx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_r_ay") static function get_rAy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_r_ay") static function set_rAy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_r_bx") static function get_rBx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_r_bx") static function set_rBx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_r_by") static function get_rBy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_r_by") static function set_rBy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_tangent_impulse") static function get_tangentImpulse(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_tangent_impulse") static function set_tangentImpulse(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_tangent_mass") static function get_tangentMass(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_tangent_mass") static function set_tangentMass(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_point_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DContactPoint(Dynamic) {
	public var bias(get, set):Float;

	inline function get_bias():Float return Physics2DContactPoint_Ffi.get_bias(this);

	inline function set_bias(value:Float):Float return Physics2DContactPoint_Ffi.set_bias(this, value);
	public var depth(get, set):Float;

	inline function get_depth():Float return Physics2DContactPoint_Ffi.get_depth(this);

	inline function set_depth(value:Float):Float return Physics2DContactPoint_Ffi.set_depth(this, value);
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return Physics2DContactPoint_Ffi.get_featureId(this);

	inline function set_featureId(value:haxe.Int64):haxe.Int64 return Physics2DContactPoint_Ffi.set_featureId(this, value);
	public var normalImpulse(get, set):Float;

	inline function get_normalImpulse():Float return Physics2DContactPoint_Ffi.get_normalImpulse(this);

	inline function set_normalImpulse(value:Float):Float return Physics2DContactPoint_Ffi.set_normalImpulse(this, value);
	public var normalMass(get, set):Float;

	inline function get_normalMass():Float return Physics2DContactPoint_Ffi.get_normalMass(this);

	inline function set_normalMass(value:Float):Float return Physics2DContactPoint_Ffi.set_normalMass(this, value);
	public var rAx(get, set):Float;

	inline function get_rAx():Float return Physics2DContactPoint_Ffi.get_rAx(this);

	inline function set_rAx(value:Float):Float return Physics2DContactPoint_Ffi.set_rAx(this, value);
	public var rAy(get, set):Float;

	inline function get_rAy():Float return Physics2DContactPoint_Ffi.get_rAy(this);

	inline function set_rAy(value:Float):Float return Physics2DContactPoint_Ffi.set_rAy(this, value);
	public var rBx(get, set):Float;

	inline function get_rBx():Float return Physics2DContactPoint_Ffi.get_rBx(this);

	inline function set_rBx(value:Float):Float return Physics2DContactPoint_Ffi.set_rBx(this, value);
	public var rBy(get, set):Float;

	inline function get_rBy():Float return Physics2DContactPoint_Ffi.get_rBy(this);

	inline function set_rBy(value:Float):Float return Physics2DContactPoint_Ffi.set_rBy(this, value);
	public var tangentImpulse(get, set):Float;

	inline function get_tangentImpulse():Float return Physics2DContactPoint_Ffi.get_tangentImpulse(this);

	inline function set_tangentImpulse(value:Float):Float return Physics2DContactPoint_Ffi.set_tangentImpulse(this, value);
	public var tangentMass(get, set):Float;

	inline function get_tangentMass():Float return Physics2DContactPoint_Ffi.get_tangentMass(this);

	inline function set_tangentMass(value:Float):Float return Physics2DContactPoint_Ffi.set_tangentMass(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return Physics2DContactPoint_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Physics2DContactPoint_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Physics2DContactPoint_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Physics2DContactPoint_Ffi.set_y(this, value);
}
