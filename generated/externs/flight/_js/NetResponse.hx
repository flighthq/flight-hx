package flight._js;

abstract NetResponse(Dynamic) {
	public var status(get, set):Int;
	inline function get_status():Int return untyped this.status;
	inline function set_status(value:Int):Int return untyped this.status = value;
	public var statusText(get, set):String;
	inline function get_statusText():String return untyped this.statusText;
	inline function set_statusText(value:String):String return untyped this.statusText = value;
	public var ok(get, set):Bool;
	inline function get_ok():Bool return untyped this.ok;
	inline function set_ok(value:Bool):Bool return untyped this.ok = value;
	public var url(get, set):String;
	inline function get_url():String return untyped this.url;
	inline function set_url(value:String):String return untyped this.url = value;
}
