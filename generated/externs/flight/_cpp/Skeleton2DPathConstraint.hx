package flight._cpp;

private extern class Skeleton2DPathConstraint_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_skeleton2_dpath_constraint_mix") static function get_mix(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix") static function set_mix(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_mix_rotate") static function get_mixRotate(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix_rotate") static function set_mixRotate(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_mix_x") static function get_mixX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix_x") static function set_mixX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_mix_y") static function get_mixY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_skeleton2_dpath_constraint_mix_y") static function set_mixY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_skeleton2_dpath_constraint_position") static function get_position(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_skeleton2_dpath_constraint_position") static function set_position(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_skeleton2_dpath_constraint_position_mode") static function get_positionMode(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_skeleton2_dpath_constraint_position_mode") static function set_positionMode(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_skeleton2_dpath_constraint_rotate_mode") static function get_rotateMode(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_skeleton2_dpath_constraint_rotate_mode") static function set_rotateMode(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_skeleton2_dpath_constraint_spacing") static function get_spacing(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_skeleton2_dpath_constraint_spacing") static function set_spacing(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_skeleton2_dpath_constraint_spacing_mode") static function get_spacingMode(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_skeleton2_dpath_constraint_spacing_mode") static function set_spacingMode(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_skeleton2_dpath_constraint_target_slot_index") static function get_targetSlotIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_dpath_constraint_target_slot_index") static function set_targetSlotIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DPathConstraint(cpp.Star<cpp.Void>) {
	public var mix(get, set):Float;

	inline function get_mix():Float return Skeleton2DPathConstraint_Ffi.get_mix(this);

	inline function set_mix(value:Float):Float { Skeleton2DPathConstraint_Ffi.set_mix(this, value); return value; }
	public var mixRotate(get, set):Float;

	inline function get_mixRotate():Float return Skeleton2DPathConstraint_Ffi.get_mixRotate(this);

	inline function set_mixRotate(value:Float):Float { Skeleton2DPathConstraint_Ffi.set_mixRotate(this, value); return value; }
	public var mixX(get, set):Float;

	inline function get_mixX():Float return Skeleton2DPathConstraint_Ffi.get_mixX(this);

	inline function set_mixX(value:Float):Float { Skeleton2DPathConstraint_Ffi.set_mixX(this, value); return value; }
	public var mixY(get, set):Float;

	inline function get_mixY():Float return Skeleton2DPathConstraint_Ffi.get_mixY(this);

	inline function set_mixY(value:Float):Float { Skeleton2DPathConstraint_Ffi.set_mixY(this, value); return value; }
	public var position(get, set):Float;

	inline function get_position():Float return Skeleton2DPathConstraint_Ffi.get_position(this);

	inline function set_position(value:Float):Float { Skeleton2DPathConstraint_Ffi.set_position(this, value); return value; }
	public var positionMode(get, set):String;
	inline function get_positionMode():String { var raw = Skeleton2DPathConstraint_Ffi.get_positionMode(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Skeleton2DPathConstraint_Ffi.freeString(raw); return value; }
	inline function set_positionMode(value:String):String { var raw:cpp.ConstCharStar = cast value; Skeleton2DPathConstraint_Ffi.set_positionMode(this, raw); return value; }
	public var rotateMode(get, set):String;
	inline function get_rotateMode():String { var raw = Skeleton2DPathConstraint_Ffi.get_rotateMode(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Skeleton2DPathConstraint_Ffi.freeString(raw); return value; }
	inline function set_rotateMode(value:String):String { var raw:cpp.ConstCharStar = cast value; Skeleton2DPathConstraint_Ffi.set_rotateMode(this, raw); return value; }
	public var spacing(get, set):Float;

	inline function get_spacing():Float return Skeleton2DPathConstraint_Ffi.get_spacing(this);

	inline function set_spacing(value:Float):Float { Skeleton2DPathConstraint_Ffi.set_spacing(this, value); return value; }
	public var spacingMode(get, set):String;
	inline function get_spacingMode():String { var raw = Skeleton2DPathConstraint_Ffi.get_spacingMode(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Skeleton2DPathConstraint_Ffi.freeString(raw); return value; }
	inline function set_spacingMode(value:String):String { var raw:cpp.ConstCharStar = cast value; Skeleton2DPathConstraint_Ffi.set_spacingMode(this, raw); return value; }
	public var targetSlotIndex(get, set):Int;

	inline function get_targetSlotIndex():Int return Skeleton2DPathConstraint_Ffi.get_targetSlotIndex(this);

	inline function set_targetSlotIndex(value:Int):Int { Skeleton2DPathConstraint_Ffi.set_targetSlotIndex(this, value); return value; }
}
