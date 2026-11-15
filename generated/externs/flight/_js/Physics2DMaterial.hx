package flight._js;

@:jsRequire("flight")
private extern class Physics2DMaterial_Ffi {
	@:native("flight_get_physics2_dmaterial_density") static function get_density(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmaterial_density") static function set_density(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmaterial_friction") static function get_friction(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmaterial_friction") static function set_friction(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmaterial_restitution") static function get_restitution(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmaterial_restitution") static function set_restitution(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DMaterial(Dynamic) {
	public var density(get, set):Float;

	inline function get_density():Float return Physics2DMaterial_Ffi.get_density(this);

	inline function set_density(value:Float):Float return Physics2DMaterial_Ffi.set_density(this, value);
	public var friction(get, set):Float;

	inline function get_friction():Float return Physics2DMaterial_Ffi.get_friction(this);

	inline function set_friction(value:Float):Float return Physics2DMaterial_Ffi.set_friction(this, value);
	public var restitution(get, set):Float;

	inline function get_restitution():Float return Physics2DMaterial_Ffi.get_restitution(this);

	inline function set_restitution(value:Float):Float return Physics2DMaterial_Ffi.set_restitution(this, value);
}
