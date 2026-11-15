package flight._hl;

abstract MorphShapeGradientPaintBinding(hl.Bytes) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(0);

	inline function set_commandIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var endFocalPointRatio(get, set):Float;

	inline function get_endFocalPointRatio():Float return this.getF64(80);

	inline function set_endFocalPointRatio(value:Float):Float { this.setF64(80, value); return value; }
	public var startFocalPointRatio(get, set):Float;

	inline function get_startFocalPointRatio():Float return this.getF64(208);

	inline function set_startFocalPointRatio(value:Float):Float { this.setF64(208, value); return value; }
}
