package flight._hl;

abstract HitTestResult(hl.Bytes) {
	public var localX(get, set):Float;

	inline function get_localX():Float return this.getF64(16);

	inline function set_localX(value:Float):Float { this.setF64(16, value); return value; }
	public var localY(get, set):Float;

	inline function get_localY():Float return this.getF64(24);

	inline function set_localY(value:Float):Float { this.setF64(24, value); return value; }
	public var subIndex(get, set):Int;

	inline function get_subIndex():Int return this.getI32(32);

	inline function set_subIndex(value:Int):Int { this.setI32(32, value); return value; }
}
