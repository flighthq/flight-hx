package flight._hl;

abstract Skeleton2DDeformLengthExplanation(hl.Bytes) {
	public var accepted(get, set):Bool;

	inline function get_accepted():Bool return this.getUI8(0) != 0;

	inline function set_accepted(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var addressed(get, set):Int;

	inline function get_addressed():Int return this.getI32(8);

	inline function set_addressed(value:Int):Int { this.setI32(8, value); return value; }
	public var offsets(get, set):Int;

	inline function get_offsets():Int return this.getI32(40);

	inline function set_offsets(value:Int):Int { this.setI32(40, value); return value; }
}
