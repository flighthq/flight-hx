package flight._hl;

abstract Skeleton2DPathConstraint(hl.Bytes) {
	public var mix(get, set):Single;

	inline function get_mix():Single return this.getF32(64);

	inline function set_mix(value:Single):Single { this.setF32(64, value); return value; }
	public var mixRotate(get, set):Single;

	inline function get_mixRotate():Single return this.getF32(68);

	inline function set_mixRotate(value:Single):Single { this.setF32(68, value); return value; }
	public var mixX(get, set):Single;

	inline function get_mixX():Single return this.getF32(72);

	inline function set_mixX(value:Single):Single { this.setF32(72, value); return value; }
	public var mixY(get, set):Single;

	inline function get_mixY():Single return this.getF32(76);

	inline function set_mixY(value:Single):Single { this.setF32(76, value); return value; }
	public var position(get, set):Single;

	inline function get_position():Single return this.getF32(80);

	inline function set_position(value:Single):Single { this.setF32(80, value); return value; }
	public var spacing(get, set):Single;

	inline function get_spacing():Single return this.getF32(136);

	inline function set_spacing(value:Single):Single { this.setF32(136, value); return value; }
	public var targetSlotIndex(get, set):Int;

	inline function get_targetSlotIndex():Int return this.getI32(168);

	inline function set_targetSlotIndex(value:Int):Int { this.setI32(168, value); return value; }
}
