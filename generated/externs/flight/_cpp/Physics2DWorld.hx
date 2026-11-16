package flight._cpp;

private extern class Physics2DWorld_Ffi {
	@:native("flight_get_physics2_dworld_gravity_x") static function get_gravityX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dworld_gravity_x") static function set_gravityX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dworld_gravity_y") static function get_gravityY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dworld_gravity_y") static function set_gravityY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dworld_next_body_index") static function get_nextBodyIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dworld_next_body_index") static function set_nextBodyIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dworld_previous_timestep") static function get_previousTimestep(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dworld_previous_timestep") static function set_previousTimestep(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dworld_version") static function get_version(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dworld_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DWorld(cpp.Star<cpp.Void>) {
	public var gravityX(get, set):Single;

	inline function get_gravityX():Single return Physics2DWorld_Ffi.get_gravityX(this);

	inline function set_gravityX(value:Single):Single { Physics2DWorld_Ffi.set_gravityX(this, value); return value; }
	public var gravityY(get, set):Single;

	inline function get_gravityY():Single return Physics2DWorld_Ffi.get_gravityY(this);

	inline function set_gravityY(value:Single):Single { Physics2DWorld_Ffi.set_gravityY(this, value); return value; }
	public var nextBodyIndex(get, set):Int;

	inline function get_nextBodyIndex():Int return Physics2DWorld_Ffi.get_nextBodyIndex(this);

	inline function set_nextBodyIndex(value:Int):Int { Physics2DWorld_Ffi.set_nextBodyIndex(this, value); return value; }
	public var previousTimestep(get, set):Float;

	inline function get_previousTimestep():Float return Physics2DWorld_Ffi.get_previousTimestep(this);

	inline function set_previousTimestep(value:Float):Float { Physics2DWorld_Ffi.set_previousTimestep(this, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return Physics2DWorld_Ffi.get_version(this);

	inline function set_version(value:Int):Int { Physics2DWorld_Ffi.set_version(this, value); return value; }
}
