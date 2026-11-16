package flight._js;

abstract Physics2DDebugGeometry(Dynamic) {
	public var circleCount(get, set):Int;
	inline function get_circleCount():Int return untyped this.circleCount;
	inline function set_circleCount(value:Int):Int return untyped this.circleCount = value;
	public var lineCount(get, set):Int;
	inline function get_lineCount():Int return untyped this.lineCount;
	inline function set_lineCount(value:Int):Int return untyped this.lineCount = value;
}
