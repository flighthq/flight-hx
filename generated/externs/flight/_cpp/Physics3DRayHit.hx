package flight._cpp;

private extern class Physics3DRayHit_Ffi {
	@:native("flight_get_physics3_dray_hit_collider_index") static function get_colliderIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dray_hit_collider_index") static function set_colliderIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dray_hit_fraction") static function get_fraction(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dray_hit_fraction") static function set_fraction(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dray_hit_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dray_hit_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dray_hit_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dray_hit_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dray_hit_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dray_hit_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dray_hit_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dray_hit_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dray_hit_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dray_hit_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dray_hit_normal_z") static function get_normalZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dray_hit_normal_z") static function set_normalZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DRayHit(cpp.Star<cpp.Void>) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return Physics3DRayHit_Ffi.get_colliderIndex(this);

	inline function set_colliderIndex(value:Int):Int { Physics3DRayHit_Ffi.set_colliderIndex(this, value); return value; }
	public var fraction(get, set):Single;

	inline function get_fraction():Single return Physics3DRayHit_Ffi.get_fraction(this);

	inline function set_fraction(value:Single):Single { Physics3DRayHit_Ffi.set_fraction(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return Physics3DRayHit_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Physics3DRayHit_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Physics3DRayHit_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Physics3DRayHit_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return Physics3DRayHit_Ffi.get_z(this);

	inline function set_z(value:Single):Single { Physics3DRayHit_Ffi.set_z(this, value); return value; }
	public var normalX(get, set):Single;

	inline function get_normalX():Single return Physics3DRayHit_Ffi.get_normalX(this);

	inline function set_normalX(value:Single):Single { Physics3DRayHit_Ffi.set_normalX(this, value); return value; }
	public var normalY(get, set):Single;

	inline function get_normalY():Single return Physics3DRayHit_Ffi.get_normalY(this);

	inline function set_normalY(value:Single):Single { Physics3DRayHit_Ffi.set_normalY(this, value); return value; }
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return Physics3DRayHit_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Single):Single { Physics3DRayHit_Ffi.set_normalZ(this, value); return value; }
}
