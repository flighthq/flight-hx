package flight._hl;

abstract Camera3DOptions(hl.Bytes) {
	public var far(get, set):Float;

	inline function get_far():Float return this.getF64(0);

	inline function set_far(value:Float):Float { this.setF64(0, value); return value; }
	public var near(get, set):Float;

	inline function get_near():Float return this.getF64(8);

	inline function set_near(value:Float):Float { this.setF64(8, value); return value; }
}
