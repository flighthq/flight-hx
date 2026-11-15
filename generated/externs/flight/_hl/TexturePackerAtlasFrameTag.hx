package flight._hl;

abstract TexturePackerAtlasFrameTag(hl.Bytes) {
	public var from(get, set):Int;

	inline function get_from():Int return this.getI32(4);

	inline function set_from(value:Int):Int { this.setI32(4, value); return value; }
	public var to(get, set):Int;

	inline function get_to():Int return this.getI32(32);

	inline function set_to(value:Int):Int { this.setI32(32, value); return value; }
}
