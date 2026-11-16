package flight._js;

abstract InputTextData(Dynamic) {
	public var isComposing(get, set):Bool;
	inline function get_isComposing():Bool return untyped this.isComposing;
	inline function set_isComposing(value:Bool):Bool return untyped this.isComposing = value;
}
