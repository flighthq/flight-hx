package flight._js;

@:jsRequire("flight")
private extern class Physics2DContact_Ffi {
	@:native("flight_get_physics2_dcontact_body_a") static function get_bodyA(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dcontact_body_a") static function set_bodyA(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dcontact_body_b") static function get_bodyB(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dcontact_body_b") static function set_bodyB(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dcontact_collider_a") static function get_colliderA(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dcontact_collider_a") static function set_colliderA(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dcontact_collider_b") static function get_colliderB(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dcontact_collider_b") static function set_colliderB(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dcontact_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dcontact_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dcontact_friction") static function get_friction(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_friction") static function set_friction(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_normal_x") static function get_normalX(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_normal_x") static function set_normalX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_normal_y") static function get_normalY(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_normal_y") static function set_normalY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_point_count") static function get_pointCount(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dcontact_point_count") static function set_pointCount(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dcontact_restitution") static function get_restitution(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dcontact_restitution") static function set_restitution(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dcontact_sensor") static function get_sensor(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dcontact_sensor") static function set_sensor(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dcontact_touching") static function get_touching(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dcontact_touching") static function set_touching(ptr:Dynamic, value:Bool):Bool;
}

abstract Physics2DContact(Dynamic) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics2DContact_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int return Physics2DContact_Ffi.set_bodyA(this, value);
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics2DContact_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int return Physics2DContact_Ffi.set_bodyB(this, value);
	public var colliderA(get, set):Int;

	inline function get_colliderA():Int return Physics2DContact_Ffi.get_colliderA(this);

	inline function set_colliderA(value:Int):Int return Physics2DContact_Ffi.set_colliderA(this, value);
	public var colliderB(get, set):Int;

	inline function get_colliderB():Int return Physics2DContact_Ffi.get_colliderB(this);

	inline function set_colliderB(value:Int):Int return Physics2DContact_Ffi.set_colliderB(this, value);
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Physics2DContact_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return Physics2DContact_Ffi.set_enabled(this, value);
	public var friction(get, set):Float;

	inline function get_friction():Float return Physics2DContact_Ffi.get_friction(this);

	inline function set_friction(value:Float):Float return Physics2DContact_Ffi.set_friction(this, value);
	public var normalX(get, set):Float;

	inline function get_normalX():Float return Physics2DContact_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float return Physics2DContact_Ffi.set_normalX(this, value);
	public var normalY(get, set):Float;

	inline function get_normalY():Float return Physics2DContact_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float return Physics2DContact_Ffi.set_normalY(this, value);
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return Physics2DContact_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int return Physics2DContact_Ffi.set_pointCount(this, value);
	public var restitution(get, set):Float;

	inline function get_restitution():Float return Physics2DContact_Ffi.get_restitution(this);

	inline function set_restitution(value:Float):Float return Physics2DContact_Ffi.set_restitution(this, value);
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return Physics2DContact_Ffi.get_sensor(this);

	inline function set_sensor(value:Bool):Bool return Physics2DContact_Ffi.set_sensor(this, value);
	public var touching(get, set):Bool;

	inline function get_touching():Bool return Physics2DContact_Ffi.get_touching(this);

	inline function set_touching(value:Bool):Bool return Physics2DContact_Ffi.set_touching(this, value);
}
