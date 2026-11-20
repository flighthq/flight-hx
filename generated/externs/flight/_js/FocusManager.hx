package flight._js;

abstract FocusManager(Dynamic) {
	public var wrap(get, set):Bool;
	inline function get_wrap():Bool return untyped this.wrap;
	inline function set_wrap(value:Bool):Bool return untyped this.wrap = value;
}
