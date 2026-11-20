package flight._hl;

abstract RigidBody3D(hl.Bytes) {
	public var index(get, set):Int;

	inline function get_index():Int return this.getI32(420);

	inline function set_index(value:Int):Int { this.setI32(420, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(40);

	inline function set_x(value:Float):Float { this.setF64(40, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(48);

	inline function set_y(value:Float):Float { this.setF64(48, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(56);

	inline function set_z(value:Float):Float { this.setF64(56, value); return value; }
	public var orientationX(get, set):Float;

	inline function get_orientationX():Float return this.getF64(64);

	inline function set_orientationX(value:Float):Float { this.setF64(64, value); return value; }
	public var orientationY(get, set):Float;

	inline function get_orientationY():Float return this.getF64(72);

	inline function set_orientationY(value:Float):Float { this.setF64(72, value); return value; }
	public var orientationZ(get, set):Float;

	inline function get_orientationZ():Float return this.getF64(80);

	inline function set_orientationZ(value:Float):Float { this.setF64(80, value); return value; }
	public var orientationW(get, set):Float;

	inline function get_orientationW():Float return this.getF64(88);

	inline function set_orientationW(value:Float):Float { this.setF64(88, value); return value; }
	public var velocityX(get, set):Float;

	inline function get_velocityX():Float return this.getF64(96);

	inline function set_velocityX(value:Float):Float { this.setF64(96, value); return value; }
	public var velocityY(get, set):Float;

	inline function get_velocityY():Float return this.getF64(104);

	inline function set_velocityY(value:Float):Float { this.setF64(104, value); return value; }
	public var velocityZ(get, set):Float;

	inline function get_velocityZ():Float return this.getF64(112);

	inline function set_velocityZ(value:Float):Float { this.setF64(112, value); return value; }
	public var angularVelocityX(get, set):Float;

	inline function get_angularVelocityX():Float return this.getF64(120);

	inline function set_angularVelocityX(value:Float):Float { this.setF64(120, value); return value; }
	public var angularVelocityY(get, set):Float;

	inline function get_angularVelocityY():Float return this.getF64(128);

	inline function set_angularVelocityY(value:Float):Float { this.setF64(128, value); return value; }
	public var angularVelocityZ(get, set):Float;

	inline function get_angularVelocityZ():Float return this.getF64(136);

	inline function set_angularVelocityZ(value:Float):Float { this.setF64(136, value); return value; }
	public var forceX(get, set):Float;

	inline function get_forceX():Float return this.getF64(144);

	inline function set_forceX(value:Float):Float { this.setF64(144, value); return value; }
	public var forceY(get, set):Float;

	inline function get_forceY():Float return this.getF64(152);

	inline function set_forceY(value:Float):Float { this.setF64(152, value); return value; }
	public var forceZ(get, set):Float;

	inline function get_forceZ():Float return this.getF64(160);

	inline function set_forceZ(value:Float):Float { this.setF64(160, value); return value; }
	public var torqueX(get, set):Float;

	inline function get_torqueX():Float return this.getF64(168);

	inline function set_torqueX(value:Float):Float { this.setF64(168, value); return value; }
	public var torqueY(get, set):Float;

	inline function get_torqueY():Float return this.getF64(176);

	inline function set_torqueY(value:Float):Float { this.setF64(176, value); return value; }
	public var torqueZ(get, set):Float;

	inline function get_torqueZ():Float return this.getF64(184);

	inline function set_torqueZ(value:Float):Float { this.setF64(184, value); return value; }
	public var mass(get, set):Float;

	inline function get_mass():Float return this.getF64(192);

	inline function set_mass(value:Float):Float { this.setF64(192, value); return value; }
	public var inverseMass(get, set):Float;

	inline function get_inverseMass():Float return this.getF64(200);

	inline function set_inverseMass(value:Float):Float { this.setF64(200, value); return value; }
	public var inertiaXx(get, set):Float;

	inline function get_inertiaXx():Float return this.getF64(208);

	inline function set_inertiaXx(value:Float):Float { this.setF64(208, value); return value; }
	public var inertiaYy(get, set):Float;

	inline function get_inertiaYy():Float return this.getF64(216);

	inline function set_inertiaYy(value:Float):Float { this.setF64(216, value); return value; }
	public var inertiaZz(get, set):Float;

	inline function get_inertiaZz():Float return this.getF64(224);

	inline function set_inertiaZz(value:Float):Float { this.setF64(224, value); return value; }
	public var inertiaXy(get, set):Float;

	inline function get_inertiaXy():Float return this.getF64(232);

	inline function set_inertiaXy(value:Float):Float { this.setF64(232, value); return value; }
	public var inertiaXz(get, set):Float;

	inline function get_inertiaXz():Float return this.getF64(240);

	inline function set_inertiaXz(value:Float):Float { this.setF64(240, value); return value; }
	public var inertiaYz(get, set):Float;

	inline function get_inertiaYz():Float return this.getF64(248);

	inline function set_inertiaYz(value:Float):Float { this.setF64(248, value); return value; }
	public var inverseInertiaXx(get, set):Float;

	inline function get_inverseInertiaXx():Float return this.getF64(256);

	inline function set_inverseInertiaXx(value:Float):Float { this.setF64(256, value); return value; }
	public var inverseInertiaYy(get, set):Float;

	inline function get_inverseInertiaYy():Float return this.getF64(264);

	inline function set_inverseInertiaYy(value:Float):Float { this.setF64(264, value); return value; }
	public var inverseInertiaZz(get, set):Float;

	inline function get_inverseInertiaZz():Float return this.getF64(272);

	inline function set_inverseInertiaZz(value:Float):Float { this.setF64(272, value); return value; }
	public var inverseInertiaXy(get, set):Float;

	inline function get_inverseInertiaXy():Float return this.getF64(280);

	inline function set_inverseInertiaXy(value:Float):Float { this.setF64(280, value); return value; }
	public var inverseInertiaXz(get, set):Float;

	inline function get_inverseInertiaXz():Float return this.getF64(288);

	inline function set_inverseInertiaXz(value:Float):Float { this.setF64(288, value); return value; }
	public var inverseInertiaYz(get, set):Float;

	inline function get_inverseInertiaYz():Float return this.getF64(296);

	inline function set_inverseInertiaYz(value:Float):Float { this.setF64(296, value); return value; }
	public var inverseInertiaWorldXx(get, set):Float;

	inline function get_inverseInertiaWorldXx():Float return this.getF64(304);

	inline function set_inverseInertiaWorldXx(value:Float):Float { this.setF64(304, value); return value; }
	public var inverseInertiaWorldYy(get, set):Float;

	inline function get_inverseInertiaWorldYy():Float return this.getF64(312);

	inline function set_inverseInertiaWorldYy(value:Float):Float { this.setF64(312, value); return value; }
	public var inverseInertiaWorldZz(get, set):Float;

	inline function get_inverseInertiaWorldZz():Float return this.getF64(320);

	inline function set_inverseInertiaWorldZz(value:Float):Float { this.setF64(320, value); return value; }
	public var inverseInertiaWorldXy(get, set):Float;

	inline function get_inverseInertiaWorldXy():Float return this.getF64(328);

	inline function set_inverseInertiaWorldXy(value:Float):Float { this.setF64(328, value); return value; }
	public var inverseInertiaWorldXz(get, set):Float;

	inline function get_inverseInertiaWorldXz():Float return this.getF64(336);

	inline function set_inverseInertiaWorldXz(value:Float):Float { this.setF64(336, value); return value; }
	public var inverseInertiaWorldYz(get, set):Float;

	inline function get_inverseInertiaWorldYz():Float return this.getF64(344);

	inline function set_inverseInertiaWorldYz(value:Float):Float { this.setF64(344, value); return value; }
	public var centerX(get, set):Float;

	inline function get_centerX():Float return this.getF64(352);

	inline function set_centerX(value:Float):Float { this.setF64(352, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return this.getF64(360);

	inline function set_centerY(value:Float):Float { this.setF64(360, value); return value; }
	public var centerZ(get, set):Float;

	inline function get_centerZ():Float return this.getF64(368);

	inline function set_centerZ(value:Float):Float { this.setF64(368, value); return value; }
	public var linearDamping(get, set):Float;

	inline function get_linearDamping():Float return this.getF64(376);

	inline function set_linearDamping(value:Float):Float { this.setF64(376, value); return value; }
	public var angularDamping(get, set):Float;

	inline function get_angularDamping():Float return this.getF64(384);

	inline function set_angularDamping(value:Float):Float { this.setF64(384, value); return value; }
	public var gravityScale(get, set):Float;

	inline function get_gravityScale():Float return this.getF64(392);

	inline function set_gravityScale(value:Float):Float { this.setF64(392, value); return value; }
	public var fixedRotation(get, set):Bool;

	inline function get_fixedRotation():Bool return this.getUI8(424) != 0;

	inline function set_fixedRotation(value:Bool):Bool { this.setUI8(424, value ? 1 : 0); return value; }
	public var bullet(get, set):Bool;

	inline function get_bullet():Bool return this.getUI8(425) != 0;

	inline function set_bullet(value:Bool):Bool { this.setUI8(425, value ? 1 : 0); return value; }
	public var sleeping(get, set):Bool;

	inline function get_sleeping():Bool return this.getUI8(426) != 0;

	inline function set_sleeping(value:Bool):Bool { this.setUI8(426, value ? 1 : 0); return value; }
	public var sleepEnabled(get, set):Bool;

	inline function get_sleepEnabled():Bool return this.getUI8(427) != 0;

	inline function set_sleepEnabled(value:Bool):Bool { this.setUI8(427, value ? 1 : 0); return value; }
	public var sleepTimer(get, set):Float;

	inline function get_sleepTimer():Float return this.getF64(400);

	inline function set_sleepTimer(value:Float):Float { this.setF64(400, value); return value; }
}
