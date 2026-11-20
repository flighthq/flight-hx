package flight._js;

abstract ShapedGlyph(Dynamic) {
	public var cluster(get, set):Int;
	inline function get_cluster():Int return untyped this.cluster;
	inline function set_cluster(value:Int):Int return untyped this.cluster = value;
	public var glyphId(get, set):Int;
	inline function get_glyphId():Int return untyped this.glyphId;
	inline function set_glyphId(value:Int):Int return untyped this.glyphId = value;
	public var xAdvance(get, set):Float;
	inline function get_xAdvance():Float return untyped this.xAdvance;
	inline function set_xAdvance(value:Float):Float return untyped this.xAdvance = value;
	public var xOffset(get, set):Float;
	inline function get_xOffset():Float return untyped this.xOffset;
	inline function set_xOffset(value:Float):Float return untyped this.xOffset = value;
	public var yAdvance(get, set):Float;
	inline function get_yAdvance():Float return untyped this.yAdvance;
	inline function set_yAdvance(value:Float):Float return untyped this.yAdvance = value;
	public var yOffset(get, set):Float;
	inline function get_yOffset():Float return untyped this.yOffset;
	inline function set_yOffset(value:Float):Float return untyped this.yOffset = value;
}
