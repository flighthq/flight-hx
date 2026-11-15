package flight._hl;

abstract EmissiveModifierOptions(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(0);

	inline function set_color(value:Int):Int { this.setI32(0, value); return value; }
}
