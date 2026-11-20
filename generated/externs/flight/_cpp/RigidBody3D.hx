package flight._cpp;

private extern class RigidBody3D_Ffi {
	@:native("flight_get_rigid_body3_d_index") static function get_index(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rigid_body3_d_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_rigid_body3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_orientation_x") static function get_orientationX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_orientation_x") static function set_orientationX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_orientation_y") static function get_orientationY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_orientation_y") static function set_orientationY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_orientation_z") static function get_orientationZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_orientation_z") static function set_orientationZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_orientation_w") static function get_orientationW(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_orientation_w") static function set_orientationW(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_velocity_x") static function get_velocityX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_velocity_x") static function set_velocityX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_velocity_y") static function get_velocityY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_velocity_y") static function set_velocityY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_velocity_z") static function get_velocityZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_velocity_z") static function set_velocityZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_angular_velocity_x") static function get_angularVelocityX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_angular_velocity_x") static function set_angularVelocityX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_angular_velocity_y") static function get_angularVelocityY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_angular_velocity_y") static function set_angularVelocityY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_angular_velocity_z") static function get_angularVelocityZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_angular_velocity_z") static function set_angularVelocityZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_force_x") static function get_forceX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_force_x") static function set_forceX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_force_y") static function get_forceY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_force_y") static function set_forceY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_force_z") static function get_forceZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_force_z") static function set_forceZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_torque_x") static function get_torqueX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_torque_x") static function set_torqueX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_torque_y") static function get_torqueY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_torque_y") static function set_torqueY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_torque_z") static function get_torqueZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_torque_z") static function set_torqueZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_mass") static function get_mass(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_mass") static function set_mass(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_mass") static function get_inverseMass(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_mass") static function set_inverseMass(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inertia_xx") static function get_inertiaXx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inertia_xx") static function set_inertiaXx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inertia_yy") static function get_inertiaYy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inertia_yy") static function set_inertiaYy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inertia_zz") static function get_inertiaZz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inertia_zz") static function set_inertiaZz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inertia_xy") static function get_inertiaXy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inertia_xy") static function set_inertiaXy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inertia_xz") static function get_inertiaXz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inertia_xz") static function set_inertiaXz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inertia_yz") static function get_inertiaYz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inertia_yz") static function set_inertiaYz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_xx") static function get_inverseInertiaXx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_xx") static function set_inverseInertiaXx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_yy") static function get_inverseInertiaYy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_yy") static function set_inverseInertiaYy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_zz") static function get_inverseInertiaZz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_zz") static function set_inverseInertiaZz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_xy") static function get_inverseInertiaXy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_xy") static function set_inverseInertiaXy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_xz") static function get_inverseInertiaXz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_xz") static function set_inverseInertiaXz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_yz") static function get_inverseInertiaYz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_yz") static function set_inverseInertiaYz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_world_xx") static function get_inverseInertiaWorldXx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_world_xx") static function set_inverseInertiaWorldXx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_world_yy") static function get_inverseInertiaWorldYy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_world_yy") static function set_inverseInertiaWorldYy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_world_zz") static function get_inverseInertiaWorldZz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_world_zz") static function set_inverseInertiaWorldZz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_world_xy") static function get_inverseInertiaWorldXy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_world_xy") static function set_inverseInertiaWorldXy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_world_xz") static function get_inverseInertiaWorldXz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_world_xz") static function set_inverseInertiaWorldXz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_inverse_inertia_world_yz") static function get_inverseInertiaWorldYz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_inverse_inertia_world_yz") static function set_inverseInertiaWorldYz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_center_x") static function get_centerX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_center_x") static function set_centerX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_center_y") static function get_centerY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_center_y") static function set_centerY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_center_z") static function get_centerZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_center_z") static function set_centerZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_linear_damping") static function get_linearDamping(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_linear_damping") static function set_linearDamping(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_angular_damping") static function get_angularDamping(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_angular_damping") static function set_angularDamping(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_gravity_scale") static function get_gravityScale(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_gravity_scale") static function set_gravityScale(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rigid_body3_d_fixed_rotation") static function get_fixedRotation(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body3_d_fixed_rotation") static function set_fixedRotation(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body3_d_bullet") static function get_bullet(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body3_d_bullet") static function set_bullet(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body3_d_sleeping") static function get_sleeping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body3_d_sleeping") static function set_sleeping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body3_d_sleep_enabled") static function get_sleepEnabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_rigid_body3_d_sleep_enabled") static function set_sleepEnabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_rigid_body3_d_sleep_timer") static function get_sleepTimer(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rigid_body3_d_sleep_timer") static function set_sleepTimer(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract RigidBody3D(cpp.Star<cpp.Void>) {
	public var index(get, set):Int;

	inline function get_index():Int return RigidBody3D_Ffi.get_index(this);

	inline function set_index(value:Int):Int { RigidBody3D_Ffi.set_index(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return RigidBody3D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { RigidBody3D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return RigidBody3D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { RigidBody3D_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return RigidBody3D_Ffi.get_z(this);

	inline function set_z(value:Float):Float { RigidBody3D_Ffi.set_z(this, value); return value; }
	public var orientationX(get, set):Float;

	inline function get_orientationX():Float return RigidBody3D_Ffi.get_orientationX(this);

	inline function set_orientationX(value:Float):Float { RigidBody3D_Ffi.set_orientationX(this, value); return value; }
	public var orientationY(get, set):Float;

	inline function get_orientationY():Float return RigidBody3D_Ffi.get_orientationY(this);

	inline function set_orientationY(value:Float):Float { RigidBody3D_Ffi.set_orientationY(this, value); return value; }
	public var orientationZ(get, set):Float;

	inline function get_orientationZ():Float return RigidBody3D_Ffi.get_orientationZ(this);

	inline function set_orientationZ(value:Float):Float { RigidBody3D_Ffi.set_orientationZ(this, value); return value; }
	public var orientationW(get, set):Float;

	inline function get_orientationW():Float return RigidBody3D_Ffi.get_orientationW(this);

	inline function set_orientationW(value:Float):Float { RigidBody3D_Ffi.set_orientationW(this, value); return value; }
	public var velocityX(get, set):Float;

	inline function get_velocityX():Float return RigidBody3D_Ffi.get_velocityX(this);

	inline function set_velocityX(value:Float):Float { RigidBody3D_Ffi.set_velocityX(this, value); return value; }
	public var velocityY(get, set):Float;

	inline function get_velocityY():Float return RigidBody3D_Ffi.get_velocityY(this);

	inline function set_velocityY(value:Float):Float { RigidBody3D_Ffi.set_velocityY(this, value); return value; }
	public var velocityZ(get, set):Float;

	inline function get_velocityZ():Float return RigidBody3D_Ffi.get_velocityZ(this);

	inline function set_velocityZ(value:Float):Float { RigidBody3D_Ffi.set_velocityZ(this, value); return value; }
	public var angularVelocityX(get, set):Float;

	inline function get_angularVelocityX():Float return RigidBody3D_Ffi.get_angularVelocityX(this);

	inline function set_angularVelocityX(value:Float):Float { RigidBody3D_Ffi.set_angularVelocityX(this, value); return value; }
	public var angularVelocityY(get, set):Float;

	inline function get_angularVelocityY():Float return RigidBody3D_Ffi.get_angularVelocityY(this);

	inline function set_angularVelocityY(value:Float):Float { RigidBody3D_Ffi.set_angularVelocityY(this, value); return value; }
	public var angularVelocityZ(get, set):Float;

	inline function get_angularVelocityZ():Float return RigidBody3D_Ffi.get_angularVelocityZ(this);

	inline function set_angularVelocityZ(value:Float):Float { RigidBody3D_Ffi.set_angularVelocityZ(this, value); return value; }
	public var forceX(get, set):Float;

	inline function get_forceX():Float return RigidBody3D_Ffi.get_forceX(this);

	inline function set_forceX(value:Float):Float { RigidBody3D_Ffi.set_forceX(this, value); return value; }
	public var forceY(get, set):Float;

	inline function get_forceY():Float return RigidBody3D_Ffi.get_forceY(this);

	inline function set_forceY(value:Float):Float { RigidBody3D_Ffi.set_forceY(this, value); return value; }
	public var forceZ(get, set):Float;

	inline function get_forceZ():Float return RigidBody3D_Ffi.get_forceZ(this);

	inline function set_forceZ(value:Float):Float { RigidBody3D_Ffi.set_forceZ(this, value); return value; }
	public var torqueX(get, set):Float;

	inline function get_torqueX():Float return RigidBody3D_Ffi.get_torqueX(this);

	inline function set_torqueX(value:Float):Float { RigidBody3D_Ffi.set_torqueX(this, value); return value; }
	public var torqueY(get, set):Float;

	inline function get_torqueY():Float return RigidBody3D_Ffi.get_torqueY(this);

	inline function set_torqueY(value:Float):Float { RigidBody3D_Ffi.set_torqueY(this, value); return value; }
	public var torqueZ(get, set):Float;

	inline function get_torqueZ():Float return RigidBody3D_Ffi.get_torqueZ(this);

	inline function set_torqueZ(value:Float):Float { RigidBody3D_Ffi.set_torqueZ(this, value); return value; }
	public var mass(get, set):Float;

	inline function get_mass():Float return RigidBody3D_Ffi.get_mass(this);

	inline function set_mass(value:Float):Float { RigidBody3D_Ffi.set_mass(this, value); return value; }
	public var inverseMass(get, set):Float;

	inline function get_inverseMass():Float return RigidBody3D_Ffi.get_inverseMass(this);

	inline function set_inverseMass(value:Float):Float { RigidBody3D_Ffi.set_inverseMass(this, value); return value; }
	public var inertiaXx(get, set):Float;

	inline function get_inertiaXx():Float return RigidBody3D_Ffi.get_inertiaXx(this);

	inline function set_inertiaXx(value:Float):Float { RigidBody3D_Ffi.set_inertiaXx(this, value); return value; }
	public var inertiaYy(get, set):Float;

	inline function get_inertiaYy():Float return RigidBody3D_Ffi.get_inertiaYy(this);

	inline function set_inertiaYy(value:Float):Float { RigidBody3D_Ffi.set_inertiaYy(this, value); return value; }
	public var inertiaZz(get, set):Float;

	inline function get_inertiaZz():Float return RigidBody3D_Ffi.get_inertiaZz(this);

	inline function set_inertiaZz(value:Float):Float { RigidBody3D_Ffi.set_inertiaZz(this, value); return value; }
	public var inertiaXy(get, set):Float;

	inline function get_inertiaXy():Float return RigidBody3D_Ffi.get_inertiaXy(this);

	inline function set_inertiaXy(value:Float):Float { RigidBody3D_Ffi.set_inertiaXy(this, value); return value; }
	public var inertiaXz(get, set):Float;

	inline function get_inertiaXz():Float return RigidBody3D_Ffi.get_inertiaXz(this);

	inline function set_inertiaXz(value:Float):Float { RigidBody3D_Ffi.set_inertiaXz(this, value); return value; }
	public var inertiaYz(get, set):Float;

	inline function get_inertiaYz():Float return RigidBody3D_Ffi.get_inertiaYz(this);

	inline function set_inertiaYz(value:Float):Float { RigidBody3D_Ffi.set_inertiaYz(this, value); return value; }
	public var inverseInertiaXx(get, set):Float;

	inline function get_inverseInertiaXx():Float return RigidBody3D_Ffi.get_inverseInertiaXx(this);

	inline function set_inverseInertiaXx(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaXx(this, value); return value; }
	public var inverseInertiaYy(get, set):Float;

	inline function get_inverseInertiaYy():Float return RigidBody3D_Ffi.get_inverseInertiaYy(this);

	inline function set_inverseInertiaYy(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaYy(this, value); return value; }
	public var inverseInertiaZz(get, set):Float;

	inline function get_inverseInertiaZz():Float return RigidBody3D_Ffi.get_inverseInertiaZz(this);

	inline function set_inverseInertiaZz(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaZz(this, value); return value; }
	public var inverseInertiaXy(get, set):Float;

	inline function get_inverseInertiaXy():Float return RigidBody3D_Ffi.get_inverseInertiaXy(this);

	inline function set_inverseInertiaXy(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaXy(this, value); return value; }
	public var inverseInertiaXz(get, set):Float;

	inline function get_inverseInertiaXz():Float return RigidBody3D_Ffi.get_inverseInertiaXz(this);

	inline function set_inverseInertiaXz(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaXz(this, value); return value; }
	public var inverseInertiaYz(get, set):Float;

	inline function get_inverseInertiaYz():Float return RigidBody3D_Ffi.get_inverseInertiaYz(this);

	inline function set_inverseInertiaYz(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaYz(this, value); return value; }
	public var inverseInertiaWorldXx(get, set):Float;

	inline function get_inverseInertiaWorldXx():Float return RigidBody3D_Ffi.get_inverseInertiaWorldXx(this);

	inline function set_inverseInertiaWorldXx(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaWorldXx(this, value); return value; }
	public var inverseInertiaWorldYy(get, set):Float;

	inline function get_inverseInertiaWorldYy():Float return RigidBody3D_Ffi.get_inverseInertiaWorldYy(this);

	inline function set_inverseInertiaWorldYy(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaWorldYy(this, value); return value; }
	public var inverseInertiaWorldZz(get, set):Float;

	inline function get_inverseInertiaWorldZz():Float return RigidBody3D_Ffi.get_inverseInertiaWorldZz(this);

	inline function set_inverseInertiaWorldZz(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaWorldZz(this, value); return value; }
	public var inverseInertiaWorldXy(get, set):Float;

	inline function get_inverseInertiaWorldXy():Float return RigidBody3D_Ffi.get_inverseInertiaWorldXy(this);

	inline function set_inverseInertiaWorldXy(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaWorldXy(this, value); return value; }
	public var inverseInertiaWorldXz(get, set):Float;

	inline function get_inverseInertiaWorldXz():Float return RigidBody3D_Ffi.get_inverseInertiaWorldXz(this);

	inline function set_inverseInertiaWorldXz(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaWorldXz(this, value); return value; }
	public var inverseInertiaWorldYz(get, set):Float;

	inline function get_inverseInertiaWorldYz():Float return RigidBody3D_Ffi.get_inverseInertiaWorldYz(this);

	inline function set_inverseInertiaWorldYz(value:Float):Float { RigidBody3D_Ffi.set_inverseInertiaWorldYz(this, value); return value; }
	public var centerX(get, set):Float;

	inline function get_centerX():Float return RigidBody3D_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float { RigidBody3D_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return RigidBody3D_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float { RigidBody3D_Ffi.set_centerY(this, value); return value; }
	public var centerZ(get, set):Float;

	inline function get_centerZ():Float return RigidBody3D_Ffi.get_centerZ(this);

	inline function set_centerZ(value:Float):Float { RigidBody3D_Ffi.set_centerZ(this, value); return value; }
	public var linearDamping(get, set):Float;

	inline function get_linearDamping():Float return RigidBody3D_Ffi.get_linearDamping(this);

	inline function set_linearDamping(value:Float):Float { RigidBody3D_Ffi.set_linearDamping(this, value); return value; }
	public var angularDamping(get, set):Float;

	inline function get_angularDamping():Float return RigidBody3D_Ffi.get_angularDamping(this);

	inline function set_angularDamping(value:Float):Float { RigidBody3D_Ffi.set_angularDamping(this, value); return value; }
	public var gravityScale(get, set):Float;

	inline function get_gravityScale():Float return RigidBody3D_Ffi.get_gravityScale(this);

	inline function set_gravityScale(value:Float):Float { RigidBody3D_Ffi.set_gravityScale(this, value); return value; }
	public var fixedRotation(get, set):Bool;

	inline function get_fixedRotation():Bool return RigidBody3D_Ffi.get_fixedRotation(this);

	inline function set_fixedRotation(value:Bool):Bool { RigidBody3D_Ffi.set_fixedRotation(this, value); return value; }
	public var bullet(get, set):Bool;

	inline function get_bullet():Bool return RigidBody3D_Ffi.get_bullet(this);

	inline function set_bullet(value:Bool):Bool { RigidBody3D_Ffi.set_bullet(this, value); return value; }
	public var sleeping(get, set):Bool;

	inline function get_sleeping():Bool return RigidBody3D_Ffi.get_sleeping(this);

	inline function set_sleeping(value:Bool):Bool { RigidBody3D_Ffi.set_sleeping(this, value); return value; }
	public var sleepEnabled(get, set):Bool;

	inline function get_sleepEnabled():Bool return RigidBody3D_Ffi.get_sleepEnabled(this);

	inline function set_sleepEnabled(value:Bool):Bool { RigidBody3D_Ffi.set_sleepEnabled(this, value); return value; }
	public var sleepTimer(get, set):Float;

	inline function get_sleepTimer():Float return RigidBody3D_Ffi.get_sleepTimer(this);

	inline function set_sleepTimer(value:Float):Float { RigidBody3D_Ffi.set_sleepTimer(this, value); return value; }
}
