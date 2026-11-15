package flight._hl;

abstract LayoutState(hl.Bytes) {
	public var lastFailureActualLength(get, set):Int;

	inline function get_lastFailureActualLength():Int return this.getI32(24);

	inline function set_lastFailureActualLength(value:Int):Int { this.setI32(24, value); return value; }
	public var lastFailureNodeIndex(get, set):Int;

	inline function get_lastFailureNodeIndex():Int return this.getI32(32);

	inline function set_lastFailureNodeIndex(value:Int):Int { this.setI32(32, value); return value; }
	public var lastFailureParentIndex(get, set):Int;

	inline function get_lastFailureParentIndex():Int return this.getI32(36);

	inline function set_lastFailureParentIndex(value:Int):Int { this.setI32(36, value); return value; }
	public var lastFailureRequiredLength(get, set):Int;

	inline function get_lastFailureRequiredLength():Int return this.getI32(40);

	inline function set_lastFailureRequiredLength(value:Int):Int { this.setI32(40, value); return value; }
}
