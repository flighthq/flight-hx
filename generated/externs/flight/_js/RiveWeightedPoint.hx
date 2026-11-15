package flight._js;

@:jsRequire("flight")
private extern class RiveWeightedPoint_Ffi {
	@:native("flight_get_rive_weighted_point_vertex") static function get_vertex(ptr:Dynamic):Int;
	@:native("flight_set_rive_weighted_point_vertex") static function set_vertex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_rive_weighted_point_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_rive_weighted_point_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rive_weighted_point_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_rive_weighted_point_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract RiveWeightedPoint(Dynamic) {
	public var vertex(get, set):Int;

	inline function get_vertex():Int return RiveWeightedPoint_Ffi.get_vertex(this);

	inline function set_vertex(value:Int):Int return RiveWeightedPoint_Ffi.set_vertex(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return RiveWeightedPoint_Ffi.get_x(this);

	inline function set_x(value:Float):Float return RiveWeightedPoint_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return RiveWeightedPoint_Ffi.get_y(this);

	inline function set_y(value:Float):Float return RiveWeightedPoint_Ffi.set_y(this, value);
}
