package flight._js;

abstract UnityColorOverLifetime(Dynamic) {
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this["enabled"];
	inline function set_enabled(value:Bool):Bool return untyped this["enabled"] = value;
}
