package flight._js;

@:jsRequire("flight")
private extern class Physics2DSolverConfig_Ffi {
	@:native("flight_get_physics2_dsolver_config_allow_sleeping") static function get_allowSleeping(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dsolver_config_allow_sleeping") static function set_allowSleeping(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dsolver_config_continuous_collision") static function get_continuousCollision(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dsolver_config_continuous_collision") static function set_continuousCollision(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dsolver_config_max_ccd_rotation_substeps") static function get_maxCcdRotationSubsteps(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dsolver_config_max_ccd_rotation_substeps") static function set_maxCcdRotationSubsteps(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_max_ccd_substeps") static function get_maxCcdSubsteps(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dsolver_config_max_ccd_substeps") static function set_maxCcdSubsteps(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_penetration_slop") static function get_penetrationSlop(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dsolver_config_penetration_slop") static function set_penetrationSlop(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dsolver_config_position_correction") static function get_positionCorrection(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dsolver_config_position_correction") static function set_positionCorrection(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dsolver_config_position_iterations") static function get_positionIterations(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dsolver_config_position_iterations") static function set_positionIterations(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_restitution_threshold") static function get_restitutionThreshold(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dsolver_config_restitution_threshold") static function set_restitutionThreshold(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dsolver_config_sleep_angular_threshold") static function get_sleepAngularThreshold(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dsolver_config_sleep_angular_threshold") static function set_sleepAngularThreshold(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dsolver_config_sleep_linear_threshold") static function get_sleepLinearThreshold(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dsolver_config_sleep_linear_threshold") static function set_sleepLinearThreshold(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dsolver_config_time_to_sleep") static function get_timeToSleep(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dsolver_config_time_to_sleep") static function set_timeToSleep(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dsolver_config_velocity_iterations") static function get_velocityIterations(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dsolver_config_velocity_iterations") static function set_velocityIterations(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dsolver_config_warm_starting") static function get_warmStarting(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dsolver_config_warm_starting") static function set_warmStarting(ptr:Dynamic, value:Bool):Bool;
}

abstract Physics2DSolverConfig(Dynamic) {
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
	public var penetrationSlop(get, set):Float;

	inline function get_penetrationSlop():Float return Physics2DSolverConfig_Ffi.get_penetrationSlop(this);

	inline function set_penetrationSlop(value:Float):Float return Physics2DSolverConfig_Ffi.set_penetrationSlop(this, value);
	public var positionCorrection(get, set):Float;

	inline function get_positionCorrection():Float return Physics2DSolverConfig_Ffi.get_positionCorrection(this);

	inline function set_positionCorrection(value:Float):Float return Physics2DSolverConfig_Ffi.set_positionCorrection(this, value);
	public var positionIterations(get, set):Int;

	inline function get_positionIterations():Int return Physics2DSolverConfig_Ffi.get_positionIterations(this);

	inline function set_positionIterations(value:Int):Int return Physics2DSolverConfig_Ffi.set_positionIterations(this, value);
	public var restitutionThreshold(get, set):Float;

	inline function get_restitutionThreshold():Float return Physics2DSolverConfig_Ffi.get_restitutionThreshold(this);

	inline function set_restitutionThreshold(value:Float):Float return Physics2DSolverConfig_Ffi.set_restitutionThreshold(this, value);
	public var sleepAngularThreshold(get, set):Float;

	inline function get_sleepAngularThreshold():Float return Physics2DSolverConfig_Ffi.get_sleepAngularThreshold(this);

	inline function set_sleepAngularThreshold(value:Float):Float return Physics2DSolverConfig_Ffi.set_sleepAngularThreshold(this, value);
	public var sleepLinearThreshold(get, set):Float;

	inline function get_sleepLinearThreshold():Float return Physics2DSolverConfig_Ffi.get_sleepLinearThreshold(this);

	inline function set_sleepLinearThreshold(value:Float):Float return Physics2DSolverConfig_Ffi.set_sleepLinearThreshold(this, value);
	public var timeToSleep(get, set):Float;

	inline function get_timeToSleep():Float return Physics2DSolverConfig_Ffi.get_timeToSleep(this);

	inline function set_timeToSleep(value:Float):Float return Physics2DSolverConfig_Ffi.set_timeToSleep(this, value);
	public var velocityIterations(get, set):Int;

	inline function get_velocityIterations():Int return Physics2DSolverConfig_Ffi.get_velocityIterations(this);

	inline function set_velocityIterations(value:Int):Int return Physics2DSolverConfig_Ffi.set_velocityIterations(this, value);
	public var warmStarting(get, set):Bool;

	inline function get_warmStarting():Bool return Physics2DSolverConfig_Ffi.get_warmStarting(this);

	inline function set_warmStarting(value:Bool):Bool return Physics2DSolverConfig_Ffi.set_warmStarting(this, value);
}
