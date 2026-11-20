package flight._js;

abstract UnityGradientAlphaKey(Dynamic) {
	public var alpha(get, set):Float;
	inline function get_alpha():Float return untyped this.alpha;
	inline function set_alpha(value:Float):Float return untyped this.alpha = value;
	public var time(get, set):Float;
	inline function get_time():Float return untyped this.time;
	inline function set_time(value:Float):Float return untyped this.time = value;
}
