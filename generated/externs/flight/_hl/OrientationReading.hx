package flight._hl;

abstract OrientationReading(hl.Bytes) {
	public var absolute(get, set):Bool;

	inline function get_absolute():Bool return this.getUI8(68) != 0;

	inline function set_absolute(value:Bool):Bool { this.setUI8(68, value ? 1 : 0); return value; }
	public var alpha(get, set):Float;

	inline function get_alpha():Float return this.getF64(16);

	inline function set_alpha(value:Float):Float { this.setF64(16, value); return value; }
	public var beta(get, set):Float;

	inline function get_beta():Float return this.getF64(24);

	inline function set_beta(value:Float):Float { this.setF64(24, value); return value; }
	public var gamma(get, set):Float;

	inline function get_gamma():Float return this.getF64(32);

	inline function set_gamma(value:Float):Float { this.setF64(32, value); return value; }
	public var heading(get, set):Float;

	inline function get_heading():Float return this.getF64(40);

	inline function set_heading(value:Float):Float { this.setF64(40, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return this.getF64(48);

	inline function set_interval(value:Float):Float { this.setF64(48, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return this.getF64(56);

	inline function set_timestamp(value:Float):Float { this.setF64(56, value); return value; }
}
