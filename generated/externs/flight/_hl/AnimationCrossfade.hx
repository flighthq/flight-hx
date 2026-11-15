package flight._hl;

abstract AnimationCrossfade(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(40);

	inline function set_duration(value:Single):Single { this.setF32(40, value); return value; }
	public var elapsed(get, set):Single;

	inline function get_elapsed():Single return this.getF32(44);

	inline function set_elapsed(value:Single):Single { this.setF32(44, value); return value; }
	public var weight(get, set):Single;

	inline function get_weight():Single return this.getF32(112);

	inline function set_weight(value:Single):Single { this.setF32(112, value); return value; }
}
