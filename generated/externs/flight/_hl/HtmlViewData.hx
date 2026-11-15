package flight._hl;

abstract HtmlViewData(hl.Bytes) {
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(48);

	inline function set_height(value:Float):Float { this.setF64(48, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(56);

	inline function set_width(value:Float):Float { this.setF64(56, value); return value; }
}
