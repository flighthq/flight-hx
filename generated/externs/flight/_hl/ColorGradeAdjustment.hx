package flight._hl;

abstract ColorGradeAdjustment(hl.Bytes) {
	public var exposure(get, set):Single;

	inline function get_exposure():Single return this.getF32(144);

	inline function set_exposure(value:Single):Single { this.setF32(144, value); return value; }
	public var brightness(get, set):Single;

	inline function get_brightness():Single return this.getF32(148);

	inline function set_brightness(value:Single):Single { this.setF32(148, value); return value; }
	public var contrast(get, set):Single;

	inline function get_contrast():Single return this.getF32(152);

	inline function set_contrast(value:Single):Single { this.setF32(152, value); return value; }
	public var saturation(get, set):Single;

	inline function get_saturation():Single return this.getF32(156);

	inline function set_saturation(value:Single):Single { this.setF32(156, value); return value; }
	public var temperature(get, set):Single;

	inline function get_temperature():Single return this.getF32(160);

	inline function set_temperature(value:Single):Single { this.setF32(160, value); return value; }
	public var tint(get, set):Single;

	inline function get_tint():Single return this.getF32(164);

	inline function set_tint(value:Single):Single { this.setF32(164, value); return value; }
	public var lift(get, set):Int;

	inline function get_lift():Int return this.getI32(168);

	inline function set_lift(value:Int):Int { this.setI32(168, value); return value; }
	public var gamma(get, set):Int;

	inline function get_gamma():Int return this.getI32(172);

	inline function set_gamma(value:Int):Int { this.setI32(172, value); return value; }
	public var gain(get, set):Int;

	inline function get_gain():Int return this.getI32(176);

	inline function set_gain(value:Int):Int { this.setI32(176, value); return value; }
}
