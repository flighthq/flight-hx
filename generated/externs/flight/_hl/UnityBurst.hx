package flight._hl;

abstract UnityBurst(hl.Bytes) {
	public var count(get, set):Single;

	inline function get_count():Single return this.getF32(0);

	inline function set_count(value:Single):Single { this.setF32(0, value); return value; }
	public var cycleCount(get, set):Single;

	inline function get_cycleCount():Single return this.getF32(4);

	inline function set_cycleCount(value:Single):Single { this.setF32(4, value); return value; }
	public var repeatInterval(get, set):Single;

	inline function get_repeatInterval():Single return this.getF32(8);

	inline function set_repeatInterval(value:Single):Single { this.setF32(8, value); return value; }
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(12);

	inline function set_time(value:Single):Single { this.setF32(12, value); return value; }
}
