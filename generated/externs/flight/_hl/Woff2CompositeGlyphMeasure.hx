package flight._hl;

abstract Woff2CompositeGlyphMeasure(hl.Bytes) {
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return this.getI32(0);

	inline function set_byteLength(value:Int):Int { this.setI32(0, value); return value; }
	public var hasInstructions(get, set):Bool;

	inline function get_hasInstructions():Bool return this.getUI8(8) != 0;

	inline function set_hasInstructions(value:Bool):Bool { this.setUI8(8, value ? 1 : 0); return value; }
}
