package flight._hl;

abstract LayoutResolutionExplanation(hl.Bytes) {
	public var actualLength(get, set):Int;

	inline function get_actualLength():Int return this.getI32(0);

	inline function set_actualLength(value:Int):Int { this.setI32(0, value); return value; }
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return this.getI32(8);

	inline function set_nodeIndex(value:Int):Int { this.setI32(8, value); return value; }
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return this.getI32(12);

	inline function set_parentIndex(value:Int):Int { this.setI32(12, value); return value; }
	public var requiredLength(get, set):Int;

	inline function get_requiredLength():Int return this.getI32(16);

	inline function set_requiredLength(value:Int):Int { this.setI32(16, value); return value; }
}
