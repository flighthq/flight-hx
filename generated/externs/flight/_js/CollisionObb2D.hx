package flight._js;

@:jsRequire("flight")
private extern class CollisionObb2D_Ffi {
	@:native("flight_get_collision_obb2_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_collision_obb2_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_obb2_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_collision_obb2_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_obb2_d_half_w") static function get_halfW(ptr:Dynamic):Float;
	@:native("flight_set_collision_obb2_d_half_w") static function set_halfW(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_obb2_d_half_h") static function get_halfH(ptr:Dynamic):Float;
	@:native("flight_set_collision_obb2_d_half_h") static function set_halfH(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_obb2_d_rotation") static function get_rotation(ptr:Dynamic):Float;
	@:native("flight_set_collision_obb2_d_rotation") static function set_rotation(ptr:Dynamic, value:Float):Float;
}

abstract CollisionObb2D(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionObb2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return CollisionObb2D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return CollisionObb2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return CollisionObb2D_Ffi.set_y(this, value);
	public var halfW(get, set):Float;

	inline function get_halfW():Float return CollisionObb2D_Ffi.get_halfW(this);

	inline function set_halfW(value:Float):Float return CollisionObb2D_Ffi.set_halfW(this, value);
	public var halfH(get, set):Float;

	inline function get_halfH():Float return CollisionObb2D_Ffi.get_halfH(this);

	inline function set_halfH(value:Float):Float return CollisionObb2D_Ffi.set_halfH(this, value);
	public var rotation(get, set):Float;

	inline function get_rotation():Float return CollisionObb2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float return CollisionObb2D_Ffi.set_rotation(this, value);
}
