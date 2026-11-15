package flight._js;

@:jsRequire("flight")
private extern class CollisionSegment2D_Ffi {
	@:native("flight_get_collision_segment2_d_x0") static function get_x0(ptr:Dynamic):Float;
	@:native("flight_set_collision_segment2_d_x0") static function set_x0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_segment2_d_y0") static function get_y0(ptr:Dynamic):Float;
	@:native("flight_set_collision_segment2_d_y0") static function set_y0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_segment2_d_x1") static function get_x1(ptr:Dynamic):Float;
	@:native("flight_set_collision_segment2_d_x1") static function set_x1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_segment2_d_y1") static function get_y1(ptr:Dynamic):Float;
	@:native("flight_set_collision_segment2_d_y1") static function set_y1(ptr:Dynamic, value:Float):Float;
}

abstract CollisionSegment2D(Dynamic) {
	public var x0(get, set):Float;

	inline function get_x0():Float return CollisionSegment2D_Ffi.get_x0(this);

	inline function set_x0(value:Float):Float return CollisionSegment2D_Ffi.set_x0(this, value);
	public var y0(get, set):Float;

	inline function get_y0():Float return CollisionSegment2D_Ffi.get_y0(this);

	inline function set_y0(value:Float):Float return CollisionSegment2D_Ffi.set_y0(this, value);
	public var x1(get, set):Float;

	inline function get_x1():Float return CollisionSegment2D_Ffi.get_x1(this);

	inline function set_x1(value:Float):Float return CollisionSegment2D_Ffi.set_x1(this, value);
	public var y1(get, set):Float;

	inline function get_y1():Float return CollisionSegment2D_Ffi.get_y1(this);

	inline function set_y1(value:Float):Float return CollisionSegment2D_Ffi.set_y1(this, value);
}
