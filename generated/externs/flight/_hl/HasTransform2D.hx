package flight._hl;

abstract HasTransform2D(hl.Bytes) {
	public var pivotX(get, set):Float;

	inline function get_pivotX():Float return this.getF64(0);

	inline function set_pivotX(value:Float):Float { this.setF64(0, value); return value; }
	public var pivotY(get, set):Float;

	inline function get_pivotY():Float return this.getF64(8);

	inline function set_pivotY(value:Float):Float { this.setF64(8, value); return value; }
	public var rotation(get, set):Float;

	inline function get_rotation():Float return this.getF64(16);

	inline function set_rotation(value:Float):Float { this.setF64(16, value); return value; }
	public var scaleX(get, set):Float;

	inline function get_scaleX():Float return this.getF64(24);

	inline function set_scaleX(value:Float):Float { this.setF64(24, value); return value; }
	public var scaleY(get, set):Float;

	inline function get_scaleY():Float return this.getF64(32);

	inline function set_scaleY(value:Float):Float { this.setF64(32, value); return value; }
	public var skewX(get, set):Float;

	inline function get_skewX():Float return this.getF64(40);

	inline function set_skewX(value:Float):Float { this.setF64(40, value); return value; }
	public var skewY(get, set):Float;

	inline function get_skewY():Float return this.getF64(48);

	inline function set_skewY(value:Float):Float { this.setF64(48, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(56);

	inline function set_x(value:Float):Float { this.setF64(56, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(64);

	inline function set_y(value:Float):Float { this.setF64(64, value); return value; }
}
