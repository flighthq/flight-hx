package flight._cpp;

private extern class CollisionManifold3D_Ffi {
	@:native("flight_get_collision_manifold3_d_overlapping") static function get_overlapping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_collision_manifold3_d_overlapping") static function set_overlapping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_collision_manifold3_d_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_manifold3_d_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_manifold3_d_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_manifold3_d_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_manifold3_d_normal_z") static function get_normalZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_manifold3_d_normal_z") static function set_normalZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_manifold3_d_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_manifold3_d_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionManifold3D(cpp.Star<cpp.Void>) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionManifold3D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionManifold3D_Ffi.set_overlapping(this, value);
	public var normalX(get, set):Single;

	inline function get_normalX():Single return CollisionManifold3D_Ffi.get_normalX(this);

	inline function set_normalX(value:Single):Single return CollisionManifold3D_Ffi.set_normalX(this, value);
	public var normalY(get, set):Single;

	inline function get_normalY():Single return CollisionManifold3D_Ffi.get_normalY(this);

	inline function set_normalY(value:Single):Single return CollisionManifold3D_Ffi.set_normalY(this, value);
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return CollisionManifold3D_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Single):Single return CollisionManifold3D_Ffi.set_normalZ(this, value);
	public var depth(get, set):Single;

	inline function get_depth():Single return CollisionManifold3D_Ffi.get_depth(this);

	inline function set_depth(value:Single):Single return CollisionManifold3D_Ffi.set_depth(this, value);
}
