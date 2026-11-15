package flight._js;

@:jsRequire("flight")
private extern class CollisionContactManifold2D_Ffi {
	@:native("flight_get_collision_contact_manifold2_d_overlapping") static function get_overlapping(ptr:Dynamic):Bool;
	@:native("flight_set_collision_contact_manifold2_d_overlapping") static function set_overlapping(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_collision_contact_manifold2_d_normal_x") static function get_normalX(ptr:Dynamic):Float;
	@:native("flight_set_collision_contact_manifold2_d_normal_x") static function set_normalX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_contact_manifold2_d_normal_y") static function get_normalY(ptr:Dynamic):Float;
	@:native("flight_set_collision_contact_manifold2_d_normal_y") static function set_normalY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_contact_manifold2_d_depth") static function get_depth(ptr:Dynamic):Float;
	@:native("flight_set_collision_contact_manifold2_d_depth") static function set_depth(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_contact_manifold2_d_point_count") static function get_pointCount(ptr:Dynamic):Int;
	@:native("flight_set_collision_contact_manifold2_d_point_count") static function set_pointCount(ptr:Dynamic, value:Int):Int;
}

abstract CollisionContactManifold2D(Dynamic) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionContactManifold2D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionContactManifold2D_Ffi.set_overlapping(this, value);
	public var normalX(get, set):Float;

	inline function get_normalX():Float return CollisionContactManifold2D_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float return CollisionContactManifold2D_Ffi.set_normalX(this, value);
	public var normalY(get, set):Float;

	inline function get_normalY():Float return CollisionContactManifold2D_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float return CollisionContactManifold2D_Ffi.set_normalY(this, value);
	public var depth(get, set):Float;

	inline function get_depth():Float return CollisionContactManifold2D_Ffi.get_depth(this);

	inline function set_depth(value:Float):Float return CollisionContactManifold2D_Ffi.set_depth(this, value);
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return CollisionContactManifold2D_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int return CollisionContactManifold2D_Ffi.set_pointCount(this, value);
}
