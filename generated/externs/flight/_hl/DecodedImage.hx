package flight._hl;

abstract DecodedImage(hl.Bytes) {
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(16);

	inline function set_height(value:Int):Int { this.setI32(16, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(24);

	inline function set_width(value:Int):Int { this.setI32(24, value); return value; }
}
