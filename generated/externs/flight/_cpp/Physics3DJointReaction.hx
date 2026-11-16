package flight._cpp;

private extern class Physics3DJointReaction_Ffi {
	@:native("flight_get_physics3_djoint_reaction_force_x") static function get_forceX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_reaction_force_x") static function set_forceX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_reaction_force_y") static function get_forceY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_reaction_force_y") static function set_forceY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_reaction_force_z") static function get_forceZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_reaction_force_z") static function set_forceZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_reaction_torque_x") static function get_torqueX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_reaction_torque_x") static function set_torqueX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_reaction_torque_y") static function get_torqueY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_reaction_torque_y") static function set_torqueY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_djoint_reaction_torque_z") static function get_torqueZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_djoint_reaction_torque_z") static function set_torqueZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DJointReaction(cpp.Star<cpp.Void>) {
	public var forceX(get, set):Single;

	inline function get_forceX():Single return Physics3DJointReaction_Ffi.get_forceX(this);

	inline function set_forceX(value:Single):Single { Physics3DJointReaction_Ffi.set_forceX(this, value); return value; }
	public var forceY(get, set):Single;

	inline function get_forceY():Single return Physics3DJointReaction_Ffi.get_forceY(this);

	inline function set_forceY(value:Single):Single { Physics3DJointReaction_Ffi.set_forceY(this, value); return value; }
	public var forceZ(get, set):Single;

	inline function get_forceZ():Single return Physics3DJointReaction_Ffi.get_forceZ(this);

	inline function set_forceZ(value:Single):Single { Physics3DJointReaction_Ffi.set_forceZ(this, value); return value; }
	public var torqueX(get, set):Single;

	inline function get_torqueX():Single return Physics3DJointReaction_Ffi.get_torqueX(this);

	inline function set_torqueX(value:Single):Single { Physics3DJointReaction_Ffi.set_torqueX(this, value); return value; }
	public var torqueY(get, set):Single;

	inline function get_torqueY():Single return Physics3DJointReaction_Ffi.get_torqueY(this);

	inline function set_torqueY(value:Single):Single { Physics3DJointReaction_Ffi.set_torqueY(this, value); return value; }
	public var torqueZ(get, set):Single;

	inline function get_torqueZ():Single return Physics3DJointReaction_Ffi.get_torqueZ(this);

	inline function set_torqueZ(value:Single):Single { Physics3DJointReaction_Ffi.set_torqueZ(this, value); return value; }
}
