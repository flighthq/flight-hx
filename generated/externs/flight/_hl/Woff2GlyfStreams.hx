package flight._hl;

abstract Woff2GlyfStreams(hl.Bytes) {
	public var glyphCount(get, set):Int;

	inline function get_glyphCount():Int return this.getI32(0);

	inline function set_glyphCount(value:Int):Int { this.setI32(0, value); return value; }
	public var indexFormat(get, set):Int;

	inline function get_indexFormat():Int return this.getI32(232);

	inline function set_indexFormat(value:Int):Int { this.setI32(232, value); return value; }
}
