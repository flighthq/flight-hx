package flight._cpp;

private extern class CollisionDistance3D_Ffi {
	@:native("flight_get_collision_distance3_d_distance") static function get_distance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_distance") static function set_distance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_direction_x") static function get_directionX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_direction_x") static function set_directionX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_direction_y") static function get_directionY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_direction_y") static function set_directionY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_direction_z") static function get_directionZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_direction_z") static function set_directionZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_point_a_x") static function get_pointAX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_point_a_x") static function set_pointAX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_point_a_y") static function get_pointAY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_point_a_y") static function set_pointAY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_point_a_z") static function get_pointAZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_point_a_z") static function set_pointAZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_point_b_x") static function get_pointBX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_point_b_x") static function set_pointBX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_point_b_y") static function get_pointBY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_point_b_y") static function set_pointBY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_point_b_z") static function get_pointBZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_distance3_d_point_b_z") static function set_pointBZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_distance3_d_overlapping") static function get_overlapping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_collision_distance3_d_overlapping") static function set_overlapping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract CollisionDistance3D(cpp.Star<cpp.Void>) {
	public var distance(get, set):Single;

	inline function get_distance():Single return CollisionDistance3D_Ffi.get_distance(this);

	inline function set_distance(value:Single):Single return CollisionDistance3D_Ffi.set_distance(this, value);
	public var directionX(get, set):Single;

	inline function get_directionX():Single return CollisionDistance3D_Ffi.get_directionX(this);

	inline function set_directionX(value:Single):Single return CollisionDistance3D_Ffi.set_directionX(this, value);
	public var directionY(get, set):Single;

	inline function get_directionY():Single return CollisionDistance3D_Ffi.get_directionY(this);

	inline function set_directionY(value:Single):Single return CollisionDistance3D_Ffi.set_directionY(this, value);
	public var directionZ(get, set):Single;

	inline function get_directionZ():Single return CollisionDistance3D_Ffi.get_directionZ(this);

	inline function set_directionZ(value:Single):Single return CollisionDistance3D_Ffi.set_directionZ(this, value);
	public var pointAX(get, set):Single;

	inline function get_pointAX():Single return CollisionDistance3D_Ffi.get_pointAX(this);

	inline function set_pointAX(value:Single):Single return CollisionDistance3D_Ffi.set_pointAX(this, value);
	public var pointAY(get, set):Single;

	inline function get_pointAY():Single return CollisionDistance3D_Ffi.get_pointAY(this);

	inline function set_pointAY(value:Single):Single return CollisionDistance3D_Ffi.set_pointAY(this, value);
	public var pointAZ(get, set):Single;

	inline function get_pointAZ():Single return CollisionDistance3D_Ffi.get_pointAZ(this);

	inline function set_pointAZ(value:Single):Single return CollisionDistance3D_Ffi.set_pointAZ(this, value);
	public var pointBX(get, set):Single;

	inline function get_pointBX():Single return CollisionDistance3D_Ffi.get_pointBX(this);

	inline function set_pointBX(value:Single):Single return CollisionDistance3D_Ffi.set_pointBX(this, value);
	public var pointBY(get, set):Single;

	inline function get_pointBY():Single return CollisionDistance3D_Ffi.get_pointBY(this);

	inline function set_pointBY(value:Single):Single return CollisionDistance3D_Ffi.set_pointBY(this, value);
	public var pointBZ(get, set):Single;

	inline function get_pointBZ():Single return CollisionDistance3D_Ffi.get_pointBZ(this);

	inline function set_pointBZ(value:Single):Single return CollisionDistance3D_Ffi.set_pointBZ(this, value);
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionDistance3D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionDistance3D_Ffi.set_overlapping(this, value);
}
