package flight._js;

abstract UnlitMaterial(Dynamic) {
	public var baseColor(get, set):Int;
	inline function get_baseColor():Int return untyped this["baseColor"];
	inline function set_baseColor(value:Int):Int return untyped this["baseColor"] = value;
}
