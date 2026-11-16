package flight._js;

abstract Transform2D(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	public var rotation(get, set):Float;
	inline function get_rotation():Float return untyped this.rotation;
	inline function set_rotation(value:Float):Float return untyped this.rotation = value;
	public var scaleX(get, set):Float;
	inline function get_scaleX():Float return untyped this.scaleX;
	inline function set_scaleX(value:Float):Float return untyped this.scaleX = value;
	public var scaleY(get, set):Float;
	inline function get_scaleY():Float return untyped this.scaleY;
	inline function set_scaleY(value:Float):Float return untyped this.scaleY = value;
	public var skewX(get, set):Float;
	inline function get_skewX():Float return untyped this.skewX;
	inline function set_skewX(value:Float):Float return untyped this.skewX = value;
	public var skewY(get, set):Float;
	inline function get_skewY():Float return untyped this.skewY;
	inline function set_skewY(value:Float):Float return untyped this.skewY = value;
	public var pivotX(get, set):Float;
	inline function get_pivotX():Float return untyped this.pivotX;
	inline function set_pivotX(value:Float):Float return untyped this.pivotX = value;
	public var pivotY(get, set):Float;
	inline function get_pivotY():Float return untyped this.pivotY;
	inline function set_pivotY(value:Float):Float return untyped this.pivotY = value;
	static inline public function create(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, pivotX:Float, pivotY:Float):flight._js.Transform2D {
		return flight._js._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
	}
	inline public function decomposeMatrixTo(source:flight._js.Matrix):Void {
		flight._js._fn.Geometry.decomposeMatrixToTransform2d(cast this, source);
	}
	inline public function getNode(source:Dynamic):Void {
		flight._js._fn.Node.getNodeTransform2d(cast this, source);
	}
	inline public function setNode(target:Dynamic):Void {
		flight._js._fn.Node.setNodeTransform2d(target, cast this);
	}
}
