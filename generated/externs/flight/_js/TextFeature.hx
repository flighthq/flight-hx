package flight._js;

abstract TextFeature(Dynamic) {
	public var tag(get, set):String;
	inline function get_tag():String return untyped this.tag;
	inline function set_tag(value:String):String return untyped this.tag = value;
	public var value(get, set):Int;
	inline function get_value():Int return untyped this.value;
	inline function set_value(value:Int):Int return untyped this.value = value;
}
