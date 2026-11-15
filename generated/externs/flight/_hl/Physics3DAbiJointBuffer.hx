package flight._hl;

abstract Physics3DAbiJointBuffer(hl.Bytes) {
	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(16);

	inline function set_count(value:Int):Int { this.setI32(16, value); return value; }
	public var requiredCount(get, set):Int;

	inline function get_requiredCount():Int return this.getI32(56);

	inline function set_requiredCount(value:Int):Int { this.setI32(56, value); return value; }
}
