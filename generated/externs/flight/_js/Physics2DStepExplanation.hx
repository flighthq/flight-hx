package flight._js;

abstract Physics2DStepExplanation(Dynamic) {
	public var bodyStateValid(get, set):Bool;
	inline function get_bodyStateValid():Bool return untyped this["bodyStateValid"];
	inline function set_bodyStateValid(value:Bool):Bool return untyped this["bodyStateValid"] = value;
	public var contactStateValid(get, set):Bool;
	inline function get_contactStateValid():Bool return untyped this["contactStateValid"];
	inline function set_contactStateValid(value:Bool):Bool return untyped this["contactStateValid"] = value;
	public var gravityValid(get, set):Bool;
	inline function get_gravityValid():Bool return untyped this["gravityValid"];
	inline function set_gravityValid(value:Bool):Bool return untyped this["gravityValid"] = value;
	public var jointStateValid(get, set):Bool;
	inline function get_jointStateValid():Bool return untyped this["jointStateValid"];
	inline function set_jointStateValid(value:Bool):Bool return untyped this["jointStateValid"] = value;
	public var positionIterationsValid(get, set):Bool;
	inline function get_positionIterationsValid():Bool return untyped this["positionIterationsValid"];
	inline function set_positionIterationsValid(value:Bool):Bool return untyped this["positionIterationsValid"] = value;
	public var previousTimestepValid(get, set):Bool;
	inline function get_previousTimestepValid():Bool return untyped this["previousTimestepValid"];
	inline function set_previousTimestepValid(value:Bool):Bool return untyped this["previousTimestepValid"] = value;
	public var solverConfigValid(get, set):Bool;
	inline function get_solverConfigValid():Bool return untyped this["solverConfigValid"];
	inline function set_solverConfigValid(value:Bool):Bool return untyped this["solverConfigValid"] = value;
	public var timestepValid(get, set):Bool;
	inline function get_timestepValid():Bool return untyped this["timestepValid"];
	inline function set_timestepValid(value:Bool):Bool return untyped this["timestepValid"] = value;
	public var velocityIterationsValid(get, set):Bool;
	inline function get_velocityIterationsValid():Bool return untyped this["velocityIterationsValid"];
	inline function set_velocityIterationsValid(value:Bool):Bool return untyped this["velocityIterationsValid"] = value;
}
