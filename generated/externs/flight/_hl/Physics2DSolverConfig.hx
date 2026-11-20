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
	public var penetrationSlop(get, set):Float;

	inline function get_penetrationSlop():Float return this.getF64(16);

	inline function set_penetrationSlop(value:Float):Float { this.setF64(16, value); return value; }
	public var positionCorrection(get, set):Float;

	inline function get_positionCorrection():Float return this.getF64(24);

	inline function set_positionCorrection(value:Float):Float { this.setF64(24, value); return value; }
	public var positionIterations(get, set):Int;

	inline function get_positionIterations():Int return this.getI32(32);

	inline function set_positionIterations(value:Int):Int { this.setI32(32, value); return value; }
	public var restitutionThreshold(get, set):Float;

	inline function get_restitutionThreshold():Float return this.getF64(40);

	inline function set_restitutionThreshold(value:Float):Float { this.setF64(40, value); return value; }
	public var sleepAngularThreshold(get, set):Float;

	inline function get_sleepAngularThreshold():Float return this.getF64(48);

	inline function set_sleepAngularThreshold(value:Float):Float { this.setF64(48, value); return value; }
	public var sleepLinearThreshold(get, set):Float;

	inline function get_sleepLinearThreshold():Float return this.getF64(56);

	inline function set_sleepLinearThreshold(value:Float):Float { this.setF64(56, value); return value; }
	public var timeToSleep(get, set):Float;

	inline function get_timeToSleep():Float return this.getF64(64);

	inline function set_timeToSleep(value:Float):Float { this.setF64(64, value); return value; }
	public var velocityIterations(get, set):Int;

	inline function get_velocityIterations():Int return this.getI32(72);

	inline function set_velocityIterations(value:Int):Int { this.setI32(72, value); return value; }
	public var warmStarting(get, set):Bool;

	inline function get_warmStarting():Bool return this.getUI8(76) != 0;

	inline function set_warmStarting(value:Bool):Bool { this.setUI8(76, value ? 1 : 0); return value; }
}
