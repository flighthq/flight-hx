package flight._cpp;

private extern class Physics3DContact_Ffi {
	@:native("flight_get_physics3_dcontact_body_a") static function get_bodyA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcontact_body_a") static function set_bodyA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcontact_body_b") static function get_bodyB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcontact_body_b") static function set_bodyB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcontact_collider_a") static function get_colliderA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcontact_collider_a") static function set_colliderA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcontact_collider_b") static function get_colliderB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcontact_collider_b") static function set_colliderB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcontact_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_normal_z") static function get_normalZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_normal_z") static function set_normalZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_point_count") static function get_pointCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dcontact_point_count") static function set_pointCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dcontact_friction") static function get_friction(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_friction") static function set_friction(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_restitution") static function get_restitution(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcontact_restitution") static function set_restitution(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcontact_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dcontact_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dcontact_sensor") static function get_sensor(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dcontact_sensor") static function set_sensor(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dcontact_touching") static function get_touching(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dcontact_touching") static function set_touching(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics3DContact(cpp.Star<cpp.Void>) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics3DContact_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int { Physics3DContact_Ffi.set_bodyA(this, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics3DContact_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int { Physics3DContact_Ffi.set_bodyB(this, value); return value; }
	public var colliderA(get, set):Int;

	inline function get_colliderA():Int return Physics3DContact_Ffi.get_colliderA(this);

	inline function set_colliderA(value:Int):Int { Physics3DContact_Ffi.set_colliderA(this, value); return value; }
	public var colliderB(get, set):Int;

	inline function get_colliderB():Int return Physics3DContact_Ffi.get_colliderB(this);

	inline function set_colliderB(value:Int):Int { Physics3DContact_Ffi.set_colliderB(this, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return Physics3DContact_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float { Physics3DContact_Ffi.set_normalX(this, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return Physics3DContact_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float { Physics3DContact_Ffi.set_normalY(this, value); return value; }
	public var normalZ(get, set):Float;

	inline function get_normalZ():Float return Physics3DContact_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Float):Float { Physics3DContact_Ffi.set_normalZ(this, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return Physics3DContact_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int { Physics3DContact_Ffi.set_pointCount(this, value); return value; }
	public var friction(get, set):Float;

	inline function get_friction():Float return Physics3DContact_Ffi.get_friction(this);

	inline function set_friction(value:Float):Float { Physics3DContact_Ffi.set_friction(this, value); return value; }
	public var restitution(get, set):Float;

	inline function get_restitution():Float return Physics3DContact_Ffi.get_restitution(this);

	inline function set_restitution(value:Float):Float { Physics3DContact_Ffi.set_restitution(this, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Physics3DContact_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { Physics3DContact_Ffi.set_enabled(this, value); return value; }
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return Physics3DContact_Ffi.get_sensor(this);

	inline function set_sensor(value:Bool):Bool { Physics3DContact_Ffi.set_sensor(this, value); return value; }
	public var touching(get, set):Bool;

	inline function get_touching():Bool return Physics3DContact_Ffi.get_touching(this);

	inline function set_touching(value:Bool):Bool { Physics3DContact_Ffi.set_touching(this, value); return value; }
}
