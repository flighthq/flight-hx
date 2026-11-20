package flight._hl;

abstract ColorComponents(hl.Bytes) {
	public var r(get, set):Float;

	inline function get_r():Float return this.getF64(0);

	inline function set_r(value:Float):Float { this.setF64(0, value); return value; }
	public var g(get, set):Float;

	inline function get_g():Float return this.getF64(8);

	inline function set_g(value:Float):Float { this.setF64(8, value); return value; }
	public var b(get, set):Float;

	inline function get_b():Float return this.getF64(16);

	inline function set_b(value:Float):Float { this.setF64(16, value); return value; }
}
