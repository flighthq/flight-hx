package flight._hl;

abstract Skeleton2DSlotAnimationTarget(hl.Bytes) {
	public var slotIndex(get, set):Int;

	inline function get_slotIndex():Int return this.getI32(72);

	inline function set_slotIndex(value:Int):Int { this.setI32(72, value); return value; }
}
