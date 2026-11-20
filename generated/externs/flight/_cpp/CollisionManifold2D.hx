package flight._cpp;

private extern class CollisionManifold2D_Ffi {
	@:native("flight_get_collision_manifold2_d_overlapping") static function get_overlapping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_collision_manifold2_d_overlapping") static function set_overlapping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_collision_manifold2_d_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_manifold2_d_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_manifold2_d_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_manifold2_d_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_manifold2_d_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_manifold2_d_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionManifold2D(cpp.Star<cpp.Void>) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionManifold2D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool { CollisionManifold2D_Ffi.set_overlapping(this, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return CollisionManifold2D_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float { CollisionManifold2D_Ffi.set_normalX(this, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return CollisionManifold2D_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float { CollisionManifold2D_Ffi.set_normalY(this, value); return value; }
	public var depth(get, set):Float;

	inline function get_depth():Float return CollisionManifold2D_Ffi.get_depth(this);

	inline function set_depth(value:Float):Float { CollisionManifold2D_Ffi.set_depth(this, value); return value; }
}
