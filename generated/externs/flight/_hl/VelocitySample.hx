package flight._hl;

abstract VelocitySample(hl.Bytes) {
	public var lastFrameId(get, set):Int;

	inline function get_lastFrameId():Int return this.getI32(88);

	inline function set_lastFrameId(value:Int):Int { this.setI32(88, value); return value; }
	public var explicitFrameId(get, set):Int;

	inline function get_explicitFrameId():Int return this.getI32(92);

	inline function set_explicitFrameId(value:Int):Int { this.setI32(92, value); return value; }
}
