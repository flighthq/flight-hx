package flight._js;

abstract RegExpExecResult(Dynamic) {
	public var index(get, set):Int;
	inline function get_index():Int return untyped this.index;
	inline function set_index(value:Int):Int return untyped this.index = value;
	public var input(get, set):String;
	inline function get_input():String return untyped this.input;
	inline function set_input(value:String):String return untyped this.input = value;
}
