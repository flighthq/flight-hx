package flight._js;

abstract LiftGammaGainAdjustment(Dynamic) {
	public var lift(get, set):Int;
	inline function get_lift():Int return untyped this.lift;
	inline function set_lift(value:Int):Int return untyped this.lift = value;
	public var gamma(get, set):Int;
	inline function get_gamma():Int return untyped this.gamma;
	inline function set_gamma(value:Int):Int return untyped this.gamma = value;
	public var gain(get, set):Int;
	inline function get_gain():Int return untyped this.gain;
	inline function set_gain(value:Int):Int return untyped this.gain = value;
}
