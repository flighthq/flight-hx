package flight._js;

abstract Awd2ParsedGeometry(Dynamic) {
	public var skinned(get, set):Bool;
	inline function get_skinned():Bool return untyped this["skinned"];
	inline function set_skinned(value:Bool):Bool return untyped this["skinned"] = value;
}
