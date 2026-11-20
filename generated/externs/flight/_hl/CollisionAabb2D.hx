package flight._hl;

abstract CollisionAabb2D(hl.Bytes) {
	public var minX(get, set):Float;

	inline function get_minX():Float return this.getF64(0);

	inline function set_minX(value:Float):Float { this.setF64(0, value); return value; }
	public var minY(get, set):Float;

	inline function get_minY():Float return this.getF64(8);

	inline function set_minY(value:Float):Float { this.setF64(8, value); return value; }
	public var maxX(get, set):Float;

	inline function get_maxX():Float return this.getF64(16);

	inline function set_maxX(value:Float):Float { this.setF64(16, value); return value; }
	public var maxY(get, set):Float;

	inline function get_maxY():Float return this.getF64(24);

	inline function set_maxY(value:Float):Float { this.setF64(24, value); return value; }
}
