package flight._js;

abstract ClipboardWriteItem(Dynamic) {
	public var format(get, set):String;
	inline function get_format():String return untyped this.format;
	inline function set_format(value:String):String return untyped this.format = value;
	public var data(get, set):String;
	inline function get_data():String return untyped this.data;
	inline function set_data(value:String):String return untyped this.data = value;
}
