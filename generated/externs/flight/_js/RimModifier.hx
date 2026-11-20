package flight._js;

abstract RimModifier(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this.color;
	inline function set_color(value:Int):Int return untyped this.color = value;
	public var power(get, set):Float;
	inline function get_power():Float return untyped this.power;
	inline function set_power(value:Float):Float return untyped this.power = value;
	public var intensity(get, set):Float;
	inline function get_intensity():Float return untyped this.intensity;
	inline function set_intensity(value:Float):Float return untyped this.intensity = value;
	public var bias(get, set):Float;
	inline function get_bias():Float return untyped this.bias;
	inline function set_bias(value:Float):Float return untyped this.bias = value;
}
