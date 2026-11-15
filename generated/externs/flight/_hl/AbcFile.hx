package flight._hl;

abstract AbcFile(hl.Bytes) {
	public var majorVersion(get, set):Int;

	inline function get_majorVersion():Int return this.getUI16(216);

	inline function set_majorVersion(value:Int):Int { this.setUI16(216, value); return value; }
	public var minorVersion(get, set):Int;

	inline function get_minorVersion():Int return this.getUI16(296);

	inline function set_minorVersion(value:Int):Int { this.setUI16(296, value); return value; }
}
