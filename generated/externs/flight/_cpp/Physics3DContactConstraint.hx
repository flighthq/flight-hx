package flight._cpp;

private extern class Physics3DContactConstraint_Ffi {
	@:native("flight_get_physics3_dcontact_constraint_contact") static function get_contact(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcontact_constraint_contact") static function set_contact(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcontact_constraint_tangent0_x") static function get_tangent0X(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_constraint_tangent0_x") static function set_tangent0X(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_constraint_tangent0_y") static function get_tangent0Y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_constraint_tangent0_y") static function set_tangent0Y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_constraint_tangent0_z") static function get_tangent0Z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_constraint_tangent0_z") static function set_tangent0Z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_constraint_tangent1_x") static function get_tangent1X(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_constraint_tangent1_x") static function set_tangent1X(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_constraint_tangent1_y") static function get_tangent1Y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_constraint_tangent1_y") static function set_tangent1Y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_constraint_tangent1_z") static function get_tangent1Z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dcontact_constraint_tangent1_z") static function set_tangent1Z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dcontact_constraint_point_count") static function get_pointCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcontact_constraint_point_count") static function set_pointCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DContactConstraint(cpp.Star<cpp.Void>) {
	public var contact(get, set):Int;

	inline function get_contact():Int return Physics3DContactConstraint_Ffi.get_contact(this);

	inline function set_contact(value:Int):Int { Physics3DContactConstraint_Ffi.set_contact(this, value); return value; }
	public var tangent0X(get, set):Single;

	inline function get_tangent0X():Single return Physics3DContactConstraint_Ffi.get_tangent0X(this);

	inline function set_tangent0X(value:Single):Single { Physics3DContactConstraint_Ffi.set_tangent0X(this, value); return value; }
	public var tangent0Y(get, set):Single;

	inline function get_tangent0Y():Single return Physics3DContactConstraint_Ffi.get_tangent0Y(this);

	inline function set_tangent0Y(value:Single):Single { Physics3DContactConstraint_Ffi.set_tangent0Y(this, value); return value; }
	public var tangent0Z(get, set):Single;

	inline function get_tangent0Z():Single return Physics3DContactConstraint_Ffi.get_tangent0Z(this);

	inline function set_tangent0Z(value:Single):Single { Physics3DContactConstraint_Ffi.set_tangent0Z(this, value); return value; }
	public var tangent1X(get, set):Single;

	inline function get_tangent1X():Single return Physics3DContactConstraint_Ffi.get_tangent1X(this);

	inline function set_tangent1X(value:Single):Single { Physics3DContactConstraint_Ffi.set_tangent1X(this, value); return value; }
	public var tangent1Y(get, set):Single;

	inline function get_tangent1Y():Single return Physics3DContactConstraint_Ffi.get_tangent1Y(this);

	inline function set_tangent1Y(value:Single):Single { Physics3DContactConstraint_Ffi.set_tangent1Y(this, value); return value; }
	public var tangent1Z(get, set):Single;

	inline function get_tangent1Z():Single return Physics3DContactConstraint_Ffi.get_tangent1Z(this);

	inline function set_tangent1Z(value:Single):Single { Physics3DContactConstraint_Ffi.set_tangent1Z(this, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return Physics3DContactConstraint_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int { Physics3DContactConstraint_Ffi.set_pointCount(this, value); return value; }
}
