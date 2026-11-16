package flight._js;

abstract UnityShape(Dynamic) {
	public var angle(get, set):Float;
	inline function get_angle():Float return untyped this["angle"];
	inline function set_angle(value:Float):Float return untyped this["angle"] = value;
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this["enabled"];
	inline function set_enabled(value:Bool):Bool return untyped this["enabled"] = value;
	public var radius(get, set):Float;
	inline function get_radius():Float return untyped this["radius"];
	inline function set_radius(value:Float):Float return untyped this["radius"] = value;
}
