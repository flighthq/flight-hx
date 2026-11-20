package flight._hl;

abstract TextFieldScrollEvent(hl.Bytes) {
	public var previousScrollH(get, set):Float;

	inline function get_previousScrollH():Float return this.getF64(0);

	inline function set_previousScrollH(value:Float):Float { this.setF64(0, value); return value; }
	public var previousScrollV(get, set):Float;

	inline function get_previousScrollV():Float return this.getF64(8);

	inline function set_previousScrollV(value:Float):Float { this.setF64(8, value); return value; }
	public var scrollH(get, set):Float;

	inline function get_scrollH():Float return this.getF64(16);

	inline function set_scrollH(value:Float):Float { this.setF64(16, value); return value; }
	public var scrollV(get, set):Float;

	inline function get_scrollV():Float return this.getF64(24);

	inline function set_scrollV(value:Float):Float { this.setF64(24, value); return value; }
}
