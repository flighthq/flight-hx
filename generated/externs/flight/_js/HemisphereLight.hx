package flight._js;

abstract HemisphereLight(Dynamic) {
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this["enabled"];
	inline function set_enabled(value:Bool):Bool return untyped this["enabled"] = value;
	public var groundColor(get, set):Int;
	inline function get_groundColor():Int return untyped this["groundColor"];
	inline function set_groundColor(value:Int):Int return untyped this["groundColor"] = value;
	public var intensity(get, set):Float;
	inline function get_intensity():Float return untyped this["intensity"];
	inline function set_intensity(value:Float):Float return untyped this["intensity"] = value;
	public var skyColor(get, set):Int;
	inline function get_skyColor():Int return untyped this["skyColor"];
	inline function set_skyColor(value:Int):Int return untyped this["skyColor"] = value;
}
