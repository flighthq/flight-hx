package flight._hl;

abstract Physics3DDistanceJoint(hl.Bytes) {
	public var length(get, set):Single;

	inline function get_length():Single return this.getF32(168);

	inline function set_length(value:Single):Single { this.setF32(168, value); return value; }
	public var enableSpring(get, set):Bool;

	inline function get_enableSpring():Bool return this.getUI8(196) != 0;

	inline function set_enableSpring(value:Bool):Bool { this.setUI8(196, value ? 1 : 0); return value; }
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return this.getF32(172);

	inline function set_frequencyHz(value:Single):Single { this.setF32(172, value); return value; }
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return this.getF32(176);

	inline function set_dampingRatio(value:Single):Single { this.setF32(176, value); return value; }
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return this.getUI8(197) != 0;

	inline function set_enableLimit(value:Bool):Bool { this.setUI8(197, value ? 1 : 0); return value; }
	public var minLength(get, set):Single;

	inline function get_minLength():Single return this.getF32(180);

	inline function set_minLength(value:Single):Single { this.setF32(180, value); return value; }
	public var maxLength(get, set):Single;

	inline function get_maxLength():Single return this.getF32(184);

	inline function set_maxLength(value:Single):Single { this.setF32(184, value); return value; }
	public var lowerLimitImpulse(get, set):Single;

	inline function get_lowerLimitImpulse():Single return this.getF32(188);

	inline function set_lowerLimitImpulse(value:Single):Single { this.setF32(188, value); return value; }
	public var upperLimitImpulse(get, set):Single;

	inline function get_upperLimitImpulse():Single return this.getF32(192);

	inline function set_upperLimitImpulse(value:Single):Single { this.setF32(192, value); return value; }
}
