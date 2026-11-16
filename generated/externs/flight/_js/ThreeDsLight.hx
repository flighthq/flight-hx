package flight._js;

abstract ThreeDsLight(Dynamic) {
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this["enabled"];
	inline function set_enabled(value:Bool):Bool return untyped this["enabled"] = value;
	public var falloff(get, set):Float;
	inline function get_falloff():Float return untyped this["falloff"];
	inline function set_falloff(value:Float):Float return untyped this["falloff"] = value;
	public var hotspot(get, set):Float;
	inline function get_hotspot():Float return untyped this["hotspot"];
	inline function set_hotspot(value:Float):Float return untyped this["hotspot"] = value;
	public var multiplier(get, set):Float;
	inline function get_multiplier():Float return untyped this["multiplier"];
	inline function set_multiplier(value:Float):Float return untyped this["multiplier"] = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
}
