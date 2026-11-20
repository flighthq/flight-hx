package flight._js;

abstract Awd2StringRead(Dynamic) {
	public var end(get, set):Int;
	inline function get_end():Int return untyped this.end;
	inline function set_end(value:Int):Int return untyped this.end = value;
	public var value(get, set):String;
	inline function get_value():String return untyped this.value;
	inline function set_value(value:String):String return untyped this.value = value;
}
