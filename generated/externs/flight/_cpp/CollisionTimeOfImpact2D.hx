package flight._cpp;

private extern class CollisionTimeOfImpact2D_Ffi {
	@:native("flight_get_collision_time_of_impact2_d_fraction") static function get_fraction(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_time_of_impact2_d_fraction") static function set_fraction(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_time_of_impact2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_time_of_impact2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_time_of_impact2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_time_of_impact2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_time_of_impact2_d_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_time_of_impact2_d_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_time_of_impact2_d_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_time_of_impact2_d_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionTimeOfImpact2D(cpp.Star<cpp.Void>) {
	public var fraction(get, set):Single;

	inline function get_fraction():Single return CollisionTimeOfImpact2D_Ffi.get_fraction(this);

	inline function set_fraction(value:Single):Single return CollisionTimeOfImpact2D_Ffi.set_fraction(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return CollisionTimeOfImpact2D_Ffi.get_x(this);

	inline function set_x(value:Single):Single return CollisionTimeOfImpact2D_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return CollisionTimeOfImpact2D_Ffi.get_y(this);

	inline function set_y(value:Single):Single return CollisionTimeOfImpact2D_Ffi.set_y(this, value);
	public var normalX(get, set):Single;

	inline function get_normalX():Single return CollisionTimeOfImpact2D_Ffi.get_normalX(this);

	inline function set_normalX(value:Single):Single return CollisionTimeOfImpact2D_Ffi.set_normalX(this, value);
	public var normalY(get, set):Single;

	inline function get_normalY():Single return CollisionTimeOfImpact2D_Ffi.get_normalY(this);

	inline function set_normalY(value:Single):Single return CollisionTimeOfImpact2D_Ffi.set_normalY(this, value);
}
