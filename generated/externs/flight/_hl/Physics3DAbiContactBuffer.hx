package flight._hl;

abstract Physics3DAbiContactBuffer(hl.Bytes) {
	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(16);

	inline function set_count(value:Int):Int { this.setI32(16, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return this.getI32(56);

	inline function set_pointCount(value:Int):Int { this.setI32(56, value); return value; }
	public var requiredCount(get, set):Int;

	inline function get_requiredCount():Int return this.getI32(128);

	inline function set_requiredCount(value:Int):Int { this.setI32(128, value); return value; }
	public var requiredPointCount(get, set):Int;

	inline function get_requiredPointCount():Int return this.getI32(136);

	inline function set_requiredPointCount(value:Int):Int { this.setI32(136, value); return value; }
}
