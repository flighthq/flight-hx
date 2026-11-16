package flight._cpp;

private extern class RigidBody2D_Ffi {
	@:native("flight_get_rigid_body2_d_angle") static function get_angle(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_angle") static function set_angle(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_angular_damping") static function get_angularDamping(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_angular_damping") static function set_angularDamping(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_angular_velocity") static function get_angularVelocity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_angular_velocity") static function set_angularVelocity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_bullet") static function get_bullet(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body2_d_bullet") static function set_bullet(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_center_x") static function get_centerX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_center_x") static function set_centerX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_center_y") static function get_centerY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_center_y") static function set_centerY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_fixed_rotation") static function get_fixedRotation(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body2_d_fixed_rotation") static function set_fixedRotation(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_force_x") static function get_forceX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_force_x") static function set_forceX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_force_y") static function get_forceY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_force_y") static function set_forceY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_gravity_scale") static function get_gravityScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_gravity_scale") static function set_gravityScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_index") static function get_index(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rigid_body2_d_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_rigid_body2_d_inertia") static function get_inertia(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_inertia") static function set_inertia(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_inverse_inertia") static function get_inverseInertia(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_inverse_inertia") static function set_inverseInertia(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_inverse_mass") static function get_inverseMass(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_inverse_mass") static function set_inverseMass(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_linear_damping") static function get_linearDamping(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_linear_damping") static function set_linearDamping(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_mass") static function get_mass(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_mass") static function set_mass(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_sleep_enabled") static function get_sleepEnabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body2_d_sleep_enabled") static function set_sleepEnabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_sleep_timer") static function get_sleepTimer(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body2_d_sleep_timer") static function set_sleepTimer(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body2_d_sleeping") static function get_sleeping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body2_d_sleeping") static function set_sleeping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body2_d_torque") static function get_torque(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_torque") static function set_torque(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_velocity_x") static function get_velocityX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_velocity_x") static function set_velocityX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_velocity_y") static function get_velocityY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_velocity_y") static function set_velocityY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rigid_body2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rigid_body2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RigidBody2D(cpp.Star<cpp.Void>) {
	public var angle(get, set):Single;

	inline function get_angle():Single return RigidBody2D_Ffi.get_angle(this);

	inline function set_angle(value:Single):Single { RigidBody2D_Ffi.set_angle(this, value); return value; }
	public var angularDamping(get, set):Single;

	inline function get_angularDamping():Single return RigidBody2D_Ffi.get_angularDamping(this);

	inline function set_angularDamping(value:Single):Single { RigidBody2D_Ffi.set_angularDamping(this, value); return value; }
	public var angularVelocity(get, set):Single;

	inline function get_angularVelocity():Single return RigidBody2D_Ffi.get_angularVelocity(this);

	inline function set_angularVelocity(value:Single):Single { RigidBody2D_Ffi.set_angularVelocity(this, value); return value; }
	public var bullet(get, set):Bool;

	inline function get_bullet():Bool return RigidBody2D_Ffi.get_bullet(this);

	inline function set_bullet(value:Bool):Bool { RigidBody2D_Ffi.set_bullet(this, value); return value; }
	public var centerX(get, set):Single;

	inline function get_centerX():Single return RigidBody2D_Ffi.get_centerX(this);

	inline function set_centerX(value:Single):Single { RigidBody2D_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return RigidBody2D_Ffi.get_centerY(this);

	inline function set_centerY(value:Single):Single { RigidBody2D_Ffi.set_centerY(this, value); return value; }
	public var fixedRotation(get, set):Bool;

	inline function get_fixedRotation():Bool return RigidBody2D_Ffi.get_fixedRotation(this);

	inline function set_fixedRotation(value:Bool):Bool { RigidBody2D_Ffi.set_fixedRotation(this, value); return value; }
	public var forceX(get, set):Single;

	inline function get_forceX():Single return RigidBody2D_Ffi.get_forceX(this);

	inline function set_forceX(value:Single):Single { RigidBody2D_Ffi.set_forceX(this, value); return value; }
	public var forceY(get, set):Single;

	inline function get_forceY():Single return RigidBody2D_Ffi.get_forceY(this);

	inline function set_forceY(value:Single):Single { RigidBody2D_Ffi.set_forceY(this, value); return value; }
	public var gravityScale(get, set):Single;

	inline function get_gravityScale():Single return RigidBody2D_Ffi.get_gravityScale(this);

	inline function set_gravityScale(value:Single):Single { RigidBody2D_Ffi.set_gravityScale(this, value); return value; }
	public var index(get, set):Int;

	inline function get_index():Int return RigidBody2D_Ffi.get_index(this);

	inline function set_index(value:Int):Int { RigidBody2D_Ffi.set_index(this, value); return value; }
	public var inertia(get, set):Single;

	inline function get_inertia():Single return RigidBody2D_Ffi.get_inertia(this);

	inline function set_inertia(value:Single):Single { RigidBody2D_Ffi.set_inertia(this, value); return value; }
	public var inverseInertia(get, set):Single;

	inline function get_inverseInertia():Single return RigidBody2D_Ffi.get_inverseInertia(this);

	inline function set_inverseInertia(value:Single):Single { RigidBody2D_Ffi.set_inverseInertia(this, value); return value; }
	public var inverseMass(get, set):Single;

	inline function get_inverseMass():Single return RigidBody2D_Ffi.get_inverseMass(this);

	inline function set_inverseMass(value:Single):Single { RigidBody2D_Ffi.set_inverseMass(this, value); return value; }
	public var linearDamping(get, set):Single;

	inline function get_linearDamping():Single return RigidBody2D_Ffi.get_linearDamping(this);

	inline function set_linearDamping(value:Single):Single { RigidBody2D_Ffi.set_linearDamping(this, value); return value; }
	public var mass(get, set):Single;

	inline function get_mass():Single return RigidBody2D_Ffi.get_mass(this);

	inline function set_mass(value:Single):Single { RigidBody2D_Ffi.set_mass(this, value); return value; }
	public var sleepEnabled(get, set):Bool;

	inline function get_sleepEnabled():Bool return RigidBody2D_Ffi.get_sleepEnabled(this);

	inline function set_sleepEnabled(value:Bool):Bool { RigidBody2D_Ffi.set_sleepEnabled(this, value); return value; }
	public var sleepTimer(get, set):Float;

	inline function get_sleepTimer():Float return RigidBody2D_Ffi.get_sleepTimer(this);

	inline function set_sleepTimer(value:Float):Float { RigidBody2D_Ffi.set_sleepTimer(this, value); return value; }
	public var sleeping(get, set):Bool;

	inline function get_sleeping():Bool return RigidBody2D_Ffi.get_sleeping(this);

	inline function set_sleeping(value:Bool):Bool { RigidBody2D_Ffi.set_sleeping(this, value); return value; }
	public var torque(get, set):Single;

	inline function get_torque():Single return RigidBody2D_Ffi.get_torque(this);

	inline function set_torque(value:Single):Single { RigidBody2D_Ffi.set_torque(this, value); return value; }
	public var velocityX(get, set):Single;

	inline function get_velocityX():Single return RigidBody2D_Ffi.get_velocityX(this);

	inline function set_velocityX(value:Single):Single { RigidBody2D_Ffi.set_velocityX(this, value); return value; }
	public var velocityY(get, set):Single;

	inline function get_velocityY():Single return RigidBody2D_Ffi.get_velocityY(this);

	inline function set_velocityY(value:Single):Single { RigidBody2D_Ffi.set_velocityY(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return RigidBody2D_Ffi.get_x(this);

	inline function set_x(value:Single):Single { RigidBody2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return RigidBody2D_Ffi.get_y(this);

	inline function set_y(value:Single):Single { RigidBody2D_Ffi.set_y(this, value); return value; }
}
