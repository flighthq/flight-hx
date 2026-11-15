package flight._hl;

abstract RiveCoreObjectHandlerEntry(hl.Bytes) {
	public var typeKey(get, set):Int;

	inline function get_typeKey():Int return this.getI32(8);

	inline function set_typeKey(value:Int):Int { this.setI32(8, value); return value; }
}
