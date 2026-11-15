package flight._hl;

abstract Physics2DJointResolutionExplanation(hl.Bytes) {
	public var readyCount(get, set):Int;

	inline function get_readyCount():Int return this.getI32(24);

	inline function set_readyCount(value:Int):Int { this.setI32(24, value); return value; }
}
