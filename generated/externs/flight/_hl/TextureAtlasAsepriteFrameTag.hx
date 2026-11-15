package flight._hl;

abstract TextureAtlasAsepriteFrameTag(hl.Bytes) {
	public var from(get, set):Int;

	inline function get_from():Int return this.getI32(28);

	inline function set_from(value:Int):Int { this.setI32(28, value); return value; }
	public var to(get, set):Int;

	inline function get_to():Int return this.getI32(56);

	inline function set_to(value:Int):Int { this.setI32(56, value); return value; }
}
