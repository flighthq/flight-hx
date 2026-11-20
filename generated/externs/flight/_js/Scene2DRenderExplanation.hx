package flight._js;

abstract Scene2DRenderExplanation(Dynamic) {
	public var hasRenderer(get, set):Bool;
	inline function get_hasRenderer():Bool return untyped this.hasRenderer;
	inline function set_hasRenderer(value:Bool):Bool return untyped this.hasRenderer = value;
	public var prepared(get, set):Bool;
	inline function get_prepared():Bool return untyped this.prepared;
	inline function set_prepared(value:Bool):Bool return untyped this.prepared = value;
	public var visible(get, set):Bool;
	inline function get_visible():Bool return untyped this.visible;
	inline function set_visible(value:Bool):Bool return untyped this.visible = value;
	public var effectiveAlpha(get, set):Float;
	inline function get_effectiveAlpha():Float return untyped this.effectiveAlpha;
	inline function set_effectiveAlpha(value:Float):Float return untyped this.effectiveAlpha = value;
}
