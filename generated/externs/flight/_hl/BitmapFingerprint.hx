package flight._hl;

abstract BitmapFingerprint(hl.Bytes) {
	public var gridSize(get, set):Int;

	inline function get_gridSize():Int return this.getI32(16);

	inline function set_gridSize(value:Int):Int { this.setI32(16, value); return value; }
}
