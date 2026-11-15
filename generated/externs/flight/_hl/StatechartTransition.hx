package flight._hl;

abstract StatechartTransition(hl.Bytes) {
	public var durationMs(get, set):Float;

	inline function get_durationMs():Float return this.getF64(24);

	inline function set_durationMs(value:Float):Float { this.setF64(24, value); return value; }
	public var exitTimeRatio(get, set):Float;

	inline function get_exitTimeRatio():Float return this.getF64(32);

	inline function set_exitTimeRatio(value:Float):Float { this.setF64(32, value); return value; }
	public var targetStateIndex(get, set):Int;

	inline function get_targetStateIndex():Int return this.getI32(40);

	inline function set_targetStateIndex(value:Int):Int { this.setI32(40, value); return value; }
}
