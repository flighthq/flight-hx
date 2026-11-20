package flight._js;

abstract DeviceCapabilities(Dynamic) {
	public var hasKeyboard(get, set):Bool;
	inline function get_hasKeyboard():Bool return untyped this.hasKeyboard;
	inline function set_hasKeyboard(value:Bool):Bool return untyped this.hasKeyboard = value;
	public var hasMouse(get, set):Bool;
	inline function get_hasMouse():Bool return untyped this.hasMouse;
	inline function set_hasMouse(value:Bool):Bool return untyped this.hasMouse = value;
	public var hasStylus(get, set):Bool;
	inline function get_hasStylus():Bool return untyped this.hasStylus;
	inline function set_hasStylus(value:Bool):Bool return untyped this.hasStylus = value;
}
