package flight._cpp;

private extern class Transform2D_Ffi {
	@:native("flight_get_transform2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_scale_x") static function get_scaleX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_scale_x") static function set_scaleX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_scale_y") static function get_scaleY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_scale_y") static function set_scaleY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_skew_x") static function get_skewX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_skew_x") static function set_skewX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_skew_y") static function get_skewY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_skew_y") static function set_skewY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_pivot_x") static function get_pivotX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_pivot_x") static function set_pivotX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_transform2_d_pivot_y") static function get_pivotY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_transform2_d_pivot_y") static function set_pivotY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Transform2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return Transform2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Transform2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Transform2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Transform2D_Ffi.set_y(this, value); return value; }
	public var rotation(get, set):Float;

	inline function get_rotation():Float return Transform2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float { Transform2D_Ffi.set_rotation(this, value); return value; }
	public var scaleX(get, set):Float;

	inline function get_scaleX():Float return Transform2D_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Float):Float { Transform2D_Ffi.set_scaleX(this, value); return value; }
	public var scaleY(get, set):Float;

	inline function get_scaleY():Float return Transform2D_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Float):Float { Transform2D_Ffi.set_scaleY(this, value); return value; }
	public var skewX(get, set):Float;

	inline function get_skewX():Float return Transform2D_Ffi.get_skewX(this);

	inline function set_skewX(value:Float):Float { Transform2D_Ffi.set_skewX(this, value); return value; }
	public var skewY(get, set):Float;

	inline function get_skewY():Float return Transform2D_Ffi.get_skewY(this);

	inline function set_skewY(value:Float):Float { Transform2D_Ffi.set_skewY(this, value); return value; }
	public var pivotX(get, set):Float;

	inline function get_pivotX():Float return Transform2D_Ffi.get_pivotX(this);

	inline function set_pivotX(value:Float):Float { Transform2D_Ffi.set_pivotX(this, value); return value; }
	public var pivotY(get, set):Float;

	inline function get_pivotY():Float return Transform2D_Ffi.get_pivotY(this);

	inline function set_pivotY(value:Float):Float { Transform2D_Ffi.set_pivotY(this, value); return value; }

	static extern inline public function create(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, pivotX:Float, pivotY:Float):flight._cpp.Transform2D {
		return flight._cpp._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
	}
	extern inline public function decomposeMatrixTo(source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.decomposeMatrixToTransform2d(cast this, source);
	}
}
