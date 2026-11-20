package flight._hl;

abstract Transform2D(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(16);

	inline function set_x(value:Float):Float { this.setF64(16, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(24);

	inline function set_y(value:Float):Float { this.setF64(24, value); return value; }
	public var rotation(get, set):Float;

	inline function get_rotation():Float return this.getF64(32);

	inline function set_rotation(value:Float):Float { this.setF64(32, value); return value; }
	public var scaleX(get, set):Float;

	inline function get_scaleX():Float return this.getF64(40);

	inline function set_scaleX(value:Float):Float { this.setF64(40, value); return value; }
	public var scaleY(get, set):Float;

	inline function get_scaleY():Float return this.getF64(48);

	inline function set_scaleY(value:Float):Float { this.setF64(48, value); return value; }
	public var skewX(get, set):Float;

	inline function get_skewX():Float return this.getF64(56);

	inline function set_skewX(value:Float):Float { this.setF64(56, value); return value; }
	public var skewY(get, set):Float;

	inline function get_skewY():Float return this.getF64(64);

	inline function set_skewY(value:Float):Float { this.setF64(64, value); return value; }
	public var pivotX(get, set):Float;

	inline function get_pivotX():Float return this.getF64(72);

	inline function set_pivotX(value:Float):Float { this.setF64(72, value); return value; }
	public var pivotY(get, set):Float;

	inline function get_pivotY():Float return this.getF64(80);

	inline function set_pivotY(value:Float):Float { this.setF64(80, value); return value; }

	static inline public function create(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, pivotX:Float, pivotY:Float):flight._hl.Transform2D {
		return flight._hl._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
	}
	inline public function decomposeMatrixTo(source:flight._hl.Matrix):Void {
		flight._hl._fn.Geometry.decomposeMatrixToTransform2d(cast this, source);
	}
}
