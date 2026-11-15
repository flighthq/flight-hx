package flight._hl;

abstract LottieDocumentImportResult(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(96);

	inline function set_duration(value:Single):Single { this.setF32(96, value); return value; }
	public var frameRate(get, set):Single;

	inline function get_frameRate():Single return this.getF32(100);

	inline function set_frameRate(value:Single):Single { this.setF32(100, value); return value; }
}
