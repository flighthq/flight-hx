package flight._js;

abstract GltfAccessor(Dynamic) {
	public var count(get, set):Float;
	inline function get_count():Float return untyped this["count"];
	inline function set_count(value:Float):Float return untyped this["count"] = value;
	public var type(get, set):String;
	inline function get_type():String return untyped this["type"];
	inline function set_type(value:String):String return untyped this["type"] = value;
}
