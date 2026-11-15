package flight._hl;

abstract Physics2DSolverConfig(hl.Bytes) {
	public var allowSleeping(get, set):Bool;

	inline function get_allowSleeping():Bool return this.getUI8(0) != 0;

	inline function set_allowSleeping(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var continuousCollision(get, set):Bool;

	inline function get_continuousCollision():Bool return this.getUI8(1) != 0;

	inline function set_continuousCollision(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
	public var maxCcdRotationSubsteps(get, set):Int;

	inline function get_maxCcdRotationSubsteps():Int return this.getI32(4);

	inline function set_maxCcdRotationSubsteps(value:Int):Int { this.setI32(4, value); return value; }
	public var maxCcdSubsteps(get, set):Int;

	inline function get_maxCcdSubsteps():Int return this.getI32(8);

	inline function set_maxCcdSubsteps(value:Int):Int { this.setI32(8, value); return value; }
	public var penetrationSlop(get, set):Single;

	inline function get_penetrationSlop():Single return this.getF32(12);

	inline function set_penetrationSlop(value:Single):Single { this.setF32(12, value); return value; }
	public var positionCorrection(get, set):Single;

	inline function get_positionCorrection():Single return this.getF32(16);

	inline function set_positionCorrection(value:Single):Single { this.setF32(16, value); return value; }
	public var positionIterations(get, set):Int;

	inline function get_positionIterations():Int return this.getI32(20);

	inline function set_positionIterations(value:Int):Int { this.setI32(20, value); return value; }
	public var restitutionThreshold(get, set):Single;

	inline function get_restitutionThreshold():Single return this.getF32(24);

	inline function set_restitutionThreshold(value:Single):Single { this.setF32(24, value); return value; }
	public var sleepAngularThreshold(get, set):Single;

	inline function get_sleepAngularThreshold():Single return this.getF32(28);

	inline function set_sleepAngularThreshold(value:Single):Single { this.setF32(28, value); return value; }
	public var sleepLinearThreshold(get, set):Single;

	inline function get_sleepLinearThreshold():Single return this.getF32(32);

	inline function set_sleepLinearThreshold(value:Single):Single { this.setF32(32, value); return value; }
	public var timeToSleep(get, set):Single;

	inline function get_timeToSleep():Single return this.getF32(36);

	inline function set_timeToSleep(value:Single):Single { this.setF32(36, value); return value; }
	public var velocityIterations(get, set):Int;

	inline function get_velocityIterations():Int return this.getI32(40);

	inline function set_velocityIterations(value:Int):Int { this.setI32(40, value); return value; }
	public var warmStarting(get, set):Bool;

	inline function get_warmStarting():Bool return this.getUI8(44) != 0;

	inline function set_warmStarting(value:Bool):Bool { this.setUI8(44, value ? 1 : 0); return value; }
}
