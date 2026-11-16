package flight._hl;

abstract ColorScaleBias(hl.Bytes) {
	public var redScale(get, set):Single;

	inline function get_redScale():Single return this.getF32(16);

	inline function set_redScale(value:Single):Single { this.setF32(16, value); return value; }
	public var greenScale(get, set):Single;

	inline function get_greenScale():Single return this.getF32(20);

	inline function set_greenScale(value:Single):Single { this.setF32(20, value); return value; }
	public var blueScale(get, set):Single;

	inline function get_blueScale():Single return this.getF32(24);

	inline function set_blueScale(value:Single):Single { this.setF32(24, value); return value; }
	public var alphaScale(get, set):Single;

	inline function get_alphaScale():Single return this.getF32(28);

	inline function set_alphaScale(value:Single):Single { this.setF32(28, value); return value; }
	public var redBias(get, set):Single;

	inline function get_redBias():Single return this.getF32(32);

	inline function set_redBias(value:Single):Single { this.setF32(32, value); return value; }
	public var greenBias(get, set):Single;

	inline function get_greenBias():Single return this.getF32(36);

	inline function set_greenBias(value:Single):Single { this.setF32(36, value); return value; }
	public var blueBias(get, set):Single;

	inline function get_blueBias():Single return this.getF32(40);

	inline function set_blueBias(value:Single):Single { this.setF32(40, value); return value; }
	public var alphaBias(get, set):Single;

	inline function get_alphaBias():Single return this.getF32(44);

	inline function set_alphaBias(value:Single):Single { this.setF32(44, value); return value; }
}
