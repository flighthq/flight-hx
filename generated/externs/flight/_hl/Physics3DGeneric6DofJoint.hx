package flight._hl;

abstract Physics3DGeneric6DofJoint(hl.Bytes) {
	public var lowerLinearX(get, set):Float;

	inline function get_lowerLinearX():Float return this.getF64(360);

	inline function set_lowerLinearX(value:Float):Float { this.setF64(360, value); return value; }
	public var lowerLinearY(get, set):Float;

	inline function get_lowerLinearY():Float return this.getF64(368);

	inline function set_lowerLinearY(value:Float):Float { this.setF64(368, value); return value; }
	public var lowerLinearZ(get, set):Float;

	inline function get_lowerLinearZ():Float return this.getF64(376);

	inline function set_lowerLinearZ(value:Float):Float { this.setF64(376, value); return value; }
	public var upperLinearX(get, set):Float;

	inline function get_upperLinearX():Float return this.getF64(384);

	inline function set_upperLinearX(value:Float):Float { this.setF64(384, value); return value; }
	public var upperLinearY(get, set):Float;

	inline function get_upperLinearY():Float return this.getF64(392);

	inline function set_upperLinearY(value:Float):Float { this.setF64(392, value); return value; }
	public var upperLinearZ(get, set):Float;

	inline function get_upperLinearZ():Float return this.getF64(400);

	inline function set_upperLinearZ(value:Float):Float { this.setF64(400, value); return value; }
	public var lowerAngularX(get, set):Float;

	inline function get_lowerAngularX():Float return this.getF64(408);

	inline function set_lowerAngularX(value:Float):Float { this.setF64(408, value); return value; }
	public var lowerAngularY(get, set):Float;

	inline function get_lowerAngularY():Float return this.getF64(416);

	inline function set_lowerAngularY(value:Float):Float { this.setF64(416, value); return value; }
	public var lowerAngularZ(get, set):Float;

	inline function get_lowerAngularZ():Float return this.getF64(424);

	inline function set_lowerAngularZ(value:Float):Float { this.setF64(424, value); return value; }
	public var upperAngularX(get, set):Float;

	inline function get_upperAngularX():Float return this.getF64(432);

	inline function set_upperAngularX(value:Float):Float { this.setF64(432, value); return value; }
	public var upperAngularY(get, set):Float;

	inline function get_upperAngularY():Float return this.getF64(440);

	inline function set_upperAngularY(value:Float):Float { this.setF64(440, value); return value; }
	public var upperAngularZ(get, set):Float;

	inline function get_upperAngularZ():Float return this.getF64(448);

	inline function set_upperAngularZ(value:Float):Float { this.setF64(448, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return this.getUI8(472) != 0;

	inline function set_enableLimitSpring(value:Bool):Bool { this.setUI8(472, value ? 1 : 0); return value; }
	public var limitFrequencyHz(get, set):Float;

	inline function get_limitFrequencyHz():Float return this.getF64(456);

	inline function set_limitFrequencyHz(value:Float):Float { this.setF64(456, value); return value; }
	public var limitDampingRatio(get, set):Float;

	inline function get_limitDampingRatio():Float return this.getF64(464);

	inline function set_limitDampingRatio(value:Float):Float { this.setF64(464, value); return value; }
}
