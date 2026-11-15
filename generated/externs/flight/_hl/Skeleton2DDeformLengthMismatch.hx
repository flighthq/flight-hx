package flight._hl;

abstract Skeleton2DDeformLengthMismatch(hl.Bytes) {
	public var addressed(get, set):Int;

	inline function get_addressed():Int return this.getI32(0);

	inline function set_addressed(value:Int):Int { this.setI32(0, value); return value; }
	public var offsets(get, set):Int;

	inline function get_offsets():Int return this.getI32(8);

	inline function set_offsets(value:Int):Int { this.setI32(8, value); return value; }
}
