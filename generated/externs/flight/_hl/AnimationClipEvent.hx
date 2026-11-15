package flight._hl;

abstract AnimationClipEvent(hl.Bytes) {
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(32);

	inline function set_time(value:Single):Single { this.setF32(32, value); return value; }
}
