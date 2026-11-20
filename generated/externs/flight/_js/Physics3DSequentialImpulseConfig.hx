package flight._js;

abstract Physics3DSequentialImpulseConfig(Dynamic) {
	public var velocityIterations(get, set):Int;
	inline function get_velocityIterations():Int return untyped this.velocityIterations;
	inline function set_velocityIterations(value:Int):Int return untyped this.velocityIterations = value;
	public var positionIterations(get, set):Int;
	inline function get_positionIterations():Int return untyped this.positionIterations;
	inline function set_positionIterations(value:Int):Int return untyped this.positionIterations = value;
	public var penetrationSlop(get, set):Float;
	inline function get_penetrationSlop():Float return untyped this.penetrationSlop;
	inline function set_penetrationSlop(value:Float):Float return untyped this.penetrationSlop = value;
	public var positionCorrection(get, set):Float;
	inline function get_positionCorrection():Float return untyped this.positionCorrection;
	inline function set_positionCorrection(value:Float):Float return untyped this.positionCorrection = value;
	public var restitutionThreshold(get, set):Float;
	inline function get_restitutionThreshold():Float return untyped this.restitutionThreshold;
	inline function set_restitutionThreshold(value:Float):Float return untyped this.restitutionThreshold = value;
	public var warmStarting(get, set):Bool;
	inline function get_warmStarting():Bool return untyped this.warmStarting;
	inline function set_warmStarting(value:Bool):Bool return untyped this.warmStarting = value;
}
