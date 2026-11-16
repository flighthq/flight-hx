package flight._js;

abstract FogModifierOptions(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this["color"];
	inline function set_color(value:Int):Int return untyped this["color"] = value;
}
