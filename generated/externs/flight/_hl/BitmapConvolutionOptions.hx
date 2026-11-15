package flight._hl;

abstract BitmapConvolutionOptions(hl.Bytes) {
	public var matrixX(get, set):Int;

	inline function get_matrixX():Int return this.getI32(24);

	inline function set_matrixX(value:Int):Int { this.setI32(24, value); return value; }
	public var matrixY(get, set):Int;

	inline function get_matrixY():Int return this.getI32(28);

	inline function set_matrixY(value:Int):Int { this.setI32(28, value); return value; }
}
