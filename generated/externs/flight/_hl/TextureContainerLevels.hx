package flight._hl;

abstract TextureContainerLevels(hl.Bytes) {
	public var endOffset(get, set):Int;

	inline function get_endOffset():Int return this.getI32(24);

	inline function set_endOffset(value:Int):Int { this.setI32(24, value); return value; }
}
