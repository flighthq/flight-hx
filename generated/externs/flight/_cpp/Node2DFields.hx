package flight._cpp;

private extern class Node2DFields_Ffi {
	@:native("flight_get_node2_dfields_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_pivot_x") static function get_pivotX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_pivot_x") static function set_pivotX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_pivot_y") static function get_pivotY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_pivot_y") static function set_pivotY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_scale_x") static function get_scaleX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_scale_x") static function set_scaleX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_scale_y") static function get_scaleY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_scale_y") static function set_scaleY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_skew_x") static function get_skewX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_skew_x") static function set_skewX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_skew_y") static function get_skewY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_skew_y") static function set_skewY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node2_dfields_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_node2_dfields_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node2_dfields_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node2_dfields_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Node2DFields(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return Node2DFields_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single { Node2DFields_Ffi.set_alpha(this, value); return value; }
	public var pivotX(get, set):Single;

	inline function get_pivotX():Single return Node2DFields_Ffi.get_pivotX(this);

	inline function set_pivotX(value:Single):Single { Node2DFields_Ffi.set_pivotX(this, value); return value; }
	public var pivotY(get, set):Single;

	inline function get_pivotY():Single return Node2DFields_Ffi.get_pivotY(this);

	inline function set_pivotY(value:Single):Single { Node2DFields_Ffi.set_pivotY(this, value); return value; }
	public var rotation(get, set):Single;

	inline function get_rotation():Single return Node2DFields_Ffi.get_rotation(this);

	inline function set_rotation(value:Single):Single { Node2DFields_Ffi.set_rotation(this, value); return value; }
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return Node2DFields_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Single):Single { Node2DFields_Ffi.set_scaleX(this, value); return value; }
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return Node2DFields_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Single):Single { Node2DFields_Ffi.set_scaleY(this, value); return value; }
	public var skewX(get, set):Single;

	inline function get_skewX():Single return Node2DFields_Ffi.get_skewX(this);

	inline function set_skewX(value:Single):Single { Node2DFields_Ffi.set_skewX(this, value); return value; }
	public var skewY(get, set):Single;

	inline function get_skewY():Single return Node2DFields_Ffi.get_skewY(this);

	inline function set_skewY(value:Single):Single { Node2DFields_Ffi.set_skewY(this, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return Node2DFields_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool { Node2DFields_Ffi.set_visible(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return Node2DFields_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Node2DFields_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Node2DFields_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Node2DFields_Ffi.set_y(this, value); return value; }
}
