package flight._hl;

abstract CocosPlistMetadata(hl.Bytes) {
	public var format(get, set):Int;

	inline function get_format():Int return this.getI32(0);

	inline function set_format(value:Int):Int { this.setI32(0, value); return value; }
}
