package flight._hl;

abstract ShapedGlyph(hl.Bytes) {
	public var cluster(get, set):Int;

	inline function get_cluster():Int return this.getI32(0);

	inline function set_cluster(value:Int):Int { this.setI32(0, value); return value; }
	public var glyphId(get, set):Int;

	inline function get_glyphId():Int return this.getI32(4);

	inline function set_glyphId(value:Int):Int { this.setI32(4, value); return value; }
	public var xAdvance(get, set):Single;

	inline function get_xAdvance():Single return this.getF32(8);

	inline function set_xAdvance(value:Single):Single { this.setF32(8, value); return value; }
	public var xOffset(get, set):Single;

	inline function get_xOffset():Single return this.getF32(12);

	inline function set_xOffset(value:Single):Single { this.setF32(12, value); return value; }
	public var yAdvance(get, set):Single;

	inline function get_yAdvance():Single return this.getF32(16);

	inline function set_yAdvance(value:Single):Single { this.setF32(16, value); return value; }
	public var yOffset(get, set):Single;

	inline function get_yOffset():Single return this.getF32(20);

	inline function set_yOffset(value:Single):Single { this.setF32(20, value); return value; }
}
