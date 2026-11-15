package flight._hl;

abstract LottieGradientOpacityStop(hl.Bytes) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(0);

	inline function set_alpha(value:Single):Single { this.setF32(0, value); return value; }
	public var offset(get, set):Single;

	inline function get_offset():Single return this.getF32(4);

	inline function set_offset(value:Single):Single { this.setF32(4, value); return value; }
}
