package flight._hl;

abstract TextureSourceFields(hl.Bytes) {
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(24);

	inline function set_height(value:Int):Int { this.setI32(24, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(56);

	inline function set_version(value:Int):Int { this.setI32(56, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(60);

	inline function set_width(value:Int):Int { this.setI32(60, value); return value; }
}
