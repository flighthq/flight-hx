package flight._hl;

abstract Physics2DDistanceJointOptions(hl.Bytes) {
	public var length(get, set):Float;

	inline function get_length():Float return this.getF64(144);

	inline function set_length(value:Float):Float { this.setF64(144, value); return value; }
}
