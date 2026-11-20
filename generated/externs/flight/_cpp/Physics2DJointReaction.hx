package flight._cpp;

private extern class Physics2DJointReaction_Ffi {
	@:native("flight_get_physics2_djoint_reaction_force_x") static function get_forceX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_djoint_reaction_force_x") static function set_forceX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_djoint_reaction_force_y") static function get_forceY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_djoint_reaction_force_y") static function set_forceY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_djoint_reaction_torque") static function get_torque(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_djoint_reaction_torque") static function set_torque(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DJointReaction(cpp.Star<cpp.Void>) {
	public var forceX(get, set):Float;

	inline function get_forceX():Float return Physics2DJointReaction_Ffi.get_forceX(this);

	inline function set_forceX(value:Float):Float { Physics2DJointReaction_Ffi.set_forceX(this, value); return value; }
	public var forceY(get, set):Float;

	inline function get_forceY():Float return Physics2DJointReaction_Ffi.get_forceY(this);

	inline function set_forceY(value:Float):Float { Physics2DJointReaction_Ffi.set_forceY(this, value); return value; }
	public var torque(get, set):Float;

	inline function get_torque():Float return Physics2DJointReaction_Ffi.get_torque(this);

	inline function set_torque(value:Float):Float { Physics2DJointReaction_Ffi.set_torque(this, value); return value; }
}
