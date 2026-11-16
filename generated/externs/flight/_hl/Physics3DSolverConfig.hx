package flight._hl;

abstract Physics3DSolverConfig(hl.Bytes) {
	public var allowSleeping(get, set):Bool;

	inline function get_allowSleeping():Bool return this.getUI8(68) != 0;

	inline function set_allowSleeping(value:Bool):Bool { this.setUI8(68, value ? 1 : 0); return value; }
	public var sleepLinearThreshold(get, set):Single;

	inline function get_sleepLinearThreshold():Single return this.getF32(56);

	inline function set_sleepLinearThreshold(value:Single):Single { this.setF32(56, value); return value; }
	public var sleepAngularThreshold(get, set):Single;

	inline function get_sleepAngularThreshold():Single return this.getF32(60);

	inline function set_sleepAngularThreshold(value:Single):Single { this.setF32(60, value); return value; }
	public var timeToSleep(get, set):Single;

	inline function get_timeToSleep():Single return this.getF32(64);

	inline function set_timeToSleep(value:Single):Single { this.setF32(64, value); return value; }
	public var substeps(get, set):Int;

	inline function get_substeps():Int return this.getI32(0);

	inline function set_substeps(value:Int):Int { this.setI32(0, value); return value; }
	public var continuousCollision(get, set):Bool;

	inline function get_continuousCollision():Bool return this.getUI8(69) != 0;

	inline function set_continuousCollision(value:Bool):Bool { this.setUI8(69, value ? 1 : 0); return value; }
	public var maxCcdSubsteps(get, set):Int;

	inline function get_maxCcdSubsteps():Int return this.getI32(8);

	inline function set_maxCcdSubsteps(value:Int):Int { this.setI32(8, value); return value; }
	public var maxCcdRotationSubsteps(get, set):Int;

	inline function get_maxCcdRotationSubsteps():Int return this.getI32(16);

	inline function set_maxCcdRotationSubsteps(value:Int):Int { this.setI32(16, value); return value; }
}
