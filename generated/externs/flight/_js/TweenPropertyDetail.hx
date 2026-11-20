package flight._js;

abstract TweenPropertyDetail(Dynamic) {
	public var change(get, set):Float;
	inline function get_change():Float return untyped this.change;
	inline function set_change(value:Float):Float return untyped this.change = value;
	public var key(get, set):String;
	inline function get_key():String return untyped this.key;
	inline function set_key(value:String):String return untyped this.key = value;
	public var start(get, set):Float;
	inline function get_start():Float return untyped this.start;
	inline function set_start(value:Float):Float return untyped this.start = value;
}
