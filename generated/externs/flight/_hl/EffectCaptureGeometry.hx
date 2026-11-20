package flight._hl;

abstract EffectCaptureGeometry(hl.Bytes) {
	public var targetHeight(get, set):Float;

	inline function get_targetHeight():Float return this.getF64(144);

	inline function set_targetHeight(value:Float):Float { this.setF64(144, value); return value; }
	public var targetWidth(get, set):Float;

	inline function get_targetWidth():Float return this.getF64(152);

	inline function set_targetWidth(value:Float):Float { this.setF64(152, value); return value; }
}
