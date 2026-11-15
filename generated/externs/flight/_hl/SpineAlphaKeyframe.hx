package flight._hl;

abstract SpineAlphaKeyframe(hl.Bytes) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(0);

	inline function set_alpha(value:Single):Single { this.setF32(0, value); return value; }
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(4);

	inline function set_time(value:Single):Single { this.setF32(4, value); return value; }
}
