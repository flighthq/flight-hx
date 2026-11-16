package flight._js;

abstract Physics2DMouseJointOptions(Dynamic) {
	public var body(get, set):Int;
	inline function get_body():Int return untyped this.body;
	inline function set_body(value:Int):Int return untyped this.body = value;
	public var maxForce(get, set):Float;
	inline function get_maxForce():Float return untyped this.maxForce;
	inline function set_maxForce(value:Float):Float return untyped this.maxForce = value;
	public var targetX(get, set):Float;
	inline function get_targetX():Float return untyped this.targetX;
	inline function set_targetX(value:Float):Float return untyped this.targetX = value;
	public var targetY(get, set):Float;
	inline function get_targetY():Float return untyped this.targetY;
	inline function set_targetY(value:Float):Float return untyped this.targetY = value;
}
