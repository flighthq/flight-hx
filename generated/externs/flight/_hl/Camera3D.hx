package flight._hl;

abstract Camera3D(hl.Bytes) {
	public var far(get, set):Float;

	inline function get_far():Float return this.getF64(16);

	inline function set_far(value:Float):Float { this.setF64(16, value); return value; }
	public var near(get, set):Float;

	inline function get_near():Float return this.getF64(40);

	inline function set_near(value:Float):Float { this.setF64(40, value); return value; }
}
