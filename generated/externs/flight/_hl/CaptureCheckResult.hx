package flight._hl;

abstract CaptureCheckResult(hl.Bytes) {
	public var pass(get, set):Bool;

	inline function get_pass():Bool return this.getUI8(16) != 0;

	inline function set_pass(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var difference(get, set):Float;

	inline function get_difference():Float return this.getF64(0);

	inline function set_difference(value:Float):Float { this.setF64(0, value); return value; }
	public var tolerance(get, set):Float;

	inline function get_tolerance():Float return this.getF64(8);

	inline function set_tolerance(value:Float):Float { this.setF64(8, value); return value; }
}
