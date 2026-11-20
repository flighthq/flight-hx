package flight._js;

abstract UnitySizeOverLifetime(Dynamic) {
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this.enabled;
	inline function set_enabled(value:Bool):Bool return untyped this.enabled = value;
	public var sizeEnd(get, set):Float;
	inline function get_sizeEnd():Float return untyped this.sizeEnd;
	inline function set_sizeEnd(value:Float):Float return untyped this.sizeEnd = value;
	public var sizeStart(get, set):Float;
	inline function get_sizeStart():Float return untyped this.sizeStart;
	inline function set_sizeStart(value:Float):Float return untyped this.sizeStart = value;
}
