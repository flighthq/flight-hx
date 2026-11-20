package flight._js;

abstract AssetEntry(Dynamic) {
	public var refcount(get, set):Int;
	inline function get_refcount():Int return untyped this.refcount;
	inline function set_refcount(value:Int):Int return untyped this.refcount = value;
	public var resident(get, set):Bool;
	inline function get_resident():Bool return untyped this.resident;
	inline function set_resident(value:Bool):Bool return untyped this.resident = value;
}
