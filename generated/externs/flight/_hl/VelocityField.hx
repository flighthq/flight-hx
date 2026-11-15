package flight._hl;

abstract VelocityField(hl.Bytes) {
	public var frameId(get, set):Int;

	inline function get_frameId():Int return this.getI32(0);

	inline function set_frameId(value:Int):Int { this.setI32(0, value); return value; }
}
