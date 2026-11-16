package flight._hl;

abstract SfntFontTable(hl.Bytes) {
	public var tag(get, set):Int;

	inline function get_tag():Int return this.getI32(16);

	inline function set_tag(value:Int):Int { this.setI32(16, value); return value; }
}
