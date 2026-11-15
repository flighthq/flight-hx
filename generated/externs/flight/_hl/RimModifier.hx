package flight._hl;

abstract RimModifier(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(64);

	inline function set_color(value:Int):Int { this.setI32(64, value); return value; }
	public var power(get, set):Single;

	inline function get_power():Single return this.getF32(68);

	inline function set_power(value:Single):Single { this.setF32(68, value); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(72);

	inline function set_intensity(value:Single):Single { this.setF32(72, value); return value; }
	public var bias(get, set):Single;

	inline function get_bias():Single return this.getF32(76);

	inline function set_bias(value:Single):Single { this.setF32(76, value); return value; }
}
