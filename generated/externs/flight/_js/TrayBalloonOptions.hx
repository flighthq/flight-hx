package flight._js;

abstract TrayBalloonOptions(Dynamic) {
	public var text(get, set):String;
	inline function get_text():String return untyped this.text;
	inline function set_text(value:String):String return untyped this.text = value;
	public var title(get, set):String;
	inline function get_title():String return untyped this.title;
	inline function set_title(value:String):String return untyped this.title = value;
}
