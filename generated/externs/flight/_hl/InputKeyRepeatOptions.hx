package flight._hl;

abstract InputKeyRepeatOptions(hl.Bytes) {
	public var delay(get, set):Float;

	inline function get_delay():Float return this.getF64(0);

	inline function set_delay(value:Float):Float { this.setF64(0, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return this.getF64(8);

	inline function set_interval(value:Float):Float { this.setF64(8, value); return value; }
}
