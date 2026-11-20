package flight._cpp;

private extern class Physics3DSequentialImpulseConfig_Ffi {
	@:native("flight_get_physics3_dsequential_impulse_config_velocity_iterations") static function get_velocityIterations(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dsequential_impulse_config_velocity_iterations") static function set_velocityIterations(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dsequential_impulse_config_position_iterations") static function get_positionIterations(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dsequential_impulse_config_position_iterations") static function set_positionIterations(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dsequential_impulse_config_penetration_slop") static function get_penetrationSlop(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dsequential_impulse_config_penetration_slop") static function set_penetrationSlop(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dsequential_impulse_config_position_correction") static function get_positionCorrection(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dsequential_impulse_config_position_correction") static function set_positionCorrection(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dsequential_impulse_config_restitution_threshold") static function get_restitutionThreshold(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dsequential_impulse_config_restitution_threshold") static function set_restitutionThreshold(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dsequential_impulse_config_warm_starting") static function get_warmStarting(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dsequential_impulse_config_warm_starting") static function set_warmStarting(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics3DSequentialImpulseConfig(cpp.Star<cpp.Void>) {
	public var velocityIterations(get, set):Int;

	inline function get_velocityIterations():Int return Physics3DSequentialImpulseConfig_Ffi.get_velocityIterations(this);

	inline function set_velocityIterations(value:Int):Int { Physics3DSequentialImpulseConfig_Ffi.set_velocityIterations(this, value); return value; }
	public var positionIterations(get, set):Int;

	inline function get_positionIterations():Int return Physics3DSequentialImpulseConfig_Ffi.get_positionIterations(this);

	inline function set_positionIterations(value:Int):Int { Physics3DSequentialImpulseConfig_Ffi.set_positionIterations(this, value); return value; }
	public var penetrationSlop(get, set):Float;

	inline function get_penetrationSlop():Float return Physics3DSequentialImpulseConfig_Ffi.get_penetrationSlop(this);

	inline function set_penetrationSlop(value:Float):Float { Physics3DSequentialImpulseConfig_Ffi.set_penetrationSlop(this, value); return value; }
	public var positionCorrection(get, set):Float;

	inline function get_positionCorrection():Float return Physics3DSequentialImpulseConfig_Ffi.get_positionCorrection(this);

	inline function set_positionCorrection(value:Float):Float { Physics3DSequentialImpulseConfig_Ffi.set_positionCorrection(this, value); return value; }
	public var restitutionThreshold(get, set):Float;

	inline function get_restitutionThreshold():Float return Physics3DSequentialImpulseConfig_Ffi.get_restitutionThreshold(this);

	inline function set_restitutionThreshold(value:Float):Float { Physics3DSequentialImpulseConfig_Ffi.set_restitutionThreshold(this, value); return value; }
	public var warmStarting(get, set):Bool;

	inline function get_warmStarting():Bool return Physics3DSequentialImpulseConfig_Ffi.get_warmStarting(this);

	inline function set_warmStarting(value:Bool):Bool { Physics3DSequentialImpulseConfig_Ffi.set_warmStarting(this, value); return value; }
}
