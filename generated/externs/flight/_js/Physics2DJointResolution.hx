package flight._js;

abstract Physics2DJointResolution(Dynamic) {
	public var bodyA(get, set):Int;
	inline function get_bodyA():Int return untyped this.bodyA;
	inline function set_bodyA(value:Int):Int return untyped this.bodyA = value;
	public var bodyAFound(get, set):Bool;
	inline function get_bodyAFound():Bool return untyped this.bodyAFound;
	inline function set_bodyAFound(value:Bool):Bool return untyped this.bodyAFound = value;
	public var bodyAUsed(get, set):Bool;
	inline function get_bodyAUsed():Bool return untyped this.bodyAUsed;
	inline function set_bodyAUsed(value:Bool):Bool return untyped this.bodyAUsed = value;
	public var bodyB(get, set):Int;
	inline function get_bodyB():Int return untyped this.bodyB;
	inline function set_bodyB(value:Int):Int return untyped this.bodyB = value;
	public var bodyBFound(get, set):Bool;
	inline function get_bodyBFound():Bool return untyped this.bodyBFound;
	inline function set_bodyBFound(value:Bool):Bool return untyped this.bodyBFound = value;
	public var jointIndex(get, set):Int;
	inline function get_jointIndex():Int return untyped this.jointIndex;
	inline function set_jointIndex(value:Int):Int return untyped this.jointIndex = value;
	public var solverRegistered(get, set):Bool;
	inline function get_solverRegistered():Bool return untyped this.solverRegistered;
	inline function set_solverRegistered(value:Bool):Bool return untyped this.solverRegistered = value;
}
