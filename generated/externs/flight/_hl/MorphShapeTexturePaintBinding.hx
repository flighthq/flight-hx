package flight._hl;

abstract MorphShapeTexturePaintBinding(hl.Bytes) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(0);

	inline function set_commandIndex(value:Int):Int { this.setI32(0, value); return value; }
}
