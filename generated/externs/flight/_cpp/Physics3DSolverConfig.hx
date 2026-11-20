package flight._cpp;

private extern class Physics3DSolverConfig_Ffi {
	@:native("flight_get_physics3_dsolver_config_allow_sleeping") static function get_allowSleeping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dsolver_config_allow_sleeping") static function set_allowSleeping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dsolver_config_sleep_linear_threshold") static function get_sleepLinearThreshold(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dsolver_config_sleep_linear_threshold") static function set_sleepLinearThreshold(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dsolver_config_sleep_angular_threshold") static function get_sleepAngularThreshold(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dsolver_config_sleep_angular_threshold") static function set_sleepAngularThreshold(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dsolver_config_time_to_sleep") static function get_timeToSleep(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dsolver_config_time_to_sleep") static function set_timeToSleep(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dsolver_config_substeps") static function get_substeps(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dsolver_config_substeps") static function set_substeps(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dsolver_config_continuous_collision") static function get_continuousCollision(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dsolver_config_continuous_collision") static function set_continuousCollision(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dsolver_config_max_ccd_substeps") static function get_maxCcdSubsteps(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dsolver_config_max_ccd_substeps") static function set_maxCcdSubsteps(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dsolver_config_max_ccd_rotation_substeps") static function get_maxCcdRotationSubsteps(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dsolver_config_max_ccd_rotation_substeps") static function set_maxCcdRotationSubsteps(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DSolverConfig(cpp.Star<cpp.Void>) {
	public var allowSleeping(get, set):Bool;

	inline function get_allowSleeping():Bool return Physics3DSolverConfig_Ffi.get_allowSleeping(this);

	inline function set_allowSleeping(value:Bool):Bool { Physics3DSolverConfig_Ffi.set_allowSleeping(this, value); return value; }
	public var sleepLinearThreshold(get, set):Float;

	inline function get_sleepLinearThreshold():Float return Physics3DSolverConfig_Ffi.get_sleepLinearThreshold(this);

	inline function set_sleepLinearThreshold(value:Float):Float { Physics3DSolverConfig_Ffi.set_sleepLinearThreshold(this, value); return value; }
	public var sleepAngularThreshold(get, set):Float;

	inline function get_sleepAngularThreshold():Float return Physics3DSolverConfig_Ffi.get_sleepAngularThreshold(this);

	inline function set_sleepAngularThreshold(value:Float):Float { Physics3DSolverConfig_Ffi.set_sleepAngularThreshold(this, value); return value; }
	public var timeToSleep(get, set):Float;

	inline function get_timeToSleep():Float return Physics3DSolverConfig_Ffi.get_timeToSleep(this);

	inline function set_timeToSleep(value:Float):Float { Physics3DSolverConfig_Ffi.set_timeToSleep(this, value); return value; }
	public var substeps(get, set):Int;

	inline function get_substeps():Int return Physics3DSolverConfig_Ffi.get_substeps(this);

	inline function set_substeps(value:Int):Int { Physics3DSolverConfig_Ffi.set_substeps(this, value); return value; }
	public var continuousCollision(get, set):Bool;

	inline function get_continuousCollision():Bool return Physics3DSolverConfig_Ffi.get_continuousCollision(this);

	inline function set_continuousCollision(value:Bool):Bool { Physics3DSolverConfig_Ffi.set_continuousCollision(this, value); return value; }
	public var maxCcdSubsteps(get, set):Int;

	inline function get_maxCcdSubsteps():Int return Physics3DSolverConfig_Ffi.get_maxCcdSubsteps(this);

	inline function set_maxCcdSubsteps(value:Int):Int { Physics3DSolverConfig_Ffi.set_maxCcdSubsteps(this, value); return value; }
	public var maxCcdRotationSubsteps(get, set):Int;

	inline function get_maxCcdRotationSubsteps():Int return Physics3DSolverConfig_Ffi.get_maxCcdRotationSubsteps(this);

	inline function set_maxCcdRotationSubsteps(value:Int):Int { Physics3DSolverConfig_Ffi.set_maxCcdRotationSubsteps(this, value); return value; }
}
