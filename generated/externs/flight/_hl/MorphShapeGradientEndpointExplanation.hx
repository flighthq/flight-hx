package flight._hl;

abstract MorphShapeGradientEndpointExplanation(hl.Bytes) {
	public var endStopCount(get, set):Int;

	inline function get_endStopCount():Int return this.getI32(0);

	inline function set_endStopCount(value:Int):Int { this.setI32(0, value); return value; }
	public var startStopCount(get, set):Int;

	inline function get_startStopCount():Int return this.getI32(16);

	inline function set_startStopCount(value:Int):Int { this.setI32(16, value); return value; }
	public var supported(get, set):Bool;

	inline function get_supported():Bool return this.getUI8(24) != 0;

	inline function set_supported(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
}
