package flight._js;

abstract CommandFields(Dynamic) {
	public var label(get, set):String;
	inline function get_label():String return untyped this.label;
	inline function set_label(value:String):String return untyped this.label = value;
}
