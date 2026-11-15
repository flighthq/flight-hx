package flight._js;

@:jsRequire("flight")
private extern class CollisionTestExplanation2D_Ffi {
	@:native("flight_get_collision_test_explanation2_d_overlapping") static function get_overlapping(ptr:Dynamic):Bool;
	@:native("flight_set_collision_test_explanation2_d_overlapping") static function set_overlapping(ptr:Dynamic, value:Bool):Bool;
}

abstract CollisionTestExplanation2D(Dynamic) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionTestExplanation2D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionTestExplanation2D_Ffi.set_overlapping(this, value);
}
