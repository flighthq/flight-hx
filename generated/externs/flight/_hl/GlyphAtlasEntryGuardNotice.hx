package flight._hl;

abstract GlyphAtlasEntryGuardNotice(hl.Bytes) {
	public var subject(get, set):Int;

	inline function get_subject():Int return this.getI32(4);

	inline function set_subject(value:Int):Int { this.setI32(4, value); return value; }
	public var repackCount(get, set):Int;

	inline function get_repackCount():Int return this.getI32(8);

	inline function set_repackCount(value:Int):Int { this.setI32(8, value); return value; }
}
