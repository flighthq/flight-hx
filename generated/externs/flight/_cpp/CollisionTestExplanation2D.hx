package flight._cpp;

private extern class CollisionTestExplanation2D_Ffi {
	@:native("flight_get_collision_test_explanation2_d_overlapping") static function get_overlapping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_collision_test_explanation2_d_overlapping") static function set_overlapping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract CollisionTestExplanation2D(cpp.Star<cpp.Void>) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionTestExplanation2D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool { CollisionTestExplanation2D_Ffi.set_overlapping(this, value); return value; }
}
