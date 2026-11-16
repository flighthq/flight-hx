package flight._js;

abstract ColladaElementCount(Dynamic) {
	public var feature(get, set):String;
	inline function get_feature():String return untyped this["feature"];
	inline function set_feature(value:String):String return untyped this["feature"] = value;
	public var count(get, set):Int;
	inline function get_count():Int return untyped this["count"];
	inline function set_count(value:Int):Int return untyped this["count"] = value;
}
