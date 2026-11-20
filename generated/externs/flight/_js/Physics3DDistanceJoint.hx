package flight._js;

abstract Physics3DDistanceJoint(Dynamic) {
	public var length(get, set):Float;
	inline function get_length():Float return untyped this.length;
	inline function set_length(value:Float):Float return untyped this.length = value;
	public var enableSpring(get, set):Bool;
	inline function get_enableSpring():Bool return untyped this.enableSpring;
	inline function set_enableSpring(value:Bool):Bool return untyped this.enableSpring = value;
	public var frequencyHz(get, set):Float;
	inline function get_frequencyHz():Float return untyped this.frequencyHz;
	inline function set_frequencyHz(value:Float):Float return untyped this.frequencyHz = value;
	public var dampingRatio(get, set):Float;
	inline function get_dampingRatio():Float return untyped this.dampingRatio;
	inline function set_dampingRatio(value:Float):Float return untyped this.dampingRatio = value;
	public var enableLimit(get, set):Bool;
	inline function get_enableLimit():Bool return untyped this.enableLimit;
	inline function set_enableLimit(value:Bool):Bool return untyped this.enableLimit = value;
	public var minLength(get, set):Float;
	inline function get_minLength():Float return untyped this.minLength;
	inline function set_minLength(value:Float):Float return untyped this.minLength = value;
	public var maxLength(get, set):Float;
	inline function get_maxLength():Float return untyped this.maxLength;
	inline function set_maxLength(value:Float):Float return untyped this.maxLength = value;
	public var lowerLimitImpulse(get, set):Float;
	inline function get_lowerLimitImpulse():Float return untyped this.lowerLimitImpulse;
	inline function set_lowerLimitImpulse(value:Float):Float return untyped this.lowerLimitImpulse = value;
	public var upperLimitImpulse(get, set):Float;
	inline function get_upperLimitImpulse():Float return untyped this.upperLimitImpulse;
	inline function set_upperLimitImpulse(value:Float):Float return untyped this.upperLimitImpulse = value;
}
