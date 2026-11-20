package flight._js;

abstract NotificationAction(Dynamic) {
	public var id(get, set):String;
	inline function get_id():String return untyped this.id;
	inline function set_id(value:String):String return untyped this.id = value;
	public var title(get, set):String;
	inline function get_title():String return untyped this.title;
	inline function set_title(value:String):String return untyped this.title = value;
}
