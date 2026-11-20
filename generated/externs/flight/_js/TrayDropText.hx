package flight._js;

abstract TrayDropText(Dynamic) {
	public var text(get, set):String;
	inline function get_text():String return untyped this.text;
	inline function set_text(value:String):String return untyped this.text = value;
}
