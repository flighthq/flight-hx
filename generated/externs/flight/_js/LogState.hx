package flight._js;

abstract LogState(Dynamic) {
	public var groupDepth(get, set):Int;
	inline function get_groupDepth():Int return untyped this.groupDepth;
	inline function set_groupDepth(value:Int):Int return untyped this.groupDepth = value;
	public var nextSpanId(get, set):Float;
	inline function get_nextSpanId():Float return untyped this.nextSpanId;
	inline function set_nextSpanId(value:Float):Float return untyped this.nextSpanId = value;
}
