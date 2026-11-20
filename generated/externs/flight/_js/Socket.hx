package flight._js;

abstract Socket(Dynamic) {
	public var url(get, set):String;
	inline function get_url():String return untyped this.url;
	inline function set_url(value:String):String return untyped this.url = value;
	inline public function freeRef():Void {
		flight._js._fn.Socket.freeSocketRef(cast this);
	}
}
