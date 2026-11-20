package flight._hl;

abstract LottieDocumentImportResult(hl.Bytes) {
	public var duration(get, set):Float;

	inline function get_duration():Float return this.getF64(96);

	inline function set_duration(value:Float):Float { this.setF64(96, value); return value; }
	public var frameRate(get, set):Float;

	inline function get_frameRate():Float return this.getF64(104);

	inline function set_frameRate(value:Float):Float { this.setF64(104, value); return value; }
}
