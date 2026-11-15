package flight._js;

@:jsRequire("flight")
private extern class CollisionCylinder3D_Ffi {
	@:native("flight_get_collision_cylinder3_d_x0") static function get_x0(ptr:Dynamic):Float;
	@:native("flight_set_collision_cylinder3_d_x0") static function set_x0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_cylinder3_d_y0") static function get_y0(ptr:Dynamic):Float;
	@:native("flight_set_collision_cylinder3_d_y0") static function set_y0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_cylinder3_d_z0") static function get_z0(ptr:Dynamic):Float;
	@:native("flight_set_collision_cylinder3_d_z0") static function set_z0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_cylinder3_d_x1") static function get_x1(ptr:Dynamic):Float;
	@:native("flight_set_collision_cylinder3_d_x1") static function set_x1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_cylinder3_d_y1") static function get_y1(ptr:Dynamic):Float;
	@:native("flight_set_collision_cylinder3_d_y1") static function set_y1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_cylinder3_d_z1") static function get_z1(ptr:Dynamic):Float;
	@:native("flight_set_collision_cylinder3_d_z1") static function set_z1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_cylinder3_d_radius") static function get_radius(ptr:Dynamic):Float;
	@:native("flight_set_collision_cylinder3_d_radius") static function set_radius(ptr:Dynamic, value:Float):Float;
}

abstract CollisionCylinder3D(Dynamic) {
	public var x0(get, set):Float;

	inline function get_x0():Float return CollisionCylinder3D_Ffi.get_x0(this);

	inline function set_x0(value:Float):Float return CollisionCylinder3D_Ffi.set_x0(this, value);
	public var y0(get, set):Float;

	inline function get_y0():Float return CollisionCylinder3D_Ffi.get_y0(this);

	inline function set_y0(value:Float):Float return CollisionCylinder3D_Ffi.set_y0(this, value);
	public var z0(get, set):Float;

	inline function get_z0():Float return CollisionCylinder3D_Ffi.get_z0(this);

	inline function set_z0(value:Float):Float return CollisionCylinder3D_Ffi.set_z0(this, value);
	public var x1(get, set):Float;

	inline function get_x1():Float return CollisionCylinder3D_Ffi.get_x1(this);

	inline function set_x1(value:Float):Float return CollisionCylinder3D_Ffi.set_x1(this, value);
	public var y1(get, set):Float;

	inline function get_y1():Float return CollisionCylinder3D_Ffi.get_y1(this);

	inline function set_y1(value:Float):Float return CollisionCylinder3D_Ffi.set_y1(this, value);
	public var z1(get, set):Float;

	inline function get_z1():Float return CollisionCylinder3D_Ffi.get_z1(this);

	inline function set_z1(value:Float):Float return CollisionCylinder3D_Ffi.set_z1(this, value);
	public var radius(get, set):Float;

	inline function get_radius():Float return CollisionCylinder3D_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float return CollisionCylinder3D_Ffi.set_radius(this, value);
}
