package flight._cpp;

private extern class Physics3DWorld_Ffi {
	@:native("flight_get_physics3_dworld_version") static function get_version(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dworld_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dworld_gravity_x") static function get_gravityX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dworld_gravity_x") static function set_gravityX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dworld_gravity_y") static function get_gravityY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dworld_gravity_y") static function set_gravityY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dworld_gravity_z") static function get_gravityZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dworld_gravity_z") static function set_gravityZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dworld_previous_timestep") static function get_previousTimestep(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dworld_previous_timestep") static function set_previousTimestep(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dworld_next_body_index") static function get_nextBodyIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dworld_next_body_index") static function set_nextBodyIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DWorld(cpp.Star<cpp.Void>) {
	public var version(get, set):Int;

	inline function get_version():Int return Physics3DWorld_Ffi.get_version(this);

	inline function set_version(value:Int):Int { Physics3DWorld_Ffi.set_version(this, value); return value; }
	public var gravityX(get, set):Single;

	inline function get_gravityX():Single return Physics3DWorld_Ffi.get_gravityX(this);

	inline function set_gravityX(value:Single):Single { Physics3DWorld_Ffi.set_gravityX(this, value); return value; }
	public var gravityY(get, set):Single;

	inline function get_gravityY():Single return Physics3DWorld_Ffi.get_gravityY(this);

	inline function set_gravityY(value:Single):Single { Physics3DWorld_Ffi.set_gravityY(this, value); return value; }
	public var gravityZ(get, set):Single;

	inline function get_gravityZ():Single return Physics3DWorld_Ffi.get_gravityZ(this);

	inline function set_gravityZ(value:Single):Single { Physics3DWorld_Ffi.set_gravityZ(this, value); return value; }
	public var previousTimestep(get, set):Single;

	inline function get_previousTimestep():Single return Physics3DWorld_Ffi.get_previousTimestep(this);

	inline function set_previousTimestep(value:Single):Single { Physics3DWorld_Ffi.set_previousTimestep(this, value); return value; }
	public var nextBodyIndex(get, set):Int;

	inline function get_nextBodyIndex():Int return Physics3DWorld_Ffi.get_nextBodyIndex(this);

	inline function set_nextBodyIndex(value:Int):Int { Physics3DWorld_Ffi.set_nextBodyIndex(this, value); return value; }
}
