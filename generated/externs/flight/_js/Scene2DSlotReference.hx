package flight._js;

abstract Scene2DSlotReference(Dynamic) {
	public var required(get, set):Bool;
	inline function get_required():Bool return untyped this.required;
	inline function set_required(value:Bool):Bool return untyped this.required = value;
}
