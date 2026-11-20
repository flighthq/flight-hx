package flight._hl;

abstract Physics3DDistanceJoint(hl.Bytes) {
	public var length(get, set):Float;

	inline function get_length():Float return this.getF64(248);

	inline function set_length(value:Float):Float { this.setF64(248, value); return value; }
	public var enableSpring(get, set):Bool;

	inline function get_enableSpring():Bool return this.getUI8(304) != 0;

	inline function set_enableSpring(value:Bool):Bool { this.setUI8(304, value ? 1 : 0); return value; }
	public var frequencyHz(get, set):Float;

	inline function get_frequencyHz():Float return this.getF64(256);

	inline function set_frequencyHz(value:Float):Float { this.setF64(256, value); return value; }
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return this.getF64(264);

	inline function set_dampingRatio(value:Float):Float { this.setF64(264, value); return value; }
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return this.getUI8(305) != 0;

	inline function set_enableLimit(value:Bool):Bool { this.setUI8(305, value ? 1 : 0); return value; }
	public var minLength(get, set):Float;

	inline function get_minLength():Float return this.getF64(272);

	inline function set_minLength(value:Float):Float { this.setF64(272, value); return value; }
	public var maxLength(get, set):Float;

	inline function get_maxLength():Float return this.getF64(280);

	inline function set_maxLength(value:Float):Float { this.setF64(280, value); return value; }
	public var lowerLimitImpulse(get, set):Float;

	inline function get_lowerLimitImpulse():Float return this.getF64(288);

	inline function set_lowerLimitImpulse(value:Float):Float { this.setF64(288, value); return value; }
	public var upperLimitImpulse(get, set):Float;

	inline function get_upperLimitImpulse():Float return this.getF64(296);

	inline function set_upperLimitImpulse(value:Float):Float { this.setF64(296, value); return value; }
}
