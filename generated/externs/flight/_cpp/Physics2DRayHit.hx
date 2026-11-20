package flight._cpp;

private extern class Physics2DRayHit_Ffi {
	@:native("flight_get_physics2_dray_hit_collider_index") static function get_colliderIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dray_hit_collider_index") static function set_colliderIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dray_hit_fraction") static function get_fraction(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dray_hit_fraction") static function set_fraction(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dray_hit_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dray_hit_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dray_hit_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dray_hit_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dray_hit_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dray_hit_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dray_hit_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dray_hit_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DRayHit(cpp.Star<cpp.Void>) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return Physics2DRayHit_Ffi.get_colliderIndex(this);

	inline function set_colliderIndex(value:Int):Int { Physics2DRayHit_Ffi.set_colliderIndex(this, value); return value; }
	public var fraction(get, set):Float;

	inline function get_fraction():Float return Physics2DRayHit_Ffi.get_fraction(this);

	inline function set_fraction(value:Float):Float { Physics2DRayHit_Ffi.set_fraction(this, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return Physics2DRayHit_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float { Physics2DRayHit_Ffi.set_normalX(this, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return Physics2DRayHit_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float { Physics2DRayHit_Ffi.set_normalY(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return Physics2DRayHit_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Physics2DRayHit_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Physics2DRayHit_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Physics2DRayHit_Ffi.set_y(this, value); return value; }
}
