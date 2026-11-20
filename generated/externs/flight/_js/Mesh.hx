package flight._js;

abstract Mesh(Dynamic) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> return untyped this.name;
	inline function set_name(value:Null<String>):Null<String> { untyped this.name = value; return value; }
	public var alpha(get, set):Float;
	inline function get_alpha():Float return untyped this.alpha;
	inline function set_alpha(value:Float):Float { untyped this.alpha = value; flight.Node.invalidateNodeAppearance(cast this); return value; }
	public var visible(get, set):Bool;
	inline function get_visible():Bool return untyped this.visible;
	inline function set_visible(value:Bool):Bool { untyped this.visible = value; flight.Node.invalidateNodeAppearance(cast this); return value; }
}
