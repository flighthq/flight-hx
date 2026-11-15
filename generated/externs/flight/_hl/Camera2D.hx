package flight._hl;

abstract Camera2D(hl.Bytes) {
	public var rotation(get, set):Single;

	inline function get_rotation():Single return this.getF32(16);

	inline function set_rotation(value:Single):Single { this.setF32(16, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(20);

	inline function set_x(value:Single):Single { this.setF32(20, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(24);

	inline function set_y(value:Single):Single { this.setF32(24, value); return value; }
	public var zoom(get, set):Single;

	inline function get_zoom():Single return this.getF32(28);

	inline function set_zoom(value:Single):Single { this.setF32(28, value); return value; }
}
