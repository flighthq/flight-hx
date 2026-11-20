package flight._cpp;

private extern class Physics3DContactConstraintPoint_Ffi {
	@:native("flight_get_physics3_dcontact_constraint_point_feature_id") static function get_featureId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_physics3_dcontact_constraint_point_feature_id") static function set_featureId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_physics3_dcontact_constraint_point_normal_impulse") static function get_normalImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_constraint_point_normal_impulse") static function set_normalImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_constraint_point_tangent_impulse0") static function get_tangentImpulse0(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_constraint_point_tangent_impulse0") static function set_tangentImpulse0(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_constraint_point_tangent_impulse1") static function get_tangentImpulse1(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_constraint_point_tangent_impulse1") static function set_tangentImpulse1(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_constraint_point_normal_mass") static function get_normalMass(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_constraint_point_normal_mass") static function set_normalMass(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_constraint_point_tangent_mass0") static function get_tangentMass0(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_constraint_point_tangent_mass0") static function set_tangentMass0(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_constraint_point_tangent_mass1") static function get_tangentMass1(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_constraint_point_tangent_mass1") static function set_tangentMass1(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_constraint_point_bias") static function get_bias(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_constraint_point_bias") static function set_bias(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DContactConstraintPoint(cpp.Star<cpp.Void>) {
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return Physics3DContactConstraintPoint_Ffi.get_featureId(this);

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { Physics3DContactConstraintPoint_Ffi.set_featureId(this, value); return value; }
	public var normalImpulse(get, set):Float;

	inline function get_normalImpulse():Float return Physics3DContactConstraintPoint_Ffi.get_normalImpulse(this);

	inline function set_normalImpulse(value:Float):Float { Physics3DContactConstraintPoint_Ffi.set_normalImpulse(this, value); return value; }
	public var tangentImpulse0(get, set):Float;

	inline function get_tangentImpulse0():Float return Physics3DContactConstraintPoint_Ffi.get_tangentImpulse0(this);

	inline function set_tangentImpulse0(value:Float):Float { Physics3DContactConstraintPoint_Ffi.set_tangentImpulse0(this, value); return value; }
	public var tangentImpulse1(get, set):Float;

	inline function get_tangentImpulse1():Float return Physics3DContactConstraintPoint_Ffi.get_tangentImpulse1(this);

	inline function set_tangentImpulse1(value:Float):Float { Physics3DContactConstraintPoint_Ffi.set_tangentImpulse1(this, value); return value; }
	public var normalMass(get, set):Float;

	inline function get_normalMass():Float return Physics3DContactConstraintPoint_Ffi.get_normalMass(this);

	inline function set_normalMass(value:Float):Float { Physics3DContactConstraintPoint_Ffi.set_normalMass(this, value); return value; }
	public var tangentMass0(get, set):Float;

	inline function get_tangentMass0():Float return Physics3DContactConstraintPoint_Ffi.get_tangentMass0(this);

	inline function set_tangentMass0(value:Float):Float { Physics3DContactConstraintPoint_Ffi.set_tangentMass0(this, value); return value; }
	public var tangentMass1(get, set):Float;

	inline function get_tangentMass1():Float return Physics3DContactConstraintPoint_Ffi.get_tangentMass1(this);

	inline function set_tangentMass1(value:Float):Float { Physics3DContactConstraintPoint_Ffi.set_tangentMass1(this, value); return value; }
	public var bias(get, set):Float;

	inline function get_bias():Float return Physics3DContactConstraintPoint_Ffi.get_bias(this);

	inline function set_bias(value:Float):Float { Physics3DContactConstraintPoint_Ffi.set_bias(this, value); return value; }
}
