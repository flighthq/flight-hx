package flight._hl;

abstract StlFeatures(hl.Bytes) {
	public var triangleCount(get, set):Int;

	inline function get_triangleCount():Int return this.getI32(0);

	inline function set_triangleCount(value:Int):Int { this.setI32(0, value); return value; }
}
