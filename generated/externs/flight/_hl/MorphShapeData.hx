package flight._hl;

abstract MorphShapeData(hl.Bytes) {
	public var progress(get, set):Float;

	inline function get_progress():Float return this.getF64(104);

	inline function set_progress(value:Float):Float { this.setF64(104, value); return value; }
}
