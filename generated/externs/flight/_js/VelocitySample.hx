package flight._js;

abstract VelocitySample(Dynamic) {
	public var lastFrameId(get, set):Int;
	inline function get_lastFrameId():Int return untyped this.lastFrameId;
	inline function set_lastFrameId(value:Int):Int return untyped this.lastFrameId = value;
	public var explicitFrameId(get, set):Int;
	inline function get_explicitFrameId():Int return untyped this.explicitFrameId;
	inline function set_explicitFrameId(value:Int):Int return untyped this.explicitFrameId = value;
}
