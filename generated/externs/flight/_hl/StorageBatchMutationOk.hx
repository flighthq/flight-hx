package flight._hl;

abstract StorageBatchMutationOk(hl.Bytes) {
	public var completed(get, set):Int;

	inline function get_completed():Int return this.getI32(0);

	inline function set_completed(value:Int):Int { this.setI32(0, value); return value; }
}
