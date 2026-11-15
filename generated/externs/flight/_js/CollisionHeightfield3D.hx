package flight._js;

@:jsRequire("flight")
private extern class CollisionHeightfield3D_Ffi {
	@:native("flight_get_collision_heightfield3_d_columns") static function get_columns(ptr:Dynamic):Int;
	@:native("flight_set_collision_heightfield3_d_columns") static function set_columns(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_collision_heightfield3_d_rows") static function get_rows(ptr:Dynamic):Int;
	@:native("flight_set_collision_heightfield3_d_rows") static function set_rows(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_collision_heightfield3_d_cell_size_x") static function get_cellSizeX(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_cell_size_x") static function set_cellSizeX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_cell_size_z") static function get_cellSizeZ(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_cell_size_z") static function set_cellSizeZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_version") static function get_version(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_collision_heightfield3_d_version") static function set_version(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_collision_heightfield3_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_z") static function get_z(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_z") static function set_z(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_rotation_x") static function get_rotationX(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_rotation_x") static function set_rotationX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_rotation_y") static function get_rotationY(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_rotation_y") static function set_rotationY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_rotation_z") static function get_rotationZ(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_rotation_z") static function set_rotationZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_heightfield3_d_rotation_w") static function get_rotationW(ptr:Dynamic):Float;
	@:native("flight_set_collision_heightfield3_d_rotation_w") static function set_rotationW(ptr:Dynamic, value:Float):Float;
}

abstract CollisionHeightfield3D(Dynamic) {
	public var columns(get, set):Int;

	inline function get_columns():Int return CollisionHeightfield3D_Ffi.get_columns(this);

	inline function set_columns(value:Int):Int return CollisionHeightfield3D_Ffi.set_columns(this, value);
	public var rows(get, set):Int;

	inline function get_rows():Int return CollisionHeightfield3D_Ffi.get_rows(this);

	inline function set_rows(value:Int):Int return CollisionHeightfield3D_Ffi.set_rows(this, value);
	public var cellSizeX(get, set):Float;

	inline function get_cellSizeX():Float return CollisionHeightfield3D_Ffi.get_cellSizeX(this);

	inline function set_cellSizeX(value:Float):Float return CollisionHeightfield3D_Ffi.set_cellSizeX(this, value);
	public var cellSizeZ(get, set):Float;

	inline function get_cellSizeZ():Float return CollisionHeightfield3D_Ffi.get_cellSizeZ(this);

	inline function set_cellSizeZ(value:Float):Float return CollisionHeightfield3D_Ffi.set_cellSizeZ(this, value);
	public var version(get, set):haxe.Int64;

	inline function get_version():haxe.Int64 return CollisionHeightfield3D_Ffi.get_version(this);

	inline function set_version(value:haxe.Int64):haxe.Int64 return CollisionHeightfield3D_Ffi.set_version(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return CollisionHeightfield3D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return CollisionHeightfield3D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return CollisionHeightfield3D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return CollisionHeightfield3D_Ffi.set_y(this, value);
	public var z(get, set):Float;

	inline function get_z():Float return CollisionHeightfield3D_Ffi.get_z(this);

	inline function set_z(value:Float):Float return CollisionHeightfield3D_Ffi.set_z(this, value);
	public var rotationX(get, set):Float;

	inline function get_rotationX():Float return CollisionHeightfield3D_Ffi.get_rotationX(this);

	inline function set_rotationX(value:Float):Float return CollisionHeightfield3D_Ffi.set_rotationX(this, value);
	public var rotationY(get, set):Float;

	inline function get_rotationY():Float return CollisionHeightfield3D_Ffi.get_rotationY(this);

	inline function set_rotationY(value:Float):Float return CollisionHeightfield3D_Ffi.set_rotationY(this, value);
	public var rotationZ(get, set):Float;

	inline function get_rotationZ():Float return CollisionHeightfield3D_Ffi.get_rotationZ(this);

	inline function set_rotationZ(value:Float):Float return CollisionHeightfield3D_Ffi.set_rotationZ(this, value);
	public var rotationW(get, set):Float;

	inline function get_rotationW():Float return CollisionHeightfield3D_Ffi.get_rotationW(this);

	inline function set_rotationW(value:Float):Float return CollisionHeightfield3D_Ffi.set_rotationW(this, value);
}
