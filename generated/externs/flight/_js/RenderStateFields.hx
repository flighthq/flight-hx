package flight._js;

abstract RenderStateFields(Dynamic) {
	public var allowSmoothing(get, set):Bool;
	inline function get_allowSmoothing():Bool return untyped this.allowSmoothing;
	inline function set_allowSmoothing(value:Bool):Bool return untyped this.allowSmoothing = value;
	public var currentClipDepth(get, set):Int;
	inline function get_currentClipDepth():Int return untyped this.currentClipDepth;
	inline function set_currentClipDepth(value:Int):Int return untyped this.currentClipDepth = value;
	public var pixelRatio(get, set):Float;
	inline function get_pixelRatio():Float return untyped this.pixelRatio;
	inline function set_pixelRatio(value:Float):Float return untyped this.pixelRatio = value;
	public var renderAlpha(get, set):Float;
	inline function get_renderAlpha():Float return untyped this.renderAlpha;
	inline function set_renderAlpha(value:Float):Float return untyped this.renderAlpha = value;
	public var roundPixels(get, set):Bool;
	inline function get_roundPixels():Bool return untyped this.roundPixels;
	inline function set_roundPixels(value:Bool):Bool return untyped this.roundPixels = value;
}
