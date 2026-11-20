package flight._js;

abstract Physics3DSolverConfig(Dynamic) {
	public var allowSleeping(get, set):Bool;
	inline function get_allowSleeping():Bool return untyped this.allowSleeping;
	inline function set_allowSleeping(value:Bool):Bool return untyped this.allowSleeping = value;
	public var sleepLinearThreshold(get, set):Float;
	inline function get_sleepLinearThreshold():Float return untyped this.sleepLinearThreshold;
	inline function set_sleepLinearThreshold(value:Float):Float return untyped this.sleepLinearThreshold = value;
	public var sleepAngularThreshold(get, set):Float;
	inline function get_sleepAngularThreshold():Float return untyped this.sleepAngularThreshold;
	inline function set_sleepAngularThreshold(value:Float):Float return untyped this.sleepAngularThreshold = value;
	public var timeToSleep(get, set):Float;
	inline function get_timeToSleep():Float return untyped this.timeToSleep;
	inline function set_timeToSleep(value:Float):Float return untyped this.timeToSleep = value;
	public var substeps(get, set):Int;
	inline function get_substeps():Int return untyped this.substeps;
	inline function set_substeps(value:Int):Int return untyped this.substeps = value;
	public var continuousCollision(get, set):Bool;
	inline function get_continuousCollision():Bool return untyped this.continuousCollision;
	inline function set_continuousCollision(value:Bool):Bool return untyped this.continuousCollision = value;
	public var maxCcdSubsteps(get, set):Int;
	inline function get_maxCcdSubsteps():Int return untyped this.maxCcdSubsteps;
	inline function set_maxCcdSubsteps(value:Int):Int return untyped this.maxCcdSubsteps = value;
	public var maxCcdRotationSubsteps(get, set):Int;
	inline function get_maxCcdRotationSubsteps():Int return untyped this.maxCcdRotationSubsteps;
	inline function set_maxCcdRotationSubsteps(value:Int):Int return untyped this.maxCcdRotationSubsteps = value;
}
