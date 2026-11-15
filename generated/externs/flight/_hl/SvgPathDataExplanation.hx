package flight._hl;

abstract SvgPathDataExplanation(hl.Bytes) {
	public var position(get, set):Int;

	inline function get_position():Int return this.getI32(0);

	inline function set_position(value:Int):Int { this.setI32(0, value); return value; }
}
