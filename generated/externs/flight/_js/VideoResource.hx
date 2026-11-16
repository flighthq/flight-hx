package flight._js;

abstract VideoResource(Dynamic) {
	public var ownsElement(get, set):Bool;
	inline function get_ownsElement():Bool return untyped this.ownsElement;
	inline function set_ownsElement(value:Bool):Bool return untyped this.ownsElement = value;
}
