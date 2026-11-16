package flight._hl;

abstract Physics3DGeneric6DofJoint(hl.Bytes) {
	public var lowerLinearX(get, set):Single;

	inline function get_lowerLinearX():Single return this.getF32(248);

	inline function set_lowerLinearX(value:Single):Single { this.setF32(248, value); return value; }
	public var lowerLinearY(get, set):Single;

	inline function get_lowerLinearY():Single return this.getF32(252);

	inline function set_lowerLinearY(value:Single):Single { this.setF32(252, value); return value; }
	public var lowerLinearZ(get, set):Single;

	inline function get_lowerLinearZ():Single return this.getF32(256);

	inline function set_lowerLinearZ(value:Single):Single { this.setF32(256, value); return value; }
	public var upperLinearX(get, set):Single;

	inline function get_upperLinearX():Single return this.getF32(260);

	inline function set_upperLinearX(value:Single):Single { this.setF32(260, value); return value; }
	public var upperLinearY(get, set):Single;

	inline function get_upperLinearY():Single return this.getF32(264);

	inline function set_upperLinearY(value:Single):Single { this.setF32(264, value); return value; }
	public var upperLinearZ(get, set):Single;

	inline function get_upperLinearZ():Single return this.getF32(268);

	inline function set_upperLinearZ(value:Single):Single { this.setF32(268, value); return value; }
	public var lowerAngularX(get, set):Single;

	inline function get_lowerAngularX():Single return this.getF32(272);

	inline function set_lowerAngularX(value:Single):Single { this.setF32(272, value); return value; }
	public var lowerAngularY(get, set):Single;

	inline function get_lowerAngularY():Single return this.getF32(276);

	inline function set_lowerAngularY(value:Single):Single { this.setF32(276, value); return value; }
	public var lowerAngularZ(get, set):Single;

	inline function get_lowerAngularZ():Single return this.getF32(280);

	inline function set_lowerAngularZ(value:Single):Single { this.setF32(280, value); return value; }
	public var upperAngularX(get, set):Single;

	inline function get_upperAngularX():Single return this.getF32(284);

	inline function set_upperAngularX(value:Single):Single { this.setF32(284, value); return value; }
	public var upperAngularY(get, set):Single;

	inline function get_upperAngularY():Single return this.getF32(288);

	inline function set_upperAngularY(value:Single):Single { this.setF32(288, value); return value; }
	public var upperAngularZ(get, set):Single;

	inline function get_upperAngularZ():Single return this.getF32(292);

	inline function set_upperAngularZ(value:Single):Single { this.setF32(292, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return this.getUI8(304) != 0;

	inline function set_enableLimitSpring(value:Bool):Bool { this.setUI8(304, value ? 1 : 0); return value; }
	public var limitFrequencyHz(get, set):Single;

	inline function get_limitFrequencyHz():Single return this.getF32(296);

	inline function set_limitFrequencyHz(value:Single):Single { this.setF32(296, value); return value; }
	public var limitDampingRatio(get, set):Single;

	inline function get_limitDampingRatio():Single return this.getF32(300);

	inline function set_limitDampingRatio(value:Single):Single { this.setF32(300, value); return value; }
}
