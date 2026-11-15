package flight._js;

@:jsRequire("flight")
private extern class CollisionDistance3D_Ffi {
	@:native("flight_get_collision_distance3_d_distance") static function get_distance(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_distance") static function set_distance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_direction_x") static function get_directionX(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_direction_x") static function set_directionX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_direction_y") static function get_directionY(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_direction_y") static function set_directionY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_direction_z") static function get_directionZ(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_direction_z") static function set_directionZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_point_a_x") static function get_pointAX(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_point_a_x") static function set_pointAX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_point_a_y") static function get_pointAY(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_point_a_y") static function set_pointAY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_point_a_z") static function get_pointAZ(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_point_a_z") static function set_pointAZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_point_b_x") static function get_pointBX(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_point_b_x") static function set_pointBX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_point_b_y") static function get_pointBY(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_point_b_y") static function set_pointBY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_point_b_z") static function get_pointBZ(ptr:Dynamic):Float;
	@:native("flight_set_collision_distance3_d_point_b_z") static function set_pointBZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_distance3_d_overlapping") static function get_overlapping(ptr:Dynamic):Bool;
	@:native("flight_set_collision_distance3_d_overlapping") static function set_overlapping(ptr:Dynamic, value:Bool):Bool;
}

abstract CollisionDistance3D(Dynamic) {
	public var distance(get, set):Float;

	inline function get_distance():Float return CollisionDistance3D_Ffi.get_distance(this);

	inline function set_distance(value:Float):Float return CollisionDistance3D_Ffi.set_distance(this, value);
	public var directionX(get, set):Float;

	inline function get_directionX():Float return CollisionDistance3D_Ffi.get_directionX(this);

	inline function set_directionX(value:Float):Float return CollisionDistance3D_Ffi.set_directionX(this, value);
	public var directionY(get, set):Float;

	inline function get_directionY():Float return CollisionDistance3D_Ffi.get_directionY(this);

	inline function set_directionY(value:Float):Float return CollisionDistance3D_Ffi.set_directionY(this, value);
	public var directionZ(get, set):Float;

	inline function get_directionZ():Float return CollisionDistance3D_Ffi.get_directionZ(this);

	inline function set_directionZ(value:Float):Float return CollisionDistance3D_Ffi.set_directionZ(this, value);
	public var pointAX(get, set):Float;

	inline function get_pointAX():Float return CollisionDistance3D_Ffi.get_pointAX(this);

	inline function set_pointAX(value:Float):Float return CollisionDistance3D_Ffi.set_pointAX(this, value);
	public var pointAY(get, set):Float;

	inline function get_pointAY():Float return CollisionDistance3D_Ffi.get_pointAY(this);

	inline function set_pointAY(value:Float):Float return CollisionDistance3D_Ffi.set_pointAY(this, value);
	public var pointAZ(get, set):Float;

	inline function get_pointAZ():Float return CollisionDistance3D_Ffi.get_pointAZ(this);

	inline function set_pointAZ(value:Float):Float return CollisionDistance3D_Ffi.set_pointAZ(this, value);
	public var pointBX(get, set):Float;

	inline function get_pointBX():Float return CollisionDistance3D_Ffi.get_pointBX(this);

	inline function set_pointBX(value:Float):Float return CollisionDistance3D_Ffi.set_pointBX(this, value);
	public var pointBY(get, set):Float;

	inline function get_pointBY():Float return CollisionDistance3D_Ffi.get_pointBY(this);

	inline function set_pointBY(value:Float):Float return CollisionDistance3D_Ffi.set_pointBY(this, value);
	public var pointBZ(get, set):Float;

	inline function get_pointBZ():Float return CollisionDistance3D_Ffi.get_pointBZ(this);

	inline function set_pointBZ(value:Float):Float return CollisionDistance3D_Ffi.set_pointBZ(this, value);
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionDistance3D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionDistance3D_Ffi.set_overlapping(this, value);
}
