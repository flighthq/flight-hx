package flight._js;

abstract CommandDispatchExplanation(Dynamic) {
	public var resolved(get, set):Bool;
	inline function get_resolved():Bool return untyped this["resolved"];
	inline function set_resolved(value:Bool):Bool return untyped this["resolved"] = value;
}
