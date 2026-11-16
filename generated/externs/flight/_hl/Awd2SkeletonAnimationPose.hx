package flight._hl;

abstract Awd2SkeletonAnimationPose(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(0);

	inline function set_duration(value:Single):Single { this.setF32(0, value); return value; }
	public var poseBlockId(get, set):Int;

	inline function get_poseBlockId():Int return this.getI32(4);

	inline function set_poseBlockId(value:Int):Int { this.setI32(4, value); return value; }
}
