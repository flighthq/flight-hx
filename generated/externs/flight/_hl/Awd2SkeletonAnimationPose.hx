package flight._hl;

abstract Awd2SkeletonAnimationPose(hl.Bytes) {
	public var duration(get, set):Float;

	inline function get_duration():Float return this.getF64(0);

	inline function set_duration(value:Float):Float { this.setF64(0, value); return value; }
	public var poseBlockId(get, set):Int;

	inline function get_poseBlockId():Int return this.getI32(8);

	inline function set_poseBlockId(value:Int):Int { this.setI32(8, value); return value; }
}
