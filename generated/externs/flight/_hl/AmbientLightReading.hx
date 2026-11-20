package flight._hl;

abstract AmbientLightReading(hl.Bytes) {
	public var illuminance(get, set):Float;

	inline function get_illuminance():Float return this.getF64(16);

	inline function set_illuminance(value:Float):Float { this.setF64(16, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return this.getF64(24);

	inline function set_interval(value:Float):Float { this.setF64(24, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return this.getF64(32);

	inline function set_timestamp(value:Float):Float { this.setF64(32, value); return value; }
}
