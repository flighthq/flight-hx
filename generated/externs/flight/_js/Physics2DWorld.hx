package flight._js;

@:jsRequire("flight")
private extern class Physics2DWorld_Ffi {
	@:native("flight_get_physics2_dworld_gravity_x") static function get_gravityX(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dworld_gravity_x") static function set_gravityX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dworld_gravity_y") static function get_gravityY(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dworld_gravity_y") static function set_gravityY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dworld_next_body_index") static function get_nextBodyIndex(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dworld_next_body_index") static function set_nextBodyIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dworld_previous_timestep") static function get_previousTimestep(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dworld_previous_timestep") static function set_previousTimestep(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dworld_version") static function get_version(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dworld_version") static function set_version(ptr:Dynamic, value:Int):Int;
}

abstract Physics2DWorld(Dynamic) {
	public var gravityX(get, set):Float;

	inline function get_gravityX():Float return Physics2DWorld_Ffi.get_gravityX(this);

	inline function set_gravityX(value:Float):Float return Physics2DWorld_Ffi.set_gravityX(this, value);
	public var gravityY(get, set):Float;

	inline function get_gravityY():Float return Physics2DWorld_Ffi.get_gravityY(this);

	inline function set_gravityY(value:Float):Float return Physics2DWorld_Ffi.set_gravityY(this, value);
	public var nextBodyIndex(get, set):Int;

	inline function get_nextBodyIndex():Int return Physics2DWorld_Ffi.get_nextBodyIndex(this);

	inline function set_nextBodyIndex(value:Int):Int return Physics2DWorld_Ffi.set_nextBodyIndex(this, value);
	public var previousTimestep(get, set):Float;

	inline function get_previousTimestep():Float return Physics2DWorld_Ffi.get_previousTimestep(this);

	inline function set_previousTimestep(value:Float):Float return Physics2DWorld_Ffi.set_previousTimestep(this, value);
	public var version(get, set):Int;

	inline function get_version():Int return Physics2DWorld_Ffi.get_version(this);

	inline function set_version(value:Int):Int return Physics2DWorld_Ffi.set_version(this, value);
}
