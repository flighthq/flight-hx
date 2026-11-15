package flight._hl;

abstract TextureContainerLevel(hl.Bytes) {
	public var byteOffset(get, set):Int;

	inline function get_byteOffset():Int return this.getI32(0);

	inline function set_byteOffset(value:Int):Int { this.setI32(0, value); return value; }
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return this.getI32(8);

	inline function set_byteLength(value:Int):Int { this.setI32(8, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(16);

	inline function set_width(value:Int):Int { this.setI32(16, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(24);

	inline function set_height(value:Int):Int { this.setI32(24, value); return value; }
}
