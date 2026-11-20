package flight._hl;

abstract SvgGradientStop(hl.Bytes) {
	public var offset(get, set):Float;

	inline function get_offset():Float return this.getF64(16);

	inline function set_offset(value:Float):Float { this.setF64(16, value); return value; }
}
