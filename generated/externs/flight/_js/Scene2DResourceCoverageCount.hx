package flight._js;

abstract Scene2DResourceCoverageCount(Dynamic) {
	public var resolved(get, set):Int;
	inline function get_resolved():Int return untyped this.resolved;
	inline function set_resolved(value:Int):Int return untyped this.resolved = value;
	public var total(get, set):Int;
	inline function get_total():Int return untyped this.total;
	inline function set_total(value:Int):Int return untyped this.total = value;
}
