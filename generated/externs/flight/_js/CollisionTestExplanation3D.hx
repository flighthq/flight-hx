package flight._js;

@:jsRequire("flight")
private extern class CollisionTestExplanation3D_Ffi {
	@:native("flight_get_collision_test_explanation3_d_overlapping") static function get_overlapping(ptr:Dynamic):Bool;
	@:native("flight_set_collision_test_explanation3_d_overlapping") static function set_overlapping(ptr:Dynamic, value:Bool):Bool;
}

abstract CollisionTestExplanation3D(Dynamic) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionTestExplanation3D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionTestExplanation3D_Ffi.set_overlapping(this, value);
}
