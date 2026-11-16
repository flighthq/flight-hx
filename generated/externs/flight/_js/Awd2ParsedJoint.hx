package flight._js;

abstract Awd2ParsedJoint(Dynamic) {
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
	public var parentIndex(get, set):Int;
	inline function get_parentIndex():Int return untyped this["parentIndex"];
	inline function set_parentIndex(value:Int):Int return untyped this["parentIndex"] = value;
}
