package flight._hl;

abstract HostImageDimensions(hl.Bytes) {
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(0);

	inline function set_height(value:Int):Int { this.setI32(0, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(4);

	inline function set_width(value:Int):Int { this.setI32(4, value); return value; }
}
