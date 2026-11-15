package flight._hl;

abstract GrayscaleAdjustment(hl.Bytes) {
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(144);

	inline function set_intensity(value:Single):Single { this.setF32(144, value); return value; }
}
