package flight._hl;

abstract TextFieldScrollEvent(hl.Bytes) {
	public var previousScrollH(get, set):Single;

	inline function get_previousScrollH():Single return this.getF32(0);

	inline function set_previousScrollH(value:Single):Single { this.setF32(0, value); return value; }
	public var previousScrollV(get, set):Single;

	inline function get_previousScrollV():Single return this.getF32(4);

	inline function set_previousScrollV(value:Single):Single { this.setF32(4, value); return value; }
	public var scrollH(get, set):Single;

	inline function get_scrollH():Single return this.getF32(8);

	inline function set_scrollH(value:Single):Single { this.setF32(8, value); return value; }
	public var scrollV(get, set):Single;

	inline function get_scrollV():Single return this.getF32(12);

	inline function set_scrollV(value:Single):Single { this.setF32(12, value); return value; }
}
