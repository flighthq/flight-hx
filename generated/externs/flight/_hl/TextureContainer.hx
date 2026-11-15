package flight._hl;

abstract TextureContainer(hl.Bytes) {
	public var width(get, set):Int;

	inline function get_width():Int return this.getI32(8);

	inline function set_width(value:Int):Int { this.setI32(8, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return this.getI32(16);

	inline function set_height(value:Int):Int { this.setI32(16, value); return value; }
	public var depth(get, set):Int;

	inline function get_depth():Int return this.getI32(24);

	inline function set_depth(value:Int):Int { this.setI32(24, value); return value; }
	public var mipLevels(get, set):Int;

	inline function get_mipLevels():Int return this.getI32(32);

	inline function set_mipLevels(value:Int):Int { this.setI32(32, value); return value; }
	public var layers(get, set):Int;

	inline function get_layers():Int return this.getI32(40);

	inline function set_layers(value:Int):Int { this.setI32(40, value); return value; }
	public var faces(get, set):Int;

	inline function get_faces():Int return this.getI32(48);

	inline function set_faces(value:Int):Int { this.setI32(48, value); return value; }
}
