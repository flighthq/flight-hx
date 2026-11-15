package flight._cpp;

private extern class CollisionContactManifold3D_Ffi {
	@:native("flight_get_collision_contact_manifold3_d_overlapping") static function get_overlapping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_collision_contact_manifold3_d_overlapping") static function set_overlapping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_collision_contact_manifold3_d_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_contact_manifold3_d_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_contact_manifold3_d_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_contact_manifold3_d_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_contact_manifold3_d_normal_z") static function get_normalZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_contact_manifold3_d_normal_z") static function set_normalZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_contact_manifold3_d_point_count") static function get_pointCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collision_contact_manifold3_d_point_count") static function set_pointCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract CollisionContactManifold3D(cpp.Star<cpp.Void>) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionContactManifold3D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionContactManifold3D_Ffi.set_overlapping(this, value);
	public var normalX(get, set):Single;

	inline function get_normalX():Single return CollisionContactManifold3D_Ffi.get_normalX(this);

	inline function set_normalX(value:Single):Single return CollisionContactManifold3D_Ffi.set_normalX(this, value);
	public var normalY(get, set):Single;

	inline function get_normalY():Single return CollisionContactManifold3D_Ffi.get_normalY(this);

	inline function set_normalY(value:Single):Single return CollisionContactManifold3D_Ffi.set_normalY(this, value);
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return CollisionContactManifold3D_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Single):Single return CollisionContactManifold3D_Ffi.set_normalZ(this, value);
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return CollisionContactManifold3D_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int return CollisionContactManifold3D_Ffi.set_pointCount(this, value);
}
