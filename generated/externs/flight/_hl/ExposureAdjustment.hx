package flight._hl;

abstract ExposureAdjustment(hl.Bytes) {
	public var exposure(get, set):Single;

	inline function get_exposure():Single return this.getF32(144);

	inline function set_exposure(value:Single):Single { this.setF32(144, value); return value; }
}
