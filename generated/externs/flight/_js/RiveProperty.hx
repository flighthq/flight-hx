package flight._js;

abstract RiveProperty(Dynamic) {
	public var key(get, set):Float;
	inline function get_key():Float return untyped this["key"];
	inline function set_key(value:Float):Float return untyped this["key"] = value;
}
