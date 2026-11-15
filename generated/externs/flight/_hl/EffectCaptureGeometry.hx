package flight._hl;

abstract EffectCaptureGeometry(hl.Bytes) {
	public var targetHeight(get, set):Single;

	inline function get_targetHeight():Single return this.getF32(88);

	inline function set_targetHeight(value:Single):Single { this.setF32(88, value); return value; }
	public var targetWidth(get, set):Single;

	inline function get_targetWidth():Single return this.getF32(92);

	inline function set_targetWidth(value:Single):Single { this.setF32(92, value); return value; }
}
