package flight._hl;

abstract LayoutNode(hl.Bytes) {
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return this.getI32(176);

	inline function set_parentIndex(value:Int):Int { this.setI32(176, value); return value; }
}
