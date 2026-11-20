package flight._js;

abstract BackendExplanation(Dynamic) {
	public var conflict(get, set):Bool;
	inline function get_conflict():Bool return untyped this.conflict;
	inline function set_conflict(value:Bool):Bool return untyped this.conflict = value;
}
