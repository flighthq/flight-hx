package flight._hl;

abstract StarlingPexColor(hl.Bytes) {
	public var red(get, set):Single;

	inline function get_red():Single return this.getF32(0);

	inline function set_red(value:Single):Single { this.setF32(0, value); return value; }
	public var green(get, set):Single;

	inline function get_green():Single return this.getF32(4);

	inline function set_green(value:Single):Single { this.setF32(4, value); return value; }
	public var blue(get, set):Single;

	inline function get_blue():Single return this.getF32(8);

	inline function set_blue(value:Single):Single { this.setF32(8, value); return value; }
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(12);

	inline function set_alpha(value:Single):Single { this.setF32(12, value); return value; }
}
