package flight._cpp;

private extern class Physics2DShapeCastResult_Ffi {
	@:native("flight_get_physics2_dshape_cast_result_collider_index") static function get_colliderIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dshape_cast_result_collider_index") static function set_colliderIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dshape_cast_result_fraction") static function get_fraction(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dshape_cast_result_fraction") static function set_fraction(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dshape_cast_result_hit") static function get_hit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dshape_cast_result_hit") static function set_hit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dshape_cast_result_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dshape_cast_result_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dshape_cast_result_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dshape_cast_result_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dshape_cast_result_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dshape_cast_result_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dshape_cast_result_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dshape_cast_result_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DShapeCastResult(cpp.Star<cpp.Void>) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return Physics2DShapeCastResult_Ffi.get_colliderIndex(this);

	inline function set_colliderIndex(value:Int):Int return Physics2DShapeCastResult_Ffi.set_colliderIndex(this, value);
	public var fraction(get, set):Single;

	inline function get_fraction():Single return Physics2DShapeCastResult_Ffi.get_fraction(this);

	inline function set_fraction(value:Single):Single return Physics2DShapeCastResult_Ffi.set_fraction(this, value);
	public var hit(get, set):Bool;

	inline function get_hit():Bool return Physics2DShapeCastResult_Ffi.get_hit(this);

	inline function set_hit(value:Bool):Bool return Physics2DShapeCastResult_Ffi.set_hit(this, value);
	public var normalX(get, set):Single;

	inline function get_normalX():Single return Physics2DShapeCastResult_Ffi.get_normalX(this);

	inline function set_normalX(value:Single):Single return Physics2DShapeCastResult_Ffi.set_normalX(this, value);
	public var normalY(get, set):Single;

	inline function get_normalY():Single return Physics2DShapeCastResult_Ffi.get_normalY(this);

	inline function set_normalY(value:Single):Single return Physics2DShapeCastResult_Ffi.set_normalY(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return Physics2DShapeCastResult_Ffi.get_x(this);

	inline function set_x(value:Single):Single return Physics2DShapeCastResult_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return Physics2DShapeCastResult_Ffi.get_y(this);

	inline function set_y(value:Single):Single return Physics2DShapeCastResult_Ffi.set_y(this, value);
}
