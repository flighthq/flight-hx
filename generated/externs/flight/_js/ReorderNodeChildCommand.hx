package flight._js;

abstract ReorderNodeChildCommand(Dynamic) {
	public var fromIndex(get, set):Int;
	inline function get_fromIndex():Int return untyped this["fromIndex"];
	inline function set_fromIndex(value:Int):Int return untyped this["fromIndex"] = value;
	public var toIndex(get, set):Int;
	inline function get_toIndex():Int return untyped this["toIndex"];
	inline function set_toIndex(value:Int):Int return untyped this["toIndex"] = value;
}
