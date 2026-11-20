package flight._js;

abstract TextFieldLinkEvent(Dynamic) {
	public var url(get, set):String;
	inline function get_url():String return untyped this.url;
	inline function set_url(value:String):String return untyped this.url = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
}
