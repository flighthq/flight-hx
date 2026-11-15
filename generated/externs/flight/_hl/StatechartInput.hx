package flight._hl;

abstract StatechartInput(hl.Bytes) {
	public var initialValue(get, set):Float;

	inline function get_initialValue():Float return this.getF64(0);

	inline function set_initialValue(value:Float):Float { this.setF64(0, value); return value; }
}
