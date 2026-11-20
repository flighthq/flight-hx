package flight._hl;

abstract MotionReading(hl.Bytes) {
	public var interval(get, set):Float;

	inline function get_interval():Float return this.getF64(16);

	inline function set_interval(value:Float):Float { this.setF64(16, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return this.getF64(24);

	inline function set_timestamp(value:Float):Float { this.setF64(24, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(32);

	inline function set_x(value:Float):Float { this.setF64(32, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(40);

	inline function set_y(value:Float):Float { this.setF64(40, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(48);

	inline function set_z(value:Float):Float { this.setF64(48, value); return value; }
}
