package flight._hl;

abstract Physics3DDebugGeometry(hl.Bytes) {
	public var lineCount(get, set):Int;

	inline function get_lineCount():Int return this.getI32(64);

	inline function set_lineCount(value:Int):Int { this.setI32(64, value); return value; }
	public var sphereCount(get, set):Int;

	inline function get_sphereCount():Int return this.getI32(72);

	inline function set_sphereCount(value:Int):Int { this.setI32(72, value); return value; }
}
