package flight._hl;

abstract QuadBatchData(hl.Bytes) {
	public var instanceCount(get, set):Int;

	inline function get_instanceCount():Int return this.getI32(48);

	inline function set_instanceCount(value:Int):Int { this.setI32(48, value); return value; }
}
