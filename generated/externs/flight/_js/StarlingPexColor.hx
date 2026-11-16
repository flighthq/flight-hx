package flight._js;

abstract StarlingPexColor(Dynamic) {
	public var red(get, set):Float;
	inline function get_red():Float return untyped this["red"];
	inline function set_red(value:Float):Float return untyped this["red"] = value;
	public var green(get, set):Float;
	inline function get_green():Float return untyped this["green"];
	inline function set_green(value:Float):Float return untyped this["green"] = value;
	public var blue(get, set):Float;
	inline function get_blue():Float return untyped this["blue"];
	inline function set_blue(value:Float):Float return untyped this["blue"] = value;
	public var alpha(get, set):Float;
	inline function get_alpha():Float return untyped this["alpha"];
	inline function set_alpha(value:Float):Float return untyped this["alpha"] = value;
}
