package flight._hl;

abstract StatechartRegion(hl.Bytes) {
	public var initialStateIndex(get, set):Int;

	inline function get_initialStateIndex():Int return this.getI32(0);

	inline function set_initialStateIndex(value:Int):Int { this.setI32(0, value); return value; }
}
