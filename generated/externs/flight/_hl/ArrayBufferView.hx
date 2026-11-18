package flight._hl;

abstract ArrayBufferView(hl.Bytes) {
	public var byteOffset(get, set):Int;

	inline function get_byteOffset():Int return this.getI32(8);

	inline function set_byteOffset(value:Int):Int { this.setI32(8, value); return value; }
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return this.getI32(16);

	inline function set_byteLength(value:Int):Int { this.setI32(16, value); return value; }
}
