package flight._js;

abstract Woff2Cursor(Dynamic) {
	public var at(get, set):Int;
	inline function get_at():Int return untyped this.at;
	inline function set_at(value:Int):Int return untyped this.at = value;
}
