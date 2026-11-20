package flight._hl;

abstract ProximityReading(hl.Bytes) {
	public var distance(get, set):Float;

	inline function get_distance():Float return this.getF64(16);

	inline function set_distance(value:Float):Float { this.setF64(16, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return this.getF64(24);

	inline function set_interval(value:Float):Float { this.setF64(24, value); return value; }
	public var max(get, set):Float;

	inline function get_max():Float return this.getF64(32);

	inline function set_max(value:Float):Float { this.setF64(32, value); return value; }
	public var near(get, set):Bool;

	inline function get_near():Bool return this.getUI8(52) != 0;

	inline function set_near(value:Bool):Bool { this.setUI8(52, value ? 1 : 0); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return this.getF64(40);

	inline function set_timestamp(value:Float):Float { this.setF64(40, value); return value; }
}
