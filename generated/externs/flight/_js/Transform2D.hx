package flight._js;

@:jsRequire("flight")
private extern class Transform2D_Ffi {
	@:native("flight_get_transform2_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_rotation") static function get_rotation(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_rotation") static function set_rotation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_scale_x") static function get_scaleX(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_scale_x") static function set_scaleX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_scale_y") static function get_scaleY(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_scale_y") static function set_scaleY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_skew_x") static function get_skewX(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_skew_x") static function set_skewX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_skew_y") static function get_skewY(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_skew_y") static function set_skewY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_pivot_x") static function get_pivotX(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_pivot_x") static function set_pivotX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_transform2_d_pivot_y") static function get_pivotY(ptr:Dynamic):Float;
	@:native("flight_set_transform2_d_pivot_y") static function set_pivotY(ptr:Dynamic, value:Float):Float;
}

abstract Transform2D(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return Transform2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Transform2D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Transform2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Transform2D_Ffi.set_y(this, value);
	public var rotation(get, set):Float;

	inline function get_rotation():Float return Transform2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float return Transform2D_Ffi.set_rotation(this, value);
	public var scaleX(get, set):Float;

	inline function get_scaleX():Float return Transform2D_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Float):Float return Transform2D_Ffi.set_scaleX(this, value);
	public var scaleY(get, set):Float;

	inline function get_scaleY():Float return Transform2D_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Float):Float return Transform2D_Ffi.set_scaleY(this, value);
	public var skewX(get, set):Float;

	inline function get_skewX():Float return Transform2D_Ffi.get_skewX(this);

	inline function set_skewX(value:Float):Float return Transform2D_Ffi.set_skewX(this, value);
	public var skewY(get, set):Float;

	inline function get_skewY():Float return Transform2D_Ffi.get_skewY(this);

	inline function set_skewY(value:Float):Float return Transform2D_Ffi.set_skewY(this, value);
	public var pivotX(get, set):Float;

	inline function get_pivotX():Float return Transform2D_Ffi.get_pivotX(this);

	inline function set_pivotX(value:Float):Float return Transform2D_Ffi.set_pivotX(this, value);
	public var pivotY(get, set):Float;

	inline function get_pivotY():Float return Transform2D_Ffi.get_pivotY(this);

	inline function set_pivotY(value:Float):Float return Transform2D_Ffi.set_pivotY(this, value);

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
