package flight._js;

abstract ShareResult(Dynamic) {
	public var completed(get, set):Bool;
	inline function get_completed():Bool return untyped this.completed;
	inline function set_completed(value:Bool):Bool return untyped this.completed = value;
	public var dismissed(get, set):Bool;
	inline function get_dismissed():Bool return untyped this.dismissed;
	inline function set_dismissed(value:Bool):Bool return untyped this.dismissed = value;
}
