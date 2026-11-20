package flight._cpp;

private extern class RiveWeightedPoint_Ffi {
	@:native("flight_get_rive_weighted_point_vertex") static function get_vertex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rive_weighted_point_vertex") static function set_vertex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_rive_weighted_point_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rive_weighted_point_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rive_weighted_point_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rive_weighted_point_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract RiveWeightedPoint(cpp.Star<cpp.Void>) {
	public var vertex(get, set):Int;

	inline function get_vertex():Int return RiveWeightedPoint_Ffi.get_vertex(this);

	inline function set_vertex(value:Int):Int { RiveWeightedPoint_Ffi.set_vertex(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return RiveWeightedPoint_Ffi.get_x(this);

	inline function set_x(value:Float):Float { RiveWeightedPoint_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return RiveWeightedPoint_Ffi.get_y(this);

	inline function set_y(value:Float):Float { RiveWeightedPoint_Ffi.set_y(this, value); return value; }
}
