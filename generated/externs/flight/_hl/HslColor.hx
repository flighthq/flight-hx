package flight._hl;

abstract HslColor(hl.Bytes) {
	public var h(get, set):Single;

	inline function get_h():Single return this.getF32(0);

	inline function set_h(value:Single):Single { this.setF32(0, value); return value; }
	public var s(get, set):Single;

	inline function get_s():Single return this.getF32(4);

	inline function set_s(value:Single):Single { this.setF32(4, value); return value; }
	public var l(get, set):Single;

	inline function get_l():Single return this.getF32(8);

	inline function set_l(value:Single):Single { this.setF32(8, value); return value; }
}
