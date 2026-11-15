package flight._js;

@:jsRequire("flight")
private extern class ShapeScale9Grid_Ffi {
	@:native("flight_get_shape_scale9_grid_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_shape_scale9_grid_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_shape_scale9_grid_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_shape_scale9_grid_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_shape_scale9_grid_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_shape_scale9_grid_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_shape_scale9_grid_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_shape_scale9_grid_height") static function set_height(ptr:Dynamic, value:Float):Float;
}

abstract ShapeScale9Grid(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return ShapeScale9Grid_Ffi.get_x(this);

	inline function set_x(value:Float):Float return ShapeScale9Grid_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return ShapeScale9Grid_Ffi.get_y(this);

	inline function set_y(value:Float):Float return ShapeScale9Grid_Ffi.set_y(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return ShapeScale9Grid_Ffi.get_width(this);

	inline function set_width(value:Float):Float return ShapeScale9Grid_Ffi.set_width(this, value);
	public var height(get, set):Float;

	inline function get_height():Float return ShapeScale9Grid_Ffi.get_height(this);

	inline function set_height(value:Float):Float return ShapeScale9Grid_Ffi.set_height(this, value);
}
