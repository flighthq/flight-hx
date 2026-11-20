package flight._hl;

abstract SafeAreaInsets(hl.Bytes) {
	public var top(get, set):Single;

	inline function get_top():Single return this.getF32(0);

	inline function set_top(value:Single):Single { this.setF32(0, value); return value; }
	public var right(get, set):Single;

	inline function get_right():Single return this.getF32(4);

	inline function set_right(value:Single):Single { this.setF32(4, value); return value; }
	public var bottom(get, set):Single;

	inline function get_bottom():Single return this.getF32(8);

	inline function set_bottom(value:Single):Single { this.setF32(8, value); return value; }
	public var left(get, set):Single;

	inline function get_left():Single return this.getF32(12);

	inline function set_left(value:Single):Single { this.setF32(12, value); return value; }
}
