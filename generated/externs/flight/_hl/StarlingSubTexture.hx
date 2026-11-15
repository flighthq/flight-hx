package flight._hl;

abstract StarlingSubTexture(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(32);

	inline function set_height(value:Single):Single { this.setF32(32, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(84);

	inline function set_width(value:Single):Single { this.setF32(84, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(88);

	inline function set_x(value:Single):Single { this.setF32(88, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(92);

	inline function set_y(value:Single):Single { this.setF32(92, value); return value; }
}
