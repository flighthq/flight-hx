package flight._hl;

abstract HasAppearance(hl.Bytes) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(0);

	inline function set_alpha(value:Single):Single { this.setF32(0, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return this.getUI8(4) != 0;

	inline function set_visible(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
}
