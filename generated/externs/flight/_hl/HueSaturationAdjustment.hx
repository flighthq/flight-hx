package flight._hl;

abstract HueSaturationAdjustment(hl.Bytes) {
	public var hue(get, set):Single;

	inline function get_hue():Single return this.getF32(144);

	inline function set_hue(value:Single):Single { this.setF32(144, value); return value; }
	public var saturation(get, set):Single;

	inline function get_saturation():Single return this.getF32(148);

	inline function set_saturation(value:Single):Single { this.setF32(148, value); return value; }
	public var lightness(get, set):Single;

	inline function get_lightness():Single return this.getF32(152);

	inline function set_lightness(value:Single):Single { this.setF32(152, value); return value; }
}
