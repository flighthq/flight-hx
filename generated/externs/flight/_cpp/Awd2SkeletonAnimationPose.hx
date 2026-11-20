package flight._cpp;

private extern class Awd2SkeletonAnimationPose_Ffi {
	@:native("flight_get_awd2_skeleton_animation_pose_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_skeleton_animation_pose_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_skeleton_animation_pose_pose_block_id") static function get_poseBlockId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_skeleton_animation_pose_pose_block_id") static function set_poseBlockId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2SkeletonAnimationPose(cpp.Star<cpp.Void>) {
	public var duration(get, set):Float;

	inline function get_duration():Float return Awd2SkeletonAnimationPose_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float { Awd2SkeletonAnimationPose_Ffi.set_duration(this, value); return value; }
	public var poseBlockId(get, set):Int;

	inline function get_poseBlockId():Int return Awd2SkeletonAnimationPose_Ffi.get_poseBlockId(this);

	inline function set_poseBlockId(value:Int):Int { Awd2SkeletonAnimationPose_Ffi.set_poseBlockId(this, value); return value; }
}
