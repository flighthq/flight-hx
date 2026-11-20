package flight._js;

abstract ClipboardBookmark(Dynamic) {
	public var title(get, set):String;
	inline function get_title():String return untyped this.title;
	inline function set_title(value:String):String return untyped this.title = value;
	public var url(get, set):String;
	inline function get_url():String return untyped this.url;
	inline function set_url(value:String):String return untyped this.url = value;
}
