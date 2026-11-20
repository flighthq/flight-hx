package flight._js;

abstract NativeTextData(Dynamic) {
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var text(get, set):String;
	inline function get_text():String return untyped this.text;
	inline function set_text(value:String):String return untyped this.text = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
}
