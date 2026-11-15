package flight._hl;

abstract RigidBody2D(hl.Bytes) {
	public var angle(get, set):Single;

	inline function get_angle():Single return this.getF32(32);

	inline function set_angle(value:Single):Single { this.setF32(32, value); return value; }
	public var angularDamping(get, set):Single;

	inline function get_angularDamping():Single return this.getF32(36);

	inline function set_angularDamping(value:Single):Single { this.setF32(36, value); return value; }
	public var angularVelocity(get, set):Single;

	inline function get_angularVelocity():Single return this.getF32(40);

	inline function set_angularVelocity(value:Single):Single { this.setF32(40, value); return value; }
	public var bullet(get, set):Bool;

	inline function get_bullet():Bool return this.getUI8(48) != 0;

	inline function set_bullet(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var centerX(get, set):Single;

	inline function get_centerX():Single return this.getF32(52);

	inline function set_centerX(value:Single):Single { this.setF32(52, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return this.getF32(56);

	inline function set_centerY(value:Single):Single { this.setF32(56, value); return value; }
	public var fixedRotation(get, set):Bool;

	inline function get_fixedRotation():Bool return this.getUI8(88) != 0;

	inline function set_fixedRotation(value:Bool):Bool { this.setUI8(88, value ? 1 : 0); return value; }
	public var forceX(get, set):Single;

	inline function get_forceX():Single return this.getF32(92);

	inline function set_forceX(value:Single):Single { this.setF32(92, value); return value; }
	public var forceY(get, set):Single;

	inline function get_forceY():Single return this.getF32(96);

	inline function set_forceY(value:Single):Single { this.setF32(96, value); return value; }
	public var gravityScale(get, set):Single;

	inline function get_gravityScale():Single return this.getF32(100);

	inline function set_gravityScale(value:Single):Single { this.setF32(100, value); return value; }
	public var index(get, set):Int;

	inline function get_index():Int return this.getI32(104);

	inline function set_index(value:Int):Int { this.setI32(104, value); return value; }
	public var inertia(get, set):Single;

	inline function get_inertia():Single return this.getF32(108);

	inline function set_inertia(value:Single):Single { this.setF32(108, value); return value; }
	public var inverseInertia(get, set):Single;

	inline function get_inverseInertia():Single return this.getF32(112);

	inline function set_inverseInertia(value:Single):Single { this.setF32(112, value); return value; }
	public var inverseMass(get, set):Single;

	inline function get_inverseMass():Single return this.getF32(116);

	inline function set_inverseMass(value:Single):Single { this.setF32(116, value); return value; }
	public var linearDamping(get, set):Single;

	inline function get_linearDamping():Single return this.getF32(120);

	inline function set_linearDamping(value:Single):Single { this.setF32(120, value); return value; }
	public var mass(get, set):Single;

	inline function get_mass():Single return this.getF32(124);

	inline function set_mass(value:Single):Single { this.setF32(124, value); return value; }
	public var sleepEnabled(get, set):Bool;

	inline function get_sleepEnabled():Bool return this.getUI8(128) != 0;

	inline function set_sleepEnabled(value:Bool):Bool { this.setUI8(128, value ? 1 : 0); return value; }
	public var sleepTimer(get, set):Float;

	inline function get_sleepTimer():Float return this.getF64(136);

	inline function set_sleepTimer(value:Float):Float { this.setF64(136, value); return value; }
	public var sleeping(get, set):Bool;

	inline function get_sleeping():Bool return this.getUI8(144) != 0;

	inline function set_sleeping(value:Bool):Bool { this.setUI8(144, value ? 1 : 0); return value; }
	public var torque(get, set):Single;

	inline function get_torque():Single return this.getF32(148);

	inline function set_torque(value:Single):Single { this.setF32(148, value); return value; }
	public var velocityX(get, set):Single;

	inline function get_velocityX():Single return this.getF32(152);

	inline function set_velocityX(value:Single):Single { this.setF32(152, value); return value; }
	public var velocityY(get, set):Single;

	inline function get_velocityY():Single return this.getF32(156);

	inline function set_velocityY(value:Single):Single { this.setF32(156, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(160);

	inline function set_x(value:Single):Single { this.setF32(160, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(164);

	inline function set_y(value:Single):Single { this.setF32(164, value); return value; }
}
