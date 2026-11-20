package flight._cpp;

private extern class CollisionTimeOfImpact3D_Ffi {
	@:native("flight_get_collision_time_of_impact3_d_fraction") static function get_fraction(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_time_of_impact3_d_fraction") static function set_fraction(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_time_of_impact3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_time_of_impact3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_time_of_impact3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_time_of_impact3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_time_of_impact3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_time_of_impact3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_time_of_impact3_d_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_time_of_impact3_d_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_time_of_impact3_d_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_time_of_impact3_d_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_time_of_impact3_d_normal_z") static function get_normalZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_time_of_impact3_d_normal_z") static function set_normalZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionTimeOfImpact3D(cpp.Star<cpp.Void>) {
	public var fraction(get, set):Float;

	inline function get_fraction():Float return CollisionTimeOfImpact3D_Ffi.get_fraction(this);

	inline function set_fraction(value:Float):Float { CollisionTimeOfImpact3D_Ffi.set_fraction(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return CollisionTimeOfImpact3D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CollisionTimeOfImpact3D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CollisionTimeOfImpact3D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CollisionTimeOfImpact3D_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return CollisionTimeOfImpact3D_Ffi.get_z(this);

	inline function set_z(value:Float):Float { CollisionTimeOfImpact3D_Ffi.set_z(this, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return CollisionTimeOfImpact3D_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float { CollisionTimeOfImpact3D_Ffi.set_normalX(this, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return CollisionTimeOfImpact3D_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float { CollisionTimeOfImpact3D_Ffi.set_normalY(this, value); return value; }
	public var normalZ(get, set):Float;

	inline function get_normalZ():Float return CollisionTimeOfImpact3D_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Float):Float { CollisionTimeOfImpact3D_Ffi.set_normalZ(this, value); return value; }
}
