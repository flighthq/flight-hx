package flight._js;

@:jsRequire("flight")
private extern class RigidBody2D_Ffi {
	@:native("flight_get_rigid_body2_d_angle") static function get_angle(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_angle") static function set_angle(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_angular_damping") static function get_angularDamping(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_angular_damping") static function set_angularDamping(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_angular_velocity") static function get_angularVelocity(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_angular_velocity") static function set_angularVelocity(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_bullet") static function get_bullet(ptr:Dynamic):Bool;
	@:native("flight_set_rigid_body2_d_bullet") static function set_bullet(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_center_x") static function get_centerX(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_center_x") static function set_centerX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_center_y") static function get_centerY(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_center_y") static function set_centerY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_fixed_rotation") static function get_fixedRotation(ptr:Dynamic):Bool;
	@:native("flight_set_rigid_body2_d_fixed_rotation") static function set_fixedRotation(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_force_x") static function get_forceX(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_force_x") static function set_forceX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_force_y") static function get_forceY(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_force_y") static function set_forceY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_gravity_scale") static function get_gravityScale(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_gravity_scale") static function set_gravityScale(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_index") static function get_index(ptr:Dynamic):Int;
	@:native("flight_set_rigid_body2_d_index") static function set_index(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_rigid_body2_d_inertia") static function get_inertia(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_inertia") static function set_inertia(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_inverse_inertia") static function get_inverseInertia(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_inverse_inertia") static function set_inverseInertia(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_inverse_mass") static function get_inverseMass(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_inverse_mass") static function set_inverseMass(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_linear_damping") static function get_linearDamping(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_linear_damping") static function set_linearDamping(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_mass") static function get_mass(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_mass") static function set_mass(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_sleep_enabled") static function get_sleepEnabled(ptr:Dynamic):Bool;
	@:native("flight_set_rigid_body2_d_sleep_enabled") static function set_sleepEnabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_sleep_timer") static function get_sleepTimer(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_sleep_timer") static function set_sleepTimer(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_sleeping") static function get_sleeping(ptr:Dynamic):Bool;
	@:native("flight_set_rigid_body2_d_sleeping") static function set_sleeping(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_torque") static function get_torque(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_torque") static function set_torque(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_velocity_x") static function get_velocityX(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_velocity_x") static function set_velocityX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_velocity_y") static function get_velocityY(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_velocity_y") static function set_velocityY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rigid_body2_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_rigid_body2_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract RigidBody2D(Dynamic) {
	public var angle(get, set):Float;

	inline function get_angle():Float return RigidBody2D_Ffi.get_angle(this);

	inline function set_angle(value:Float):Float return RigidBody2D_Ffi.set_angle(this, value);
	public var angularDamping(get, set):Float;

	inline function get_angularDamping():Float return RigidBody2D_Ffi.get_angularDamping(this);

	inline function set_angularDamping(value:Float):Float return RigidBody2D_Ffi.set_angularDamping(this, value);
	public var angularVelocity(get, set):Float;

	inline function get_angularVelocity():Float return RigidBody2D_Ffi.get_angularVelocity(this);

	inline function set_angularVelocity(value:Float):Float return RigidBody2D_Ffi.set_angularVelocity(this, value);
	public var bullet(get, set):Bool;

	inline function get_bullet():Bool return RigidBody2D_Ffi.get_bullet(this);

	inline function set_bullet(value:Bool):Bool return RigidBody2D_Ffi.set_bullet(this, value);
	public var centerX(get, set):Float;

	inline function get_centerX():Float return RigidBody2D_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float return RigidBody2D_Ffi.set_centerX(this, value);
	public var centerY(get, set):Float;

	inline function get_centerY():Float return RigidBody2D_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float return RigidBody2D_Ffi.set_centerY(this, value);
	public var fixedRotation(get, set):Bool;

	inline function get_fixedRotation():Bool return RigidBody2D_Ffi.get_fixedRotation(this);

	inline function set_fixedRotation(value:Bool):Bool return RigidBody2D_Ffi.set_fixedRotation(this, value);
	public var forceX(get, set):Float;

	inline function get_forceX():Float return RigidBody2D_Ffi.get_forceX(this);

	inline function set_forceX(value:Float):Float return RigidBody2D_Ffi.set_forceX(this, value);
	public var forceY(get, set):Float;

	inline function get_forceY():Float return RigidBody2D_Ffi.get_forceY(this);

	inline function set_forceY(value:Float):Float return RigidBody2D_Ffi.set_forceY(this, value);
	public var gravityScale(get, set):Float;

	inline function get_gravityScale():Float return RigidBody2D_Ffi.get_gravityScale(this);

	inline function set_gravityScale(value:Float):Float return RigidBody2D_Ffi.set_gravityScale(this, value);
	public var index(get, set):Int;

	inline function get_index():Int return RigidBody2D_Ffi.get_index(this);

	inline function set_index(value:Int):Int return RigidBody2D_Ffi.set_index(this, value);
	public var inertia(get, set):Float;

	inline function get_inertia():Float return RigidBody2D_Ffi.get_inertia(this);

	inline function set_inertia(value:Float):Float return RigidBody2D_Ffi.set_inertia(this, value);
	public var inverseInertia(get, set):Float;

	inline function get_inverseInertia():Float return RigidBody2D_Ffi.get_inverseInertia(this);

	inline function set_inverseInertia(value:Float):Float return RigidBody2D_Ffi.set_inverseInertia(this, value);
	public var inverseMass(get, set):Float;

	inline function get_inverseMass():Float return RigidBody2D_Ffi.get_inverseMass(this);

	inline function set_inverseMass(value:Float):Float return RigidBody2D_Ffi.set_inverseMass(this, value);
	public var linearDamping(get, set):Float;

	inline function get_linearDamping():Float return RigidBody2D_Ffi.get_linearDamping(this);

	inline function set_linearDamping(value:Float):Float return RigidBody2D_Ffi.set_linearDamping(this, value);
	public var mass(get, set):Float;

	inline function get_mass():Float return RigidBody2D_Ffi.get_mass(this);

	inline function set_mass(value:Float):Float return RigidBody2D_Ffi.set_mass(this, value);
	public var sleepEnabled(get, set):Bool;

	inline function get_sleepEnabled():Bool return RigidBody2D_Ffi.get_sleepEnabled(this);

	inline function set_sleepEnabled(value:Bool):Bool return RigidBody2D_Ffi.set_sleepEnabled(this, value);
	public var sleepTimer(get, set):Float;

	inline function get_sleepTimer():Float return RigidBody2D_Ffi.get_sleepTimer(this);

	inline function set_sleepTimer(value:Float):Float return RigidBody2D_Ffi.set_sleepTimer(this, value);
	public var sleeping(get, set):Bool;

	inline function get_sleeping():Bool return RigidBody2D_Ffi.get_sleeping(this);

	inline function set_sleeping(value:Bool):Bool return RigidBody2D_Ffi.set_sleeping(this, value);
	public var torque(get, set):Float;

	inline function get_torque():Float return RigidBody2D_Ffi.get_torque(this);

	inline function set_torque(value:Float):Float return RigidBody2D_Ffi.set_torque(this, value);
	public var velocityX(get, set):Float;

	inline function get_velocityX():Float return RigidBody2D_Ffi.get_velocityX(this);

	inline function set_velocityX(value:Float):Float return RigidBody2D_Ffi.set_velocityX(this, value);
	public var velocityY(get, set):Float;

	inline function get_velocityY():Float return RigidBody2D_Ffi.get_velocityY(this);

	inline function set_velocityY(value:Float):Float return RigidBody2D_Ffi.set_velocityY(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return RigidBody2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return RigidBody2D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return RigidBody2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return RigidBody2D_Ffi.set_y(this, value);
}
