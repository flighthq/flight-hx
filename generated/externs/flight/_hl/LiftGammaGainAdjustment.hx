package flight._hl;

abstract LiftGammaGainAdjustment(hl.Bytes) {
	public var lift(get, set):Int;

	inline function get_lift():Int return this.getI32(144);

	inline function set_lift(value:Int):Int { this.setI32(144, value); return value; }
	public var gamma(get, set):Int;

	inline function get_gamma():Int return this.getI32(148);

	inline function set_gamma(value:Int):Int { this.setI32(148, value); return value; }
	public var gain(get, set):Int;

	inline function get_gain():Int return this.getI32(152);

	inline function set_gain(value:Int):Int { this.setI32(152, value); return value; }
}
