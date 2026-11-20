package flight._js;

abstract Awd2SkeletonAnimationPose(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this.duration;
	inline function set_duration(value:Float):Float return untyped this.duration = value;
	public var poseBlockId(get, set):Int;
	inline function get_poseBlockId():Int return untyped this.poseBlockId;
	inline function set_poseBlockId(value:Int):Int return untyped this.poseBlockId = value;
}
