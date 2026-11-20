package flight._hl;

private extern class RigidBody2D_Ffi {
	@:hlNative("flight", "flight_get_rigid_body2_d_angle")
	static function get_angle(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_angle")
	static function set_angle(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_angular_damping")
	static function get_angularDamping(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_angular_damping")
	static function set_angularDamping(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_angular_velocity")
	static function get_angularVelocity(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_angular_velocity")
	static function set_angularVelocity(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_bullet")
	static function get_bullet(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_rigid_body2_d_bullet")
	static function set_bullet(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_rigid_body2_d_center_x")
	static function get_centerX(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_center_x")
	static function set_centerX(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_center_y")
	static function get_centerY(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_center_y")
	static function set_centerY(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_fixed_rotation")
	static function get_fixedRotation(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_rigid_body2_d_fixed_rotation")
	static function set_fixedRotation(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_rigid_body2_d_force_x")
	static function get_forceX(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_force_x")
	static function set_forceX(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_force_y")
	static function get_forceY(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_force_y")
	static function set_forceY(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_gravity_scale")
	static function get_gravityScale(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_gravity_scale")
	static function set_gravityScale(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_index")
	static function get_index(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_rigid_body2_d_index")
	static function set_index(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_rigid_body2_d_inertia")
	static function get_inertia(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_inertia")
	static function set_inertia(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_inverse_inertia")
	static function get_inverseInertia(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_inverse_inertia")
	static function set_inverseInertia(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_inverse_mass")
	static function get_inverseMass(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_inverse_mass")
	static function set_inverseMass(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_linear_damping")
	static function get_linearDamping(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_linear_damping")
	static function set_linearDamping(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_mass")
	static function get_mass(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_mass")
	static function set_mass(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_sleep_enabled")
	static function get_sleepEnabled(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_rigid_body2_d_sleep_enabled")
	static function set_sleepEnabled(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_rigid_body2_d_sleep_timer")
	static function get_sleepTimer(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_sleep_timer")
	static function set_sleepTimer(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_sleeping")
	static function get_sleeping(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_rigid_body2_d_sleeping")
	static function set_sleeping(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_rigid_body2_d_torque")
	static function get_torque(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_torque")
	static function set_torque(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_velocity_x")
	static function get_velocityX(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_velocity_x")
	static function set_velocityX(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_velocity_y")
	static function get_velocityY(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_velocity_y")
	static function set_velocityY(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_x")
	static function get_x(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_x")
	static function set_x(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_rigid_body2_d_y")
	static function get_y(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_rigid_body2_d_y")
	static function set_y(ptr:hl.Bytes, value:Float):Float;
}

abstract RigidBody2D(hl.Bytes) {
	public var angle(get, set):Float;

	inline function get_angle():Float return RigidBody2D_Ffi.get_angle(this);

	inline function set_angle(value:Float):Float { RigidBody2D_Ffi.set_angle(this, value); return value; }
	public var angularDamping(get, set):Float;

	inline function get_angularDamping():Float return RigidBody2D_Ffi.get_angularDamping(this);

	inline function set_angularDamping(value:Float):Float { RigidBody2D_Ffi.set_angularDamping(this, value); return value; }
	public var angularVelocity(get, set):Float;

	inline function get_angularVelocity():Float return RigidBody2D_Ffi.get_angularVelocity(this);

	inline function set_angularVelocity(value:Float):Float { RigidBody2D_Ffi.set_angularVelocity(this, value); return value; }
	public var bullet(get, set):Bool;

	inline function get_bullet():Bool return RigidBody2D_Ffi.get_bullet(this);

	inline function set_bullet(value:Bool):Bool { RigidBody2D_Ffi.set_bullet(this, value); return value; }
	public var centerX(get, set):Float;

	inline function get_centerX():Float return RigidBody2D_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float { RigidBody2D_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return RigidBody2D_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float { RigidBody2D_Ffi.set_centerY(this, value); return value; }
	public var fixedRotation(get, set):Bool;

	inline function get_fixedRotation():Bool return RigidBody2D_Ffi.get_fixedRotation(this);

	inline function set_fixedRotation(value:Bool):Bool { RigidBody2D_Ffi.set_fixedRotation(this, value); return value; }
	public var forceX(get, set):Float;

	inline function get_forceX():Float return RigidBody2D_Ffi.get_forceX(this);

	inline function set_forceX(value:Float):Float { RigidBody2D_Ffi.set_forceX(this, value); return value; }
	public var forceY(get, set):Float;

	inline function get_forceY():Float return RigidBody2D_Ffi.get_forceY(this);

	inline function set_forceY(value:Float):Float { RigidBody2D_Ffi.set_forceY(this, value); return value; }
	public var gravityScale(get, set):Float;

	inline function get_gravityScale():Float return RigidBody2D_Ffi.get_gravityScale(this);

	inline function set_gravityScale(value:Float):Float { RigidBody2D_Ffi.set_gravityScale(this, value); return value; }
	public var index(get, set):Int;

	inline function get_index():Int return RigidBody2D_Ffi.get_index(this);

	inline function set_index(value:Int):Int { RigidBody2D_Ffi.set_index(this, value); return value; }
	public var inertia(get, set):Float;

	inline function get_inertia():Float return RigidBody2D_Ffi.get_inertia(this);

	inline function set_inertia(value:Float):Float { RigidBody2D_Ffi.set_inertia(this, value); return value; }
	public var inverseInertia(get, set):Float;

	inline function get_inverseInertia():Float return RigidBody2D_Ffi.get_inverseInertia(this);

	inline function set_inverseInertia(value:Float):Float { RigidBody2D_Ffi.set_inverseInertia(this, value); return value; }
	public var inverseMass(get, set):Float;

	inline function get_inverseMass():Float return RigidBody2D_Ffi.get_inverseMass(this);

	inline function set_inverseMass(value:Float):Float { RigidBody2D_Ffi.set_inverseMass(this, value); return value; }
	public var linearDamping(get, set):Float;

	inline function get_linearDamping():Float return RigidBody2D_Ffi.get_linearDamping(this);

	inline function set_linearDamping(value:Float):Float { RigidBody2D_Ffi.set_linearDamping(this, value); return value; }
	public var mass(get, set):Float;

	inline function get_mass():Float return RigidBody2D_Ffi.get_mass(this);

	inline function set_mass(value:Float):Float { RigidBody2D_Ffi.set_mass(this, value); return value; }
	public var sleepEnabled(get, set):Bool;

	inline function get_sleepEnabled():Bool return RigidBody2D_Ffi.get_sleepEnabled(this);

	inline function set_sleepEnabled(value:Bool):Bool { RigidBody2D_Ffi.set_sleepEnabled(this, value); return value; }
	public var sleepTimer(get, set):Float;

	inline function get_sleepTimer():Float return RigidBody2D_Ffi.get_sleepTimer(this);

	inline function set_sleepTimer(value:Float):Float { RigidBody2D_Ffi.set_sleepTimer(this, value); return value; }
	public var sleeping(get, set):Bool;

	inline function get_sleeping():Bool return RigidBody2D_Ffi.get_sleeping(this);

	inline function set_sleeping(value:Bool):Bool { RigidBody2D_Ffi.set_sleeping(this, value); return value; }
	public var torque(get, set):Float;

	inline function get_torque():Float return RigidBody2D_Ffi.get_torque(this);

	inline function set_torque(value:Float):Float { RigidBody2D_Ffi.set_torque(this, value); return value; }
	public var velocityX(get, set):Float;

	inline function get_velocityX():Float return RigidBody2D_Ffi.get_velocityX(this);

	inline function set_velocityX(value:Float):Float { RigidBody2D_Ffi.set_velocityX(this, value); return value; }
	public var velocityY(get, set):Float;

	inline function get_velocityY():Float return RigidBody2D_Ffi.get_velocityY(this);

	inline function set_velocityY(value:Float):Float { RigidBody2D_Ffi.set_velocityY(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return RigidBody2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { RigidBody2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return RigidBody2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { RigidBody2D_Ffi.set_y(this, value); return value; }
}
