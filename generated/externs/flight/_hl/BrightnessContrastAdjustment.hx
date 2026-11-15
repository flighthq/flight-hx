package flight._hl;

abstract BrightnessContrastAdjustment(hl.Bytes) {
	public var brightness(get, set):Single;

	inline function get_brightness():Single return this.getF32(144);

	inline function set_brightness(value:Single):Single { this.setF32(144, value); return value; }
	public var contrast(get, set):Single;

	inline function get_contrast():Single return this.getF32(148);

	inline function set_contrast(value:Single):Single { this.setF32(148, value); return value; }
}
