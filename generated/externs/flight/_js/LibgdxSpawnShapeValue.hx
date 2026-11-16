package flight._js;

abstract LibgdxSpawnShapeValue(Dynamic) {
	public var edges(get, set):Bool;
	inline function get_edges():Bool return untyped this["edges"];
	inline function set_edges(value:Bool):Bool return untyped this["edges"] = value;
}
