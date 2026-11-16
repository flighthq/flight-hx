package flight._hl;

abstract SfntTableDirectory(hl.Bytes) {
	public var declaredTableCount(get, set):Int;

	inline function get_declaredTableCount():Int return this.getI32(72);

	inline function set_declaredTableCount(value:Int):Int { this.setI32(72, value); return value; }
	public var sfntVersion(get, set):Int;

	inline function get_sfntVersion():Int return this.getI32(80);

	inline function set_sfntVersion(value:Int):Int { this.setI32(80, value); return value; }
}
