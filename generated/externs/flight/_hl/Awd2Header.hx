package flight._hl;

abstract Awd2Header(hl.Bytes) {
	public var bodyLength(get, set):Int;

	inline function get_bodyLength():Int return this.getI32(0);

	inline function set_bodyLength(value:Int):Int { this.setI32(0, value); return value; }
	public var compression(get, set):Int;

	inline function get_compression():Int return this.getUI8(6);

	inline function set_compression(value:Int):Int { this.setUI8(6, value); return value; }
	public var flags(get, set):Int;

	inline function get_flags():Int return this.getUI16(4);

	inline function set_flags(value:Int):Int { this.setUI16(4, value); return value; }
	public var versionMajor(get, set):Int;

	inline function get_versionMajor():Int return this.getUI8(7);

	inline function set_versionMajor(value:Int):Int { this.setUI8(7, value); return value; }
	public var versionMinor(get, set):Int;

	inline function get_versionMinor():Int return this.getUI8(8);

	inline function set_versionMinor(value:Int):Int { this.setUI8(8, value); return value; }
}
