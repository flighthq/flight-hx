package flight._js;

abstract LayoutNode(Dynamic) {
	public var kind(get, set):String;
	inline function get_kind():String return untyped this["kind"];
	inline function set_kind(value:String):String return untyped this["kind"] = value;
	public var parentIndex(get, set):Int;
	inline function get_parentIndex():Int return untyped this["parentIndex"];
	inline function set_parentIndex(value:Int):Int return untyped this["parentIndex"] = value;
}
