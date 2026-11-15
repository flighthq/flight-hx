package flight._cpp;

private extern class HasTransform2D_Ffi {
	@:native("flight_get_has_transform2_d_pivot_x") static function get_pivotX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_pivot_x") static function set_pivotX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_pivot_y") static function get_pivotY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_pivot_y") static function set_pivotY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_scale_x") static function get_scaleX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_scale_x") static function set_scaleX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_scale_y") static function get_scaleY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_scale_y") static function set_scaleY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_skew_x") static function get_skewX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_skew_x") static function set_skewX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_skew_y") static function get_skewY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_skew_y") static function set_skewY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract HasTransform2D(cpp.Star<cpp.Void>) {
	public var pivotX(get, set):Single;

	inline function get_pivotX():Single return HasTransform2D_Ffi.get_pivotX(this);

	inline function set_pivotX(value:Single):Single return HasTransform2D_Ffi.set_pivotX(this, value);
	public var pivotY(get, set):Single;

	inline function get_pivotY():Single return HasTransform2D_Ffi.get_pivotY(this);

	inline function set_pivotY(value:Single):Single return HasTransform2D_Ffi.set_pivotY(this, value);
	public var rotation(get, set):Single;

	inline function get_rotation():Single return HasTransform2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Single):Single return HasTransform2D_Ffi.set_rotation(this, value);
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return HasTransform2D_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Single):Single return HasTransform2D_Ffi.set_scaleX(this, value);
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return HasTransform2D_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Single):Single return HasTransform2D_Ffi.set_scaleY(this, value);
	public var skewX(get, set):Single;

	inline function get_skewX():Single return HasTransform2D_Ffi.get_skewX(this);

	inline function set_skewX(value:Single):Single return HasTransform2D_Ffi.set_skewX(this, value);
	public var skewY(get, set):Single;

	inline function get_skewY():Single return HasTransform2D_Ffi.get_skewY(this);

	inline function set_skewY(value:Single):Single return HasTransform2D_Ffi.set_skewY(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return HasTransform2D_Ffi.get_x(this);

	inline function set_x(value:Single):Single return HasTransform2D_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return HasTransform2D_Ffi.get_y(this);

	inline function set_y(value:Single):Single return HasTransform2D_Ffi.set_y(this, value);
}
