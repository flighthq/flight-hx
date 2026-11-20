package flight._js;

abstract Scene2DResourceFailureNotice(Dynamic) {
	public var total(get, set):Int;
	inline function get_total():Int return untyped this.total;
	inline function set_total(value:Int):Int return untyped this.total = value;
	public var unresolved(get, set):Int;
	inline function get_unresolved():Int return untyped this.unresolved;
	inline function set_unresolved(value:Int):Int return untyped this.unresolved = value;
}
