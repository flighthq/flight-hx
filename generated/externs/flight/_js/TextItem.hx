package flight._js;

abstract TextItem(Dynamic) {
	public var end(get, set):Int;
	inline function get_end():Int return untyped this.end;
	inline function set_end(value:Int):Int return untyped this.end = value;
	public var script(get, set):String;
	inline function get_script():String return untyped this.script;
	inline function set_script(value:String):String return untyped this.script = value;
	public var start(get, set):Int;
	inline function get_start():Int return untyped this.start;
	inline function set_start(value:Int):Int return untyped this.start = value;
}
