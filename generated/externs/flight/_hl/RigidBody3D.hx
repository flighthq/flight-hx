package flight._hl;

abstract RigidBody3D(hl.Bytes) {
	public var index(get, set):Int;

	inline function get_index():Int return this.getI32(52);

	inline function set_index(value:Int):Int { this.setI32(52, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(56);

	inline function set_x(value:Single):Single { this.setF32(56, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(60);

	inline function set_y(value:Single):Single { this.setF32(60, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(64);

	inline function set_z(value:Single):Single { this.setF32(64, value); return value; }
	public var orientationX(get, set):Single;

	inline function get_orientationX():Single return this.getF32(68);

	inline function set_orientationX(value:Single):Single { this.setF32(68, value); return value; }
	public var orientationY(get, set):Single;

	inline function get_orientationY():Single return this.getF32(72);

	inline function set_orientationY(value:Single):Single { this.setF32(72, value); return value; }
	public var orientationZ(get, set):Single;

	inline function get_orientationZ():Single return this.getF32(76);

	inline function set_orientationZ(value:Single):Single { this.setF32(76, value); return value; }
	public var orientationW(get, set):Single;

	inline function get_orientationW():Single return this.getF32(80);

	inline function set_orientationW(value:Single):Single { this.setF32(80, value); return value; }
	public var velocityX(get, set):Single;

	inline function get_velocityX():Single return this.getF32(84);

	inline function set_velocityX(value:Single):Single { this.setF32(84, value); return value; }
	public var velocityY(get, set):Single;

	inline function get_velocityY():Single return this.getF32(88);

	inline function set_velocityY(value:Single):Single { this.setF32(88, value); return value; }
	public var velocityZ(get, set):Single;

	inline function get_velocityZ():Single return this.getF32(92);

	inline function set_velocityZ(value:Single):Single { this.setF32(92, value); return value; }
	public var angularVelocityX(get, set):Single;

	inline function get_angularVelocityX():Single return this.getF32(96);

	inline function set_angularVelocityX(value:Single):Single { this.setF32(96, value); return value; }
	public var angularVelocityY(get, set):Single;

	inline function get_angularVelocityY():Single return this.getF32(100);

	inline function set_angularVelocityY(value:Single):Single { this.setF32(100, value); return value; }
	public var angularVelocityZ(get, set):Single;

	inline function get_angularVelocityZ():Single return this.getF32(104);

	inline function set_angularVelocityZ(value:Single):Single { this.setF32(104, value); return value; }
	public var forceX(get, set):Single;

	inline function get_forceX():Single return this.getF32(108);

	inline function set_forceX(value:Single):Single { this.setF32(108, value); return value; }
	public var forceY(get, set):Single;

	inline function get_forceY():Single return this.getF32(112);

	inline function set_forceY(value:Single):Single { this.setF32(112, value); return value; }
	public var forceZ(get, set):Single;

	inline function get_forceZ():Single return this.getF32(116);

	inline function set_forceZ(value:Single):Single { this.setF32(116, value); return value; }
	public var torqueX(get, set):Single;

	inline function get_torqueX():Single return this.getF32(120);

	inline function set_torqueX(value:Single):Single { this.setF32(120, value); return value; }
	public var torqueY(get, set):Single;

	inline function get_torqueY():Single return this.getF32(124);

	inline function set_torqueY(value:Single):Single { this.setF32(124, value); return value; }
	public var torqueZ(get, set):Single;

	inline function get_torqueZ():Single return this.getF32(128);

	inline function set_torqueZ(value:Single):Single { this.setF32(128, value); return value; }
	public var mass(get, set):Single;

	inline function get_mass():Single return this.getF32(132);

	inline function set_mass(value:Single):Single { this.setF32(132, value); return value; }
	public var inverseMass(get, set):Single;

	inline function get_inverseMass():Single return this.getF32(136);

	inline function set_inverseMass(value:Single):Single { this.setF32(136, value); return value; }
	public var inertiaXx(get, set):Single;

	inline function get_inertiaXx():Single return this.getF32(140);

	inline function set_inertiaXx(value:Single):Single { this.setF32(140, value); return value; }
	public var inertiaYy(get, set):Single;

	inline function get_inertiaYy():Single return this.getF32(144);

	inline function set_inertiaYy(value:Single):Single { this.setF32(144, value); return value; }
	public var inertiaZz(get, set):Single;

	inline function get_inertiaZz():Single return this.getF32(148);

	inline function set_inertiaZz(value:Single):Single { this.setF32(148, value); return value; }
	public var inertiaXy(get, set):Single;

	inline function get_inertiaXy():Single return this.getF32(152);

	inline function set_inertiaXy(value:Single):Single { this.setF32(152, value); return value; }
	public var inertiaXz(get, set):Single;

	inline function get_inertiaXz():Single return this.getF32(156);

	inline function set_inertiaXz(value:Single):Single { this.setF32(156, value); return value; }
	public var inertiaYz(get, set):Single;

	inline function get_inertiaYz():Single return this.getF32(160);

	inline function set_inertiaYz(value:Single):Single { this.setF32(160, value); return value; }
	public var inverseInertiaXx(get, set):Single;

	inline function get_inverseInertiaXx():Single return this.getF32(164);

	inline function set_inverseInertiaXx(value:Single):Single { this.setF32(164, value); return value; }
	public var inverseInertiaYy(get, set):Single;

	inline function get_inverseInertiaYy():Single return this.getF32(168);

	inline function set_inverseInertiaYy(value:Single):Single { this.setF32(168, value); return value; }
	public var inverseInertiaZz(get, set):Single;

	inline function get_inverseInertiaZz():Single return this.getF32(172);

	inline function set_inverseInertiaZz(value:Single):Single { this.setF32(172, value); return value; }
	public var inverseInertiaXy(get, set):Single;

	inline function get_inverseInertiaXy():Single return this.getF32(176);

	inline function set_inverseInertiaXy(value:Single):Single { this.setF32(176, value); return value; }
	public var inverseInertiaXz(get, set):Single;

	inline function get_inverseInertiaXz():Single return this.getF32(180);

	inline function set_inverseInertiaXz(value:Single):Single { this.setF32(180, value); return value; }
	public var inverseInertiaYz(get, set):Single;

	inline function get_inverseInertiaYz():Single return this.getF32(184);

	inline function set_inverseInertiaYz(value:Single):Single { this.setF32(184, value); return value; }
	public var inverseInertiaWorldXx(get, set):Single;

	inline function get_inverseInertiaWorldXx():Single return this.getF32(188);

	inline function set_inverseInertiaWorldXx(value:Single):Single { this.setF32(188, value); return value; }
	public var inverseInertiaWorldYy(get, set):Single;

	inline function get_inverseInertiaWorldYy():Single return this.getF32(192);

	inline function set_inverseInertiaWorldYy(value:Single):Single { this.setF32(192, value); return value; }
	public var inverseInertiaWorldZz(get, set):Single;

	inline function get_inverseInertiaWorldZz():Single return this.getF32(196);

	inline function set_inverseInertiaWorldZz(value:Single):Single { this.setF32(196, value); return value; }
	public var inverseInertiaWorldXy(get, set):Single;

	inline function get_inverseInertiaWorldXy():Single return this.getF32(200);

	inline function set_inverseInertiaWorldXy(value:Single):Single { this.setF32(200, value); return value; }
	public var inverseInertiaWorldXz(get, set):Single;

	inline function get_inverseInertiaWorldXz():Single return this.getF32(204);

	inline function set_inverseInertiaWorldXz(value:Single):Single { this.setF32(204, value); return value; }
	public var inverseInertiaWorldYz(get, set):Single;

	inline function get_inverseInertiaWorldYz():Single return this.getF32(208);

	inline function set_inverseInertiaWorldYz(value:Single):Single { this.setF32(208, value); return value; }
	public var centerX(get, set):Single;

	inline function get_centerX():Single return this.getF32(212);

	inline function set_centerX(value:Single):Single { this.setF32(212, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return this.getF32(216);

	inline function set_centerY(value:Single):Single { this.setF32(216, value); return value; }
	public var centerZ(get, set):Single;

	inline function get_centerZ():Single return this.getF32(220);

	inline function set_centerZ(value:Single):Single { this.setF32(220, value); return value; }
	public var linearDamping(get, set):Single;

	inline function get_linearDamping():Single return this.getF32(224);

	inline function set_linearDamping(value:Single):Single { this.setF32(224, value); return value; }
	public var angularDamping(get, set):Single;

	inline function get_angularDamping():Single return this.getF32(228);

	inline function set_angularDamping(value:Single):Single { this.setF32(228, value); return value; }
	public var gravityScale(get, set):Single;

	inline function get_gravityScale():Single return this.getF32(232);

	inline function set_gravityScale(value:Single):Single { this.setF32(232, value); return value; }
	public var fixedRotation(get, set):Bool;

	inline function get_fixedRotation():Bool return this.getUI8(240) != 0;

	inline function set_fixedRotation(value:Bool):Bool { this.setUI8(240, value ? 1 : 0); return value; }
	public var bullet(get, set):Bool;

	inline function get_bullet():Bool return this.getUI8(241) != 0;

	inline function set_bullet(value:Bool):Bool { this.setUI8(241, value ? 1 : 0); return value; }
	public var sleeping(get, set):Bool;

	inline function get_sleeping():Bool return this.getUI8(242) != 0;

	inline function set_sleeping(value:Bool):Bool { this.setUI8(242, value ? 1 : 0); return value; }
	public var sleepEnabled(get, set):Bool;

	inline function get_sleepEnabled():Bool return this.getUI8(243) != 0;

	inline function set_sleepEnabled(value:Bool):Bool { this.setUI8(243, value ? 1 : 0); return value; }
	public var sleepTimer(get, set):Single;

	inline function get_sleepTimer():Single return this.getF32(236);

	inline function set_sleepTimer(value:Single):Single { this.setF32(236, value); return value; }
}
