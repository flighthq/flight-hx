package flight._js;

abstract NotificationRequest(Dynamic) {
	public var title(get, set):String;
	inline function get_title():String return untyped this.title;
	inline function set_title(value:String):String return untyped this.title = value;
}
