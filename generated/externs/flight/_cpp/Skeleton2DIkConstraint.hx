package flight._cpp;

private extern class Skeleton2DIkConstraint_Ffi {
	@:native("flight_get_skeleton2_dik_constraint_bend_positive") static function get_bendPositive(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_skeleton2_dik_constraint_bend_positive") static function set_bendPositive(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_skeleton2_dik_constraint_compress") static function get_compress(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_skeleton2_dik_constraint_compress") static function set_compress(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_skeleton2_dik_constraint_mix") static function get_mix(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dik_constraint_mix") static function set_mix(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dik_constraint_stretch") static function get_stretch(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_skeleton2_dik_constraint_stretch") static function set_stretch(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_skeleton2_dik_constraint_target_bone_index") static function get_targetBoneIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_dik_constraint_target_bone_index") static function set_targetBoneIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DIkConstraint(cpp.Star<cpp.Void>) {
	public var bendPositive(get, set):Bool;

	inline function get_bendPositive():Bool return Skeleton2DIkConstraint_Ffi.get_bendPositive(this);

	inline function set_bendPositive(value:Bool):Bool return Skeleton2DIkConstraint_Ffi.set_bendPositive(this, value);
	public var compress(get, set):Bool;

	inline function get_compress():Bool return Skeleton2DIkConstraint_Ffi.get_compress(this);

	inline function set_compress(value:Bool):Bool return Skeleton2DIkConstraint_Ffi.set_compress(this, value);
	public var mix(get, set):Single;

	inline function get_mix():Single return Skeleton2DIkConstraint_Ffi.get_mix(this);

	inline function set_mix(value:Single):Single return Skeleton2DIkConstraint_Ffi.set_mix(this, value);
	public var stretch(get, set):Bool;

	inline function get_stretch():Bool return Skeleton2DIkConstraint_Ffi.get_stretch(this);

	inline function set_stretch(value:Bool):Bool return Skeleton2DIkConstraint_Ffi.set_stretch(this, value);
	public var targetBoneIndex(get, set):Int;

	inline function get_targetBoneIndex():Int return Skeleton2DIkConstraint_Ffi.get_targetBoneIndex(this);

	inline function set_targetBoneIndex(value:Int):Int return Skeleton2DIkConstraint_Ffi.set_targetBoneIndex(this, value);
}
