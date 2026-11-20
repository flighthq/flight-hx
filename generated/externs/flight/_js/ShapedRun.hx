package flight._js;

abstract ShapedRun(Dynamic) {
	public var advanceWidth(get, set):Float;
	inline function get_advanceWidth():Float return untyped this.advanceWidth;
	inline function set_advanceWidth(value:Float):Float return untyped this.advanceWidth = value;
	public var glyphCount(get, set):Int;
	inline function get_glyphCount():Int return untyped this.glyphCount;
	inline function set_glyphCount(value:Int):Int return untyped this.glyphCount = value;
	public var script(get, set):String;
	inline function get_script():String return untyped this.script;
	inline function set_script(value:String):String return untyped this.script = value;
}
