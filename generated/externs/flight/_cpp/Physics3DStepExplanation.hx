package flight._cpp;

private extern class Physics3DStepExplanation_Ffi {
	@:native("flight_get_physics3_dstep_explanation_body_state_valid") static function get_bodyStateValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_body_state_valid") static function set_bodyStateValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_collider_state_valid") static function get_colliderStateValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_collider_state_valid") static function set_colliderStateValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_contact_state_valid") static function get_contactStateValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_contact_state_valid") static function set_contactStateValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_gravity_valid") static function get_gravityValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_gravity_valid") static function set_gravityValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_joint_state_valid") static function get_jointStateValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_joint_state_valid") static function set_jointStateValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_solver_config_valid") static function get_solverConfigValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_solver_config_valid") static function set_solverConfigValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_substeps_valid") static function get_substepsValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_substeps_valid") static function set_substepsValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_timestep_valid") static function get_timestepValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_timestep_valid") static function set_timestepValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_velocity_iterations_valid") static function get_velocityIterationsValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_velocity_iterations_valid") static function set_velocityIterationsValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dstep_explanation_position_iterations_valid") static function get_positionIterationsValid(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dstep_explanation_position_iterations_valid") static function set_positionIterationsValid(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics3DStepExplanation(cpp.Star<cpp.Void>) {
	public var bodyStateValid(get, set):Bool;

	inline function get_bodyStateValid():Bool return Physics3DStepExplanation_Ffi.get_bodyStateValid(this);

	inline function set_bodyStateValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_bodyStateValid(this, value); return value; }
	public var colliderStateValid(get, set):Bool;

	inline function get_colliderStateValid():Bool return Physics3DStepExplanation_Ffi.get_colliderStateValid(this);

	inline function set_colliderStateValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_colliderStateValid(this, value); return value; }
	public var contactStateValid(get, set):Bool;

	inline function get_contactStateValid():Bool return Physics3DStepExplanation_Ffi.get_contactStateValid(this);

	inline function set_contactStateValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_contactStateValid(this, value); return value; }
	public var gravityValid(get, set):Bool;

	inline function get_gravityValid():Bool return Physics3DStepExplanation_Ffi.get_gravityValid(this);

	inline function set_gravityValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_gravityValid(this, value); return value; }
	public var jointStateValid(get, set):Bool;

	inline function get_jointStateValid():Bool return Physics3DStepExplanation_Ffi.get_jointStateValid(this);

	inline function set_jointStateValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_jointStateValid(this, value); return value; }
	public var solverConfigValid(get, set):Bool;

	inline function get_solverConfigValid():Bool return Physics3DStepExplanation_Ffi.get_solverConfigValid(this);

	inline function set_solverConfigValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_solverConfigValid(this, value); return value; }
	public var substepsValid(get, set):Bool;

	inline function get_substepsValid():Bool return Physics3DStepExplanation_Ffi.get_substepsValid(this);

	inline function set_substepsValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_substepsValid(this, value); return value; }
	public var timestepValid(get, set):Bool;

	inline function get_timestepValid():Bool return Physics3DStepExplanation_Ffi.get_timestepValid(this);

	inline function set_timestepValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_timestepValid(this, value); return value; }
	public var velocityIterationsValid(get, set):Bool;

	inline function get_velocityIterationsValid():Bool return Physics3DStepExplanation_Ffi.get_velocityIterationsValid(this);

	inline function set_velocityIterationsValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_velocityIterationsValid(this, value); return value; }
	public var positionIterationsValid(get, set):Bool;

	inline function get_positionIterationsValid():Bool return Physics3DStepExplanation_Ffi.get_positionIterationsValid(this);

	inline function set_positionIterationsValid(value:Bool):Bool { Physics3DStepExplanation_Ffi.set_positionIterationsValid(this, value); return value; }
}
