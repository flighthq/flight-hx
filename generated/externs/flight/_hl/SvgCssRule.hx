package flight._hl;

abstract SvgCssRule(hl.Bytes) {
	public var order(get, set):Int;

	inline function get_order():Int return this.getI32(48);

	inline function set_order(value:Int):Int { this.setI32(48, value); return value; }
	public var specificity(get, set):Int;

	inline function get_specificity():Int return this.getI32(80);

	inline function set_specificity(value:Int):Int { this.setI32(80, value); return value; }
}
