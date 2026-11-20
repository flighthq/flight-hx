package flight._js;

abstract RenderStateStats(Dynamic) {
	public var drawCallCount(get, set):Int;
	inline function get_drawCallCount():Int return untyped this.drawCallCount;
	inline function set_drawCallCount(value:Int):Int return untyped this.drawCallCount = value;
	public var flushCount(get, set):Int;
	inline function get_flushCount():Int return untyped this.flushCount;
	inline function set_flushCount(value:Int):Int return untyped this.flushCount = value;
	public var proxyVisitedCount(get, set):Int;
	inline function get_proxyVisitedCount():Int return untyped this.proxyVisitedCount;
	inline function set_proxyVisitedCount(value:Int):Int return untyped this.proxyVisitedCount = value;
}
