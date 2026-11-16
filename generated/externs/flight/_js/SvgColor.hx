package flight._js;

abstract SvgColor(Dynamic) {
	public var alpha(get, set):Float;
	inline function get_alpha():Float return untyped this.alpha;
	inline function set_alpha(value:Float):Float return untyped this.alpha = value;
	public var rgb(get, set):Int;
	inline function get_rgb():Int return untyped this.rgb;
	inline function set_rgb(value:Int):Int return untyped this.rgb = value;
}
