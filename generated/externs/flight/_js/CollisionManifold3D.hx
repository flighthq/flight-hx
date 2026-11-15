package flight._js;

@:jsRequire("flight")
private extern class CollisionManifold3D_Ffi {
	@:native("flight_get_collision_manifold3_d_overlapping") static function get_overlapping(ptr:Dynamic):Bool;
	@:native("flight_set_collision_manifold3_d_overlapping") static function set_overlapping(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_collision_manifold3_d_normal_x") static function get_normalX(ptr:Dynamic):Float;
	@:native("flight_set_collision_manifold3_d_normal_x") static function set_normalX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_manifold3_d_normal_y") static function get_normalY(ptr:Dynamic):Float;
	@:native("flight_set_collision_manifold3_d_normal_y") static function set_normalY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_manifold3_d_normal_z") static function get_normalZ(ptr:Dynamic):Float;
	@:native("flight_set_collision_manifold3_d_normal_z") static function set_normalZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_manifold3_d_depth") static function get_depth(ptr:Dynamic):Float;
	@:native("flight_set_collision_manifold3_d_depth") static function set_depth(ptr:Dynamic, value:Float):Float;
}

abstract CollisionManifold3D(Dynamic) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionManifold3D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionManifold3D_Ffi.set_overlapping(this, value);
	public var normalX(get, set):Float;

	inline function get_normalX():Float return CollisionManifold3D_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float return CollisionManifold3D_Ffi.set_normalX(this, value);
	public var normalY(get, set):Float;

	inline function get_normalY():Float return CollisionManifold3D_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float return CollisionManifold3D_Ffi.set_normalY(this, value);
	public var normalZ(get, set):Float;

	inline function get_normalZ():Float return CollisionManifold3D_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Float):Float return CollisionManifold3D_Ffi.set_normalZ(this, value);
	public var depth(get, set):Float;

	inline function get_depth():Float return CollisionManifold3D_Ffi.get_depth(this);

	inline function set_depth(value:Float):Float return CollisionManifold3D_Ffi.set_depth(this, value);
}
