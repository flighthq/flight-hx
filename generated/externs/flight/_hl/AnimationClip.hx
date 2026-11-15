package flight._hl;

abstract AnimationClip(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(24);

	inline function set_duration(value:Single):Single { this.setF32(24, value); return value; }
}
