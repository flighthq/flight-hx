package flight._hl;

abstract GlyphAtlasRuntime(hl.Bytes) {
	public var dirty(get, set):Bool;

	inline function get_dirty():Bool return this.getUI8(328) != 0;

	inline function set_dirty(value:Bool):Bool { this.setUI8(328, value ? 1 : 0); return value; }
	public var dirtyMaxX(get, set):Int;

	inline function get_dirtyMaxX():Int return this.getI32(296);

	inline function set_dirtyMaxX(value:Int):Int { this.setI32(296, value); return value; }
	public var dirtyMaxY(get, set):Int;

	inline function get_dirtyMaxY():Int return this.getI32(300);

	inline function set_dirtyMaxY(value:Int):Int { this.setI32(300, value); return value; }
	public var dirtyMinX(get, set):Int;

	inline function get_dirtyMinX():Int return this.getI32(304);

	inline function set_dirtyMinX(value:Int):Int { this.setI32(304, value); return value; }
	public var dirtyMinY(get, set):Int;

	inline function get_dirtyMinY():Int return this.getI32(308);

	inline function set_dirtyMinY(value:Int):Int { this.setI32(308, value); return value; }
	public var layoutVersion(get, set):Int;

	inline function get_layoutVersion():Int return this.getI32(312);

	inline function set_layoutVersion(value:Int):Int { this.setI32(312, value); return value; }
	public var maxArea(get, set):Int;

	inline function get_maxArea():Int return this.getI32(240);

	inline function set_maxArea(value:Int):Int { this.setI32(240, value); return value; }
	public var maxBytes(get, set):Int;

	inline function get_maxBytes():Int return this.getI32(248);

	inline function set_maxBytes(value:Int):Int { this.setI32(248, value); return value; }
	public var maxGlyphs(get, set):Int;

	inline function get_maxGlyphs():Int return this.getI32(256);

	inline function set_maxGlyphs(value:Int):Int { this.setI32(256, value); return value; }
	public var occupiedArea(get, set):Int;

	inline function get_occupiedArea():Int return this.getI32(264);

	inline function set_occupiedArea(value:Int):Int { this.setI32(264, value); return value; }
	public var packBottom(get, set):Int;

	inline function get_packBottom():Int return this.getI32(316);

	inline function set_packBottom(value:Int):Int { this.setI32(316, value); return value; }
	public var padding(get, set):Int;

	inline function get_padding():Int return this.getI32(320);

	inline function set_padding(value:Int):Int { this.setI32(320, value); return value; }
	public var retainedBytes(get, set):Int;

	inline function get_retainedBytes():Int return this.getI32(272);

	inline function set_retainedBytes(value:Int):Int { this.setI32(272, value); return value; }
}
