package flight._hl;

abstract Transform2D(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(16);

	inline function set_x(value:Single):Single { this.setF32(16, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(20);

	inline function set_y(value:Single):Single { this.setF32(20, value); return value; }
	public var rotation(get, set):Single;

	inline function get_rotation():Single return this.getF32(24);

	inline function set_rotation(value:Single):Single { this.setF32(24, value); return value; }
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return this.getF32(28);

	inline function set_scaleX(value:Single):Single { this.setF32(28, value); return value; }
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return this.getF32(32);

	inline function set_scaleY(value:Single):Single { this.setF32(32, value); return value; }
	public var skewX(get, set):Single;

	inline function get_skewX():Single return this.getF32(36);

	inline function set_skewX(value:Single):Single { this.setF32(36, value); return value; }
	public var skewY(get, set):Single;

	inline function get_skewY():Single return this.getF32(40);

	inline function set_skewY(value:Single):Single { this.setF32(40, value); return value; }
	public var pivotX(get, set):Single;

	inline function get_pivotX():Single return this.getF32(44);

	inline function set_pivotX(value:Single):Single { this.setF32(44, value); return value; }
	public var pivotY(get, set):Single;

	inline function get_pivotY():Single return this.getF32(48);

	inline function set_pivotY(value:Single):Single { this.setF32(48, value); return value; }

	static inline public function create(x:Single, y:Single, rotation:Single, scaleX:Single, scaleY:Single, skewX:Single, skewY:Single, pivotX:Single, pivotY:Single):flight._hl.Transform2D {
		return flight._hl._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
	}
	inline public function decomposeMatrixTo(source:flight._hl.Matrix):Void {
		flight._hl._fn.Geometry.decomposeMatrixToTransform2d(cast this, source);
	}
	inline public function getNode(source:Dynamic):Void {
		flight._hl._fn.Node.getNodeTransform2d(cast this, source);
	}
	inline public function setNode(target:Dynamic):Void {
		flight._hl._fn.Node.setNodeTransform2d(target, cast this);
	}
}
