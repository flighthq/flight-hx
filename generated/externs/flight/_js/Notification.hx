package flight._js;

abstract Notification(Dynamic) {
	public var id(get, set):String;
	inline function get_id():String return untyped this.id;
	inline function set_id(value:String):String return untyped this.id = value;
	public var tag(get, set):String;
	inline function get_tag():String return untyped this.tag;
	inline function set_tag(value:String):String return untyped this.tag = value;
	public var title(get, set):String;
	inline function get_title():String return untyped this.title;
	inline function set_title(value:String):String return untyped this.title = value;
}
