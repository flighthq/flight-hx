package flight._js;

abstract ColorScaleBias(Dynamic) {
	public var redScale(get, set):Float;
	inline function get_redScale():Float return untyped this["redScale"];
	inline function set_redScale(value:Float):Float return untyped this["redScale"] = value;
	public var greenScale(get, set):Float;
	inline function get_greenScale():Float return untyped this["greenScale"];
	inline function set_greenScale(value:Float):Float return untyped this["greenScale"] = value;
	public var blueScale(get, set):Float;
	inline function get_blueScale():Float return untyped this["blueScale"];
	inline function set_blueScale(value:Float):Float return untyped this["blueScale"] = value;
	public var alphaScale(get, set):Float;
	inline function get_alphaScale():Float return untyped this["alphaScale"];
	inline function set_alphaScale(value:Float):Float return untyped this["alphaScale"] = value;
	public var redBias(get, set):Float;
	inline function get_redBias():Float return untyped this["redBias"];
	inline function set_redBias(value:Float):Float return untyped this["redBias"] = value;
	public var greenBias(get, set):Float;
	inline function get_greenBias():Float return untyped this["greenBias"];
	inline function set_greenBias(value:Float):Float return untyped this["greenBias"] = value;
	public var blueBias(get, set):Float;
	inline function get_blueBias():Float return untyped this["blueBias"];
	inline function set_blueBias(value:Float):Float return untyped this["blueBias"] = value;
	public var alphaBias(get, set):Float;
	inline function get_alphaBias():Float return untyped this["alphaBias"];
	inline function set_alphaBias(value:Float):Float return untyped this["alphaBias"] = value;
}
