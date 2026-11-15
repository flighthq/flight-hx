package flight._hl;

abstract SpineTintKeyframe(hl.Bytes) {
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(24);

	inline function set_time(value:Single):Single { this.setF32(24, value); return value; }
}
