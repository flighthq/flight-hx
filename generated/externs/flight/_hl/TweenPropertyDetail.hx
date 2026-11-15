package flight._hl;

abstract TweenPropertyDetail(hl.Bytes) {
	public var change(get, set):Single;

	inline function get_change():Single return this.getF32(0);

	inline function set_change(value:Single):Single { this.setF32(0, value); return value; }
	public var start(get, set):Single;

	inline function get_start():Single return this.getF32(32);

	inline function set_start(value:Single):Single { this.setF32(32, value); return value; }
}
