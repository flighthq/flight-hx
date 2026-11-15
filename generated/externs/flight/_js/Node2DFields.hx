package flight._js;

@:jsRequire("flight")
private extern class Node2DFields_Ffi {
	@:native("flight_get_node2_dfields_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_pivot_x") static function get_pivotX(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_pivot_x") static function set_pivotX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_pivot_y") static function get_pivotY(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_pivot_y") static function set_pivotY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_rotation") static function get_rotation(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_rotation") static function set_rotation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_scale_x") static function get_scaleX(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_scale_x") static function set_scaleX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_scale_y") static function get_scaleY(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_scale_y") static function set_scaleY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_skew_x") static function get_skewX(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_skew_x") static function set_skewX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_skew_y") static function get_skewY(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_skew_y") static function set_skewY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_visible") static function get_visible(ptr:Dynamic):Bool;
	@:native("flight_set_node2_dfields_visible") static function set_visible(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_node2_dfields_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_node2_dfields_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_node2_dfields_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract Node2DFields(Dynamic) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return Node2DFields_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return Node2DFields_Ffi.set_alpha(this, value);
	public var pivotX(get, set):Float;

	inline function get_pivotX():Float return Node2DFields_Ffi.get_pivotX(this);

	inline function set_pivotX(value:Float):Float return Node2DFields_Ffi.set_pivotX(this, value);
	public var pivotY(get, set):Float;

	inline function get_pivotY():Float return Node2DFields_Ffi.get_pivotY(this);

	inline function set_pivotY(value:Float):Float return Node2DFields_Ffi.set_pivotY(this, value);
	public var rotation(get, set):Float;

	inline function get_rotation():Float return Node2DFields_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float return Node2DFields_Ffi.set_rotation(this, value);
	public var scaleX(get, set):Float;

	inline function get_scaleX():Float return Node2DFields_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Float):Float return Node2DFields_Ffi.set_scaleX(this, value);
	public var scaleY(get, set):Float;

	inline function get_scaleY():Float return Node2DFields_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Float):Float return Node2DFields_Ffi.set_scaleY(this, value);
	public var skewX(get, set):Float;

	inline function get_skewX():Float return Node2DFields_Ffi.get_skewX(this);

	inline function set_skewX(value:Float):Float return Node2DFields_Ffi.set_skewX(this, value);
	public var skewY(get, set):Float;

	inline function get_skewY():Float return Node2DFields_Ffi.get_skewY(this);

	inline function set_skewY(value:Float):Float return Node2DFields_Ffi.set_skewY(this, value);
	public var visible(get, set):Bool;

	inline function get_visible():Bool return Node2DFields_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool return Node2DFields_Ffi.set_visible(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return Node2DFields_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Node2DFields_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Node2DFields_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Node2DFields_Ffi.set_y(this, value);
}
