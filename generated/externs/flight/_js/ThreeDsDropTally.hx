package flight._js;

abstract ThreeDsDropTally(Dynamic) {
	public var count(get, set):Int;
	inline function get_count():Int return untyped this["count"];
	inline function set_count(value:Int):Int return untyped this["count"] = value;
	public var kind(get, set):String;
	inline function get_kind():String return untyped this["kind"];
	inline function set_kind(value:String):String return untyped this["kind"] = value;
}
