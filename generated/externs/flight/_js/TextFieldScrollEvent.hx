package flight._js;

abstract TextFieldScrollEvent(Dynamic) {
	public var previousScrollH(get, set):Float;
	inline function get_previousScrollH():Float return untyped this.previousScrollH;
	inline function set_previousScrollH(value:Float):Float return untyped this.previousScrollH = value;
	public var previousScrollV(get, set):Float;
	inline function get_previousScrollV():Float return untyped this.previousScrollV;
	inline function set_previousScrollV(value:Float):Float return untyped this.previousScrollV = value;
	public var scrollH(get, set):Float;
	inline function get_scrollH():Float return untyped this.scrollH;
	inline function set_scrollH(value:Float):Float return untyped this.scrollH = value;
	public var scrollV(get, set):Float;
	inline function get_scrollV():Float return untyped this.scrollV;
	inline function set_scrollV(value:Float):Float return untyped this.scrollV = value;
}
