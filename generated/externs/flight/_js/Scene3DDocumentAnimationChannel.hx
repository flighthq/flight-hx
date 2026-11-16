package flight._js;

abstract Scene3DDocumentAnimationChannel(Dynamic) {
	public var node(get, set):Int;
	inline function get_node():Int return untyped this["node"];
	inline function set_node(value:Int):Int return untyped this["node"] = value;
}
