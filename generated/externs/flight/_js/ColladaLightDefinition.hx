package flight._js;

abstract ColladaLightDefinition(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this.color;
	inline function set_color(value:Int):Int return untyped this.color = value;
	public var decay(get, set):Float;
	inline function get_decay():Float return untyped this.decay;
	inline function set_decay(value:Float):Float return untyped this.decay = value;
	public var innerConeDegrees(get, set):Float;
	inline function get_innerConeDegrees():Float return untyped this.innerConeDegrees;
	inline function set_innerConeDegrees(value:Float):Float return untyped this.innerConeDegrees = value;
	public var intensity(get, set):Float;
	inline function get_intensity():Float return untyped this.intensity;
	inline function set_intensity(value:Float):Float return untyped this.intensity = value;
	public var outerConeDegrees(get, set):Float;
	inline function get_outerConeDegrees():Float return untyped this.outerConeDegrees;
	inline function set_outerConeDegrees(value:Float):Float return untyped this.outerConeDegrees = value;
	public var spotBlend(get, set):Float;
	inline function get_spotBlend():Float return untyped this.spotBlend;
	inline function set_spotBlend(value:Float):Float return untyped this.spotBlend = value;
}
