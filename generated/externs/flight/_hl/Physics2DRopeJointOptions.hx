package flight._hl;

abstract Physics2DRopeJointOptions(hl.Bytes) {
	public var maxLength(get, set):Float;

	inline function get_maxLength():Float return this.getF64(112);

	inline function set_maxLength(value:Float):Float { this.setF64(112, value); return value; }
}
