package flight._js;

abstract RivePathRecord(Dynamic) {
	public var pathIndex(get, set):Int;
	inline function get_pathIndex():Int return untyped this["pathIndex"];
	inline function set_pathIndex(value:Int):Int return untyped this["pathIndex"] = value;
}
