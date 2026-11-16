package flight._js;

abstract SheenPbrExtension(Dynamic) {
	public var sheenColor(get, set):Int;
	inline function get_sheenColor():Int return untyped this["sheenColor"];
	inline function set_sheenColor(value:Int):Int return untyped this["sheenColor"] = value;
	public var sheenRoughness(get, set):Float;
	inline function get_sheenRoughness():Float return untyped this["sheenRoughness"];
	inline function set_sheenRoughness(value:Float):Float return untyped this["sheenRoughness"] = value;
}
