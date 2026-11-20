package flight._hl;

abstract Physics3DSolverConfig(hl.Bytes) {
	public var allowSleeping(get, set):Bool;

	inline function get_allowSleeping():Bool return this.getUI8(96) != 0;

	inline function set_allowSleeping(value:Bool):Bool { this.setUI8(96, value ? 1 : 0); return value; }
	public var sleepLinearThreshold(get, set):Float;

	inline function get_sleepLinearThreshold():Float return this.getF64(0);

	inline function set_sleepLinearThreshold(value:Float):Float { this.setF64(0, value); return value; }
	public var sleepAngularThreshold(get, set):Float;

	inline function get_sleepAngularThreshold():Float return this.getF64(8);

	inline function set_sleepAngularThreshold(value:Float):Float { this.setF64(8, value); return value; }
	public var timeToSleep(get, set):Float;

	inline function get_timeToSleep():Float return this.getF64(16);

	inline function set_timeToSleep(value:Float):Float { this.setF64(16, value); return value; }
	public var substeps(get, set):Int;

	inline function get_substeps():Int return this.getI32(24);

	inline function set_substeps(value:Int):Int { this.setI32(24, value); return value; }
	public var continuousCollision(get, set):Bool;

	inline function get_continuousCollision():Bool return this.getUI8(97) != 0;

	inline function set_continuousCollision(value:Bool):Bool { this.setUI8(97, value ? 1 : 0); return value; }
	public var maxCcdSubsteps(get, set):Int;

	inline function get_maxCcdSubsteps():Int return this.getI32(32);

	inline function set_maxCcdSubsteps(value:Int):Int { this.setI32(32, value); return value; }
	public var maxCcdRotationSubsteps(get, set):Int;

	inline function get_maxCcdRotationSubsteps():Int return this.getI32(40);

	inline function set_maxCcdRotationSubsteps(value:Int):Int { this.setI32(40, value); return value; }
}
