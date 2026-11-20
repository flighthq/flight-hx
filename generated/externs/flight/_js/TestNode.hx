package flight._js;

abstract TestNode(Dynamic) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> return untyped this.name;
	inline function set_name(value:Null<String>):Null<String> { untyped this.name = value; return value; }
}
