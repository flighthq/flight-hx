package flight._js;

@:jsRequire("flight")
private extern class Physics2DQueryHit_Ffi {
	@:native("flight_get_physics2_dquery_hit_collider_index") static function get_colliderIndex(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dquery_hit_collider_index") static function set_colliderIndex(ptr:Dynamic, value:Int):Int;
}

abstract Physics2DQueryHit(Dynamic) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return Physics2DQueryHit_Ffi.get_colliderIndex(this);

	inline function set_colliderIndex(value:Int):Int return Physics2DQueryHit_Ffi.set_colliderIndex(this, value);
}
