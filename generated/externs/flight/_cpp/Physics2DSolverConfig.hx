package flight._cpp;

private extern class Physics2DSolverConfig_Ffi {
	@:native("flight_get_physics2_dsolver_config_allow_sleeping") static function get_allowSleeping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dsolver_config_allow_sleeping") static function set_allowSleeping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dsolver_config_continuous_collision") static function get_continuousCollision(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dsolver_config_continuous_collision") static function set_continuousCollision(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dsolver_config_max_ccd_rotation_substeps") static function get_maxCcdRotationSubsteps(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dsolver_config_max_ccd_rotation_substeps") static function set_maxCcdRotationSubsteps(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_max_ccd_substeps") static function get_maxCcdSubsteps(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dsolver_config_max_ccd_substeps") static function set_maxCcdSubsteps(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_penetration_slop") static function get_penetrationSlop(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dsolver_config_penetration_slop") static function set_penetrationSlop(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dsolver_config_position_correction") static function get_positionCorrection(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dsolver_config_position_correction") static function set_positionCorrection(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dsolver_config_position_iterations") static function get_positionIterations(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dsolver_config_position_iterations") static function set_positionIterations(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_restitution_threshold") static function get_restitutionThreshold(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dsolver_config_restitution_threshold") static function set_restitutionThreshold(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dsolver_config_sleep_angular_threshold") static function get_sleepAngularThreshold(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dsolver_config_sleep_angular_threshold") static function set_sleepAngularThreshold(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dsolver_config_sleep_linear_threshold") static function get_sleepLinearThreshold(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dsolver_config_sleep_linear_threshold") static function set_sleepLinearThreshold(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dsolver_config_time_to_sleep") static function get_timeToSleep(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dsolver_config_time_to_sleep") static function set_timeToSleep(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dsolver_config_velocity_iterations") static function get_velocityIterations(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dsolver_config_velocity_iterations") static function set_velocityIterations(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_warm_starting") static function get_warmStarting(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dsolver_config_warm_starting") static function set_warmStarting(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics2DSolverConfig(cpp.Star<cpp.Void>) {
	public var allowSleeping(get, set):Bool;

	inline function get_allowSleeping():Bool return Physics2DSolverConfig_Ffi.get_allowSleeping(this);

	inline function set_allowSleeping(value:Bool):Bool return Physics2DSolverConfig_Ffi.set_allowSleeping(this, value);
	public var continuousCollision(get, set):Bool;

	inline function get_continuousCollision():Bool return Physics2DSolverConfig_Ffi.get_continuousCollision(this);

	inline function set_continuousCollision(value:Bool):Bool return Physics2DSolverConfig_Ffi.set_continuousCollision(this, value);
	public var maxCcdRotationSubsteps(get, set):Int;

	inline function get_maxCcdRotationSubsteps():Int return Physics2DSolverConfig_Ffi.get_maxCcdRotationSubsteps(this);

	inline function set_maxCcdRotationSubsteps(value:Int):Int return Physics2DSolverConfig_Ffi.set_maxCcdRotationSubsteps(this, value);
	public var maxCcdSubsteps(get, set):Int;

	inline function get_maxCcdSubsteps():Int return Physics2DSolverConfig_Ffi.get_maxCcdSubsteps(this);

	inline function set_maxCcdSubsteps(value:Int):Int return Physics2DSolverConfig_Ffi.set_maxCcdSubsteps(this, value);
	public var penetrationSlop(get, set):Single;

	inline function get_penetrationSlop():Single return Physics2DSolverConfig_Ffi.get_penetrationSlop(this);

	inline function set_penetrationSlop(value:Single):Single return Physics2DSolverConfig_Ffi.set_penetrationSlop(this, value);
	public var positionCorrection(get, set):Single;

	inline function get_positionCorrection():Single return Physics2DSolverConfig_Ffi.get_positionCorrection(this);

	inline function set_positionCorrection(value:Single):Single return Physics2DSolverConfig_Ffi.set_positionCorrection(this, value);
	public var positionIterations(get, set):Int;

	inline function get_positionIterations():Int return Physics2DSolverConfig_Ffi.get_positionIterations(this);

	inline function set_positionIterations(value:Int):Int return Physics2DSolverConfig_Ffi.set_positionIterations(this, value);
	public var restitutionThreshold(get, set):Single;

	inline function get_restitutionThreshold():Single return Physics2DSolverConfig_Ffi.get_restitutionThreshold(this);

	inline function set_restitutionThreshold(value:Single):Single return Physics2DSolverConfig_Ffi.set_restitutionThreshold(this, value);
	public var sleepAngularThreshold(get, set):Single;

	inline function get_sleepAngularThreshold():Single return Physics2DSolverConfig_Ffi.get_sleepAngularThreshold(this);

	inline function set_sleepAngularThreshold(value:Single):Single return Physics2DSolverConfig_Ffi.set_sleepAngularThreshold(this, value);
	public var sleepLinearThreshold(get, set):Single;

	inline function get_sleepLinearThreshold():Single return Physics2DSolverConfig_Ffi.get_sleepLinearThreshold(this);

	inline function set_sleepLinearThreshold(value:Single):Single return Physics2DSolverConfig_Ffi.set_sleepLinearThreshold(this, value);
	public var timeToSleep(get, set):Single;

	inline function get_timeToSleep():Single return Physics2DSolverConfig_Ffi.get_timeToSleep(this);

	inline function set_timeToSleep(value:Single):Single return Physics2DSolverConfig_Ffi.set_timeToSleep(this, value);
	public var velocityIterations(get, set):Int;

	inline function get_velocityIterations():Int return Physics2DSolverConfig_Ffi.get_velocityIterations(this);

	inline function set_velocityIterations(value:Int):Int return Physics2DSolverConfig_Ffi.set_velocityIterations(this, value);
	public var warmStarting(get, set):Bool;

	inline function get_warmStarting():Bool return Physics2DSolverConfig_Ffi.get_warmStarting(this);

	inline function set_warmStarting(value:Bool):Bool return Physics2DSolverConfig_Ffi.set_warmStarting(this, value);
}
