package flight._cpp;

private extern class CollisionContactPoint2D_Ffi {
	@:native("flight_get_collision_contact_point2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_contact_point2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_contact_point2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_contact_point2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_contact_point2_d_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_contact_point2_d_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_contact_point2_d_feature_id") static function get_featureId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_collision_contact_point2_d_feature_id") static function set_featureId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract CollisionContactPoint2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionContactPoint2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CollisionContactPoint2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CollisionContactPoint2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CollisionContactPoint2D_Ffi.set_y(this, value); return value; }
	public var depth(get, set):Float;

	inline function get_depth():Float return CollisionContactPoint2D_Ffi.get_depth(this);

	inline function set_depth(value:Float):Float { CollisionContactPoint2D_Ffi.set_depth(this, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return CollisionContactPoint2D_Ffi.get_featureId(this);

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { CollisionContactPoint2D_Ffi.set_featureId(this, value); return value; }
}
