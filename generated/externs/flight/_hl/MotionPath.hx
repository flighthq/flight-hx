package flight._hl;

abstract MotionPath(hl.Bytes) {
	public var distance(get, set):Float;

	inline function get_distance():Float return this.getF64(24);

	inline function set_distance(value:Float):Float { this.setF64(24, value); return value; }
	public var length(get, set):Float;

	inline function get_length():Float return this.getF64(32);

	inline function set_length(value:Float):Float { this.setF64(32, value); return value; }
	public var speed(get, set):Float;

	inline function get_speed():Float return this.getF64(56);

	inline function set_speed(value:Float):Float { this.setF64(56, value); return value; }
}
