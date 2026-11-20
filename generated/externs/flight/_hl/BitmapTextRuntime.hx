package flight._hl;

abstract BitmapTextRuntime(hl.Bytes) {
	public var glyphLayoutVersion(get, set):haxe.Int64;

	inline function get_glyphLayoutVersion():haxe.Int64 return haxe.Int64.make(this.getI32(84), this.getI32(80));

	inline function set_glyphLayoutVersion(value:haxe.Int64):haxe.Int64 { { this.setI32(80, value.low); this.setI32(84, value.high); }; return value; }
	public var lineCount(get, set):Int;

	inline function get_lineCount():Int return this.getI32(88);

	inline function set_lineCount(value:Int):Int { this.setI32(88, value); return value; }
	public var truncated(get, set):Bool;

	inline function get_truncated():Bool return this.getUI8(96) != 0;

	inline function set_truncated(value:Bool):Bool { this.setUI8(96, value ? 1 : 0); return value; }
}
