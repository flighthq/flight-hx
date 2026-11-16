package flight._cpp;

private extern class CollisionContactPoint3D_Ffi {
	@:native("flight_get_collision_contact_point3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_contact_point3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_contact_point3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_contact_point3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_contact_point3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_contact_point3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_contact_point3_d_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_contact_point3_d_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_contact_point3_d_feature_id") static function get_featureId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_collision_contact_point3_d_feature_id") static function set_featureId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract CollisionContactPoint3D(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return CollisionContactPoint3D_Ffi.get_x(this);

	inline function set_x(value:Single):Single { CollisionContactPoint3D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return CollisionContactPoint3D_Ffi.get_y(this);

	inline function set_y(value:Single):Single { CollisionContactPoint3D_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return CollisionContactPoint3D_Ffi.get_z(this);

	inline function set_z(value:Single):Single { CollisionContactPoint3D_Ffi.set_z(this, value); return value; }
	public var depth(get, set):Single;

	inline function get_depth():Single return CollisionContactPoint3D_Ffi.get_depth(this);

	inline function set_depth(value:Single):Single { CollisionContactPoint3D_Ffi.set_depth(this, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return CollisionContactPoint3D_Ffi.get_featureId(this);

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { CollisionContactPoint3D_Ffi.set_featureId(this, value); return value; }
}
