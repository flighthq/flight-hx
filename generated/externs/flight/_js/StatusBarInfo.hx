package flight._js;

abstract StatusBarInfo(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this.color;
	inline function set_color(value:Int):Int return untyped this.color = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var overlaysContent(get, set):Bool;
	inline function get_overlaysContent():Bool return untyped this.overlaysContent;
	inline function set_overlaysContent(value:Bool):Bool return untyped this.overlaysContent = value;
	public var visible(get, set):Bool;
	inline function get_visible():Bool return untyped this.visible;
	inline function set_visible(value:Bool):Bool return untyped this.visible = value;
}
