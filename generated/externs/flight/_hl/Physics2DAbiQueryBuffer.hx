package flight._hl;

abstract Physics2DAbiQueryBuffer(hl.Bytes) {
	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(48);

	inline function set_count(value:Int):Int { this.setI32(48, value); return value; }
	public var requiredCount(get, set):Int;

	inline function get_requiredCount():Int return this.getI32(56);

	inline function set_requiredCount(value:Int):Int { this.setI32(56, value); return value; }
}
