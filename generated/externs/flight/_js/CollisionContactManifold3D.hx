package flight._js;

@:jsRequire("flight")
private extern class CollisionContactManifold3D_Ffi {
	@:native("flight_get_collision_contact_manifold3_d_overlapping") static function get_overlapping(ptr:Dynamic):Bool;
	@:native("flight_set_collision_contact_manifold3_d_overlapping") static function set_overlapping(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_collision_contact_manifold3_d_normal_x") static function get_normalX(ptr:Dynamic):Float;
	@:native("flight_set_collision_contact_manifold3_d_normal_x") static function set_normalX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_contact_manifold3_d_normal_y") static function get_normalY(ptr:Dynamic):Float;
	@:native("flight_set_collision_contact_manifold3_d_normal_y") static function set_normalY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_contact_manifold3_d_normal_z") static function get_normalZ(ptr:Dynamic):Float;
	@:native("flight_set_collision_contact_manifold3_d_normal_z") static function set_normalZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_contact_manifold3_d_point_count") static function get_pointCount(ptr:Dynamic):Int;
	@:native("flight_set_collision_contact_manifold3_d_point_count") static function set_pointCount(ptr:Dynamic, value:Int):Int;
}

abstract CollisionContactManifold3D(Dynamic) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return CollisionContactManifold3D_Ffi.get_overlapping(this);

	inline function set_overlapping(value:Bool):Bool return CollisionContactManifold3D_Ffi.set_overlapping(this, value);
	public var normalX(get, set):Float;

	inline function get_normalX():Float return CollisionContactManifold3D_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float return CollisionContactManifold3D_Ffi.set_normalX(this, value);
	public var normalY(get, set):Float;

	inline function get_normalY():Float return CollisionContactManifold3D_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float return CollisionContactManifold3D_Ffi.set_normalY(this, value);
	public var normalZ(get, set):Float;

	inline function get_normalZ():Float return CollisionContactManifold3D_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Float):Float return CollisionContactManifold3D_Ffi.set_normalZ(this, value);
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return CollisionContactManifold3D_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int return CollisionContactManifold3D_Ffi.set_pointCount(this, value);
}
