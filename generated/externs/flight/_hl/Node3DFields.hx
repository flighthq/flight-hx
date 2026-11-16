package flight._hl;

abstract Node3DFields(hl.Bytes) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(744);

	inline function set_alpha(value:Single):Single { this.setF32(744, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return this.getUI8(748) != 0;

	inline function set_visible(value:Bool):Bool { this.setUI8(748, value ? 1 : 0); return value; }
}
