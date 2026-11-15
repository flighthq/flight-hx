package flight._hl;

abstract Skeleton2DDeformAnimationTarget(hl.Bytes) {
	public var slotIndex(get, set):Int;

	inline function get_slotIndex():Int return this.getI32(40);

	inline function set_slotIndex(value:Int):Int { this.setI32(40, value); return value; }
}
