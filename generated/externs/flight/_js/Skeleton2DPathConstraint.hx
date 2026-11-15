package flight._js;

@:jsRequire("flight")
private extern class Skeleton2DPathConstraint_Ffi {
	@:native("flight_get_skeleton2_dpath_constraint_mix") static function get_mix(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix") static function set_mix(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_mix_rotate") static function get_mixRotate(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix_rotate") static function set_mixRotate(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_mix_x") static function get_mixX(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix_x") static function set_mixX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_mix_y") static function get_mixY(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix_y") static function set_mixY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_position") static function get_position(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dpath_constraint_position") static function set_position(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_spacing") static function get_spacing(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dpath_constraint_spacing") static function set_spacing(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_target_slot_index") static function get_targetSlotIndex(ptr:Dynamic):Int;
	@:native("flight_set_skeleton2_dpath_constraint_target_slot_index") static function set_targetSlotIndex(ptr:Dynamic, value:Int):Int;
}

abstract Skeleton2DPathConstraint(Dynamic) {
	public var mix(get, set):Float;

	inline function get_mix():Float return Skeleton2DPathConstraint_Ffi.get_mix(this);

	inline function set_mix(value:Float):Float return Skeleton2DPathConstraint_Ffi.set_mix(this, value);
	public var mixRotate(get, set):Float;

	inline function get_mixRotate():Float return Skeleton2DPathConstraint_Ffi.get_mixRotate(this);

	inline function set_mixRotate(value:Float):Float return Skeleton2DPathConstraint_Ffi.set_mixRotate(this, value);
	public var mixX(get, set):Float;

	inline function get_mixX():Float return Skeleton2DPathConstraint_Ffi.get_mixX(this);

	inline function set_mixX(value:Float):Float return Skeleton2DPathConstraint_Ffi.set_mixX(this, value);
	public var mixY(get, set):Float;

	inline function get_mixY():Float return Skeleton2DPathConstraint_Ffi.get_mixY(this);

	inline function set_mixY(value:Float):Float return Skeleton2DPathConstraint_Ffi.set_mixY(this, value);
	public var position(get, set):Float;

	inline function get_position():Float return Skeleton2DPathConstraint_Ffi.get_position(this);

	inline function set_position(value:Float):Float return Skeleton2DPathConstraint_Ffi.set_position(this, value);
	public var spacing(get, set):Float;

	inline function get_spacing():Float return Skeleton2DPathConstraint_Ffi.get_spacing(this);

	inline function set_spacing(value:Float):Float return Skeleton2DPathConstraint_Ffi.set_spacing(this, value);
	public var targetSlotIndex(get, set):Int;

	inline function get_targetSlotIndex():Int return Skeleton2DPathConstraint_Ffi.get_targetSlotIndex(this);

	inline function set_targetSlotIndex(value:Int):Int return Skeleton2DPathConstraint_Ffi.set_targetSlotIndex(this, value);
}
