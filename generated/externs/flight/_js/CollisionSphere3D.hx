package flight._js;

@:jsRequire("flight")
private extern class CollisionSphere3D_Ffi {
	@:native("flight_get_collision_sphere3_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_collision_sphere3_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_sphere3_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_collision_sphere3_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_sphere3_d_z") static function get_z(ptr:Dynamic):Float;
	@:native("flight_set_collision_sphere3_d_z") static function set_z(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_sphere3_d_radius") static function get_radius(ptr:Dynamic):Float;
	@:native("flight_set_collision_sphere3_d_radius") static function set_radius(ptr:Dynamic, value:Float):Float;
}

abstract CollisionSphere3D(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionSphere3D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return CollisionSphere3D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return CollisionSphere3D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return CollisionSphere3D_Ffi.set_y(this, value);
	public var z(get, set):Float;

	inline function get_z():Float return CollisionSphere3D_Ffi.get_z(this);

	inline function set_z(value:Float):Float return CollisionSphere3D_Ffi.set_z(this, value);
	public var radius(get, set):Float;

	inline function get_radius():Float return CollisionSphere3D_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float return CollisionSphere3D_Ffi.set_radius(this, value);
}
