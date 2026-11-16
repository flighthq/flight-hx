package flight._js;

abstract HslColor(Dynamic) {
	public var h(get, set):Float;
	inline function get_h():Float return untyped this["h"];
	inline function set_h(value:Float):Float return untyped this["h"] = value;
	public var s(get, set):Float;
	inline function get_s():Float return untyped this["s"];
	inline function set_s(value:Float):Float return untyped this["s"] = value;
	public var l(get, set):Float;
	inline function get_l():Float return untyped this["l"];
	inline function set_l(value:Float):Float return untyped this["l"] = value;
}
