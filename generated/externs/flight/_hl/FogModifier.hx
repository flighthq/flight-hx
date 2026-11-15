package flight._hl;

abstract FogModifier(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(64);

	inline function set_color(value:Int):Int { this.setI32(64, value); return value; }
	public var near(get, set):Single;

	inline function get_near():Single return this.getF32(72);

	inline function set_near(value:Single):Single { this.setF32(72, value); return value; }
	public var far(get, set):Single;

	inline function get_far():Single return this.getF32(76);

	inline function set_far(value:Single):Single { this.setF32(76, value); return value; }
	public var density(get, set):Single;

	inline function get_density():Single return this.getF32(80);

	inline function set_density(value:Single):Single { this.setF32(80, value); return value; }
}
