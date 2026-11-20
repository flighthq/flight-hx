package flight._js;

abstract Physics2DAbiQueryBuffer(Dynamic) {
	public var count(get, set):Int;
	inline function get_count():Int return untyped this.count;
	inline function set_count(value:Int):Int return untyped this.count = value;
	public var requiredCount(get, set):Int;
	inline function get_requiredCount():Int return untyped this.requiredCount;
	inline function set_requiredCount(value:Int):Int return untyped this.requiredCount = value;
}
