package flight._js;

@:jsRequire("flight")
private extern class Skeleton2DAnimationTarget_Ffi {
	@:native("flight_get_skeleton2_danimation_target_bone_index") static function get_boneIndex(ptr:Dynamic):Int;
	@:native("flight_set_skeleton2_danimation_target_bone_index") static function set_boneIndex(ptr:Dynamic, value:Int):Int;
}

abstract Skeleton2DAnimationTarget(Dynamic) {
	public var boneIndex(get, set):Int;

	inline function get_boneIndex():Int return Skeleton2DAnimationTarget_Ffi.get_boneIndex(this);

	inline function set_boneIndex(value:Int):Int return Skeleton2DAnimationTarget_Ffi.set_boneIndex(this, value);
}
