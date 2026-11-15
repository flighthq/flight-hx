package flight._cpp;

private extern class Physics2DQueryHit_Ffi {
	@:native("flight_get_physics2_dquery_hit_collider_index") static function get_colliderIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dquery_hit_collider_index") static function set_colliderIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DQueryHit(cpp.Star<cpp.Void>) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return Physics2DQueryHit_Ffi.get_colliderIndex(this);

	inline function set_colliderIndex(value:Int):Int return Physics2DQueryHit_Ffi.set_colliderIndex(this, value);
}
