package flight._cpp;

private extern class Transform2D_Ffi {
	@:native("flight_get_transform2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_scale_x") static function get_scaleX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_scale_x") static function set_scaleX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_scale_y") static function get_scaleY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_scale_y") static function set_scaleY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_skew_x") static function get_skewX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_skew_x") static function set_skewX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_skew_y") static function get_skewY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_skew_y") static function set_skewY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_pivot_x") static function get_pivotX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_pivot_x") static function set_pivotX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_transform2_d_pivot_y") static function get_pivotY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_transform2_d_pivot_y") static function set_pivotY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Transform2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return Transform2D_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Transform2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Transform2D_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Transform2D_Ffi.set_y(this, value); return value; }
	public var rotation(get, set):Single;

	inline function get_rotation():Single return Transform2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Single):Single { Transform2D_Ffi.set_rotation(this, value); return value; }
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return Transform2D_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Single):Single { Transform2D_Ffi.set_scaleX(this, value); return value; }
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return Transform2D_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Single):Single { Transform2D_Ffi.set_scaleY(this, value); return value; }
	public var skewX(get, set):Single;

	inline function get_skewX():Single return Transform2D_Ffi.get_skewX(this);

	inline function set_skewX(value:Single):Single { Transform2D_Ffi.set_skewX(this, value); return value; }
	public var skewY(get, set):Single;

	inline function get_skewY():Single return Transform2D_Ffi.get_skewY(this);

	inline function set_skewY(value:Single):Single { Transform2D_Ffi.set_skewY(this, value); return value; }
	public var pivotX(get, set):Single;

	inline function get_pivotX():Single return Transform2D_Ffi.get_pivotX(this);

	inline function set_pivotX(value:Single):Single { Transform2D_Ffi.set_pivotX(this, value); return value; }
	public var pivotY(get, set):Single;

	inline function get_pivotY():Single return Transform2D_Ffi.get_pivotY(this);

	inline function set_pivotY(value:Single):Single { Transform2D_Ffi.set_pivotY(this, value); return value; }

	static extern inline public function create(x:Single, y:Single, rotation:Single, scaleX:Single, scaleY:Single, skewX:Single, skewY:Single, pivotX:Single, pivotY:Single):flight._cpp.Transform2D {
		return flight._cpp._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
	}
	extern inline public function decomposeMatrixTo(source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.decomposeMatrixToTransform2d(cast this, source);
	}
	extern inline public function getNode(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Node.getNodeTransform2d(cast this, source);
	}
	extern inline public function setNode(target:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Node.setNodeTransform2d(target, cast this);
	}
}
