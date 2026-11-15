package flight._hl;

abstract Skeleton2DAnimationTarget(hl.Bytes) {
	public var boneIndex(get, set):Int;

	inline function get_boneIndex():Int return this.getI32(16);

	inline function set_boneIndex(value:Int):Int { this.setI32(16, value); return value; }
}
