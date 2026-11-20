package flight._hl;

abstract LottieGradientOpacityStop(hl.Bytes) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return this.getF64(0);

	inline function set_alpha(value:Float):Float { this.setF64(0, value); return value; }
	public var offset(get, set):Float;

	inline function get_offset():Float return this.getF64(8);

	inline function set_offset(value:Float):Float { this.setF64(8, value); return value; }
}
