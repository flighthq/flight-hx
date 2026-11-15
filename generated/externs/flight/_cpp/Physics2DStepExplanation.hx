package flight._cpp;

private extern class Physics2DStepExplanation_Ffi {
	@:native("flight_get_physics2_dstep_explanation_body_state_valid") static function get_bodyStateValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_body_state_valid") static function set_bodyStateValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_contact_state_valid") static function get_contactStateValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_contact_state_valid") static function set_contactStateValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_gravity_valid") static function get_gravityValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_gravity_valid") static function set_gravityValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_joint_state_valid") static function get_jointStateValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_joint_state_valid") static function set_jointStateValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_position_iterations_valid") static function get_positionIterationsValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_position_iterations_valid") static function set_positionIterationsValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_previous_timestep_valid") static function get_previousTimestepValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_previous_timestep_valid") static function set_previousTimestepValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_solver_config_valid") static function get_solverConfigValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_solver_config_valid") static function set_solverConfigValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_timestep_valid") static function get_timestepValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_timestep_valid") static function set_timestepValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dstep_explanation_velocity_iterations_valid") static function get_velocityIterationsValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dstep_explanation_velocity_iterations_valid") static function set_velocityIterationsValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics2DStepExplanation(cpp.Star<cpp.Void>) {
	public var bodyStateValid(get, set):Bool;

	inline function get_bodyStateValid():Bool return Physics2DStepExplanation_Ffi.get_bodyStateValid(this);

	inline function set_bodyStateValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_bodyStateValid(this, value);
	public var contactStateValid(get, set):Bool;

	inline function get_contactStateValid():Bool return Physics2DStepExplanation_Ffi.get_contactStateValid(this);

	inline function set_contactStateValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_contactStateValid(this, value);
	public var gravityValid(get, set):Bool;

	inline function get_gravityValid():Bool return Physics2DStepExplanation_Ffi.get_gravityValid(this);

	inline function set_gravityValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_gravityValid(this, value);
	public var jointStateValid(get, set):Bool;

	inline function get_jointStateValid():Bool return Physics2DStepExplanation_Ffi.get_jointStateValid(this);

	inline function set_jointStateValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_jointStateValid(this, value);
	public var positionIterationsValid(get, set):Bool;

	inline function get_positionIterationsValid():Bool return Physics2DStepExplanation_Ffi.get_positionIterationsValid(this);

	inline function set_positionIterationsValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_positionIterationsValid(this, value);
	public var previousTimestepValid(get, set):Bool;

	inline function get_previousTimestepValid():Bool return Physics2DStepExplanation_Ffi.get_previousTimestepValid(this);

	inline function set_previousTimestepValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_previousTimestepValid(this, value);
	public var solverConfigValid(get, set):Bool;

	inline function get_solverConfigValid():Bool return Physics2DStepExplanation_Ffi.get_solverConfigValid(this);

	inline function set_solverConfigValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_solverConfigValid(this, value);
	public var timestepValid(get, set):Bool;

	inline function get_timestepValid():Bool return Physics2DStepExplanation_Ffi.get_timestepValid(this);

	inline function set_timestepValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_timestepValid(this, value);
	public var velocityIterationsValid(get, set):Bool;

	inline function get_velocityIterationsValid():Bool return Physics2DStepExplanation_Ffi.get_velocityIterationsValid(this);

	inline function set_velocityIterationsValid(value:Bool):Bool return Physics2DStepExplanation_Ffi.set_velocityIterationsValid(this, value);
}
