package flight._hl;

abstract TextFieldLinkEvent(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(24);

	inline function set_x(value:Single):Single { this.setF32(24, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(28);

	inline function set_y(value:Single):Single { this.setF32(28, value); return value; }
}
