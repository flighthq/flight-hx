package flight._js;

abstract Physics3DAbiContactBuffer(Dynamic) {
	public var count(get, set):Int;
	inline function get_count():Int return untyped this.count;
	inline function set_count(value:Int):Int return untyped this.count = value;
	public var pointCount(get, set):Int;
	inline function get_pointCount():Int return untyped this.pointCount;
	inline function set_pointCount(value:Int):Int return untyped this.pointCount = value;
	public var requiredCount(get, set):Int;
	inline function get_requiredCount():Int return untyped this.requiredCount;
	inline function set_requiredCount(value:Int):Int return untyped this.requiredCount = value;
	public var requiredPointCount(get, set):Int;
	inline function get_requiredPointCount():Int return untyped this.requiredPointCount;
	inline function set_requiredPointCount(value:Int):Int return untyped this.requiredPointCount = value;
}
