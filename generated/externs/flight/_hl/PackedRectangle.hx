package flight._hl;

abstract PackedRectangle(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(24);

	inline function set_x(value:Single):Single { this.setF32(24, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(28);

	inline function set_y(value:Single):Single { this.setF32(28, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(32);

	inline function set_width(value:Single):Single { this.setF32(32, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(36);

	inline function set_height(value:Single):Single { this.setF32(36, value); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(40) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
}
