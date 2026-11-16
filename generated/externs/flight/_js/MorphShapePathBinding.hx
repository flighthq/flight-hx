package flight._js;

abstract MorphShapePathBinding(Dynamic) {
	public var commandIndex(get, set):Int;
	inline function get_commandIndex():Int return untyped this["commandIndex"];
	inline function set_commandIndex(value:Int):Int return untyped this["commandIndex"] = value;
}
