package flight._hl;

abstract QuaternionReading(hl.Bytes) {
	public var interval(get, set):Float;

	inline function get_interval():Float return this.getF64(16);

	inline function set_interval(value:Float):Float { this.setF64(16, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return this.getF64(24);

	inline function set_timestamp(value:Float):Float { this.setF64(24, value); return value; }
	public var w(get, set):Single;

	inline function get_w():Single return this.getF32(32);

	inline function set_w(value:Single):Single { this.setF32(32, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(36);

	inline function set_x(value:Single):Single { this.setF32(36, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(40);

	inline function set_y(value:Single):Single { this.setF32(40, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(44);

	inline function set_z(value:Single):Single { this.setF32(44, value); return value; }
}
