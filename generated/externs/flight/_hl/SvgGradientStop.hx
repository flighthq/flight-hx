package flight._hl;

abstract SvgGradientStop(hl.Bytes) {
	public var offset(get, set):Single;

	inline function get_offset():Single return this.getF32(8);

	inline function set_offset(value:Single):Single { this.setF32(8, value); return value; }
}
