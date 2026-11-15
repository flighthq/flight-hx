package flight._hl;

abstract ConvolutionEffect(hl.Bytes) {
	public var matrixX(get, set):Single;

	inline function get_matrixX():Single return this.getF32(112);

	inline function set_matrixX(value:Single):Single { this.setF32(112, value); return value; }
	public var matrixY(get, set):Single;

	inline function get_matrixY():Single return this.getF32(116);

	inline function set_matrixY(value:Single):Single { this.setF32(116, value); return value; }
}
