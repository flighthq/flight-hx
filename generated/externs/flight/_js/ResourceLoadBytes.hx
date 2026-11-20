package flight._js;

abstract ResourceLoadBytes(Dynamic) {
	public var bytesLoaded(get, set):Float;
	inline function get_bytesLoaded():Float return untyped this.bytesLoaded;
	inline function set_bytesLoaded(value:Float):Float return untyped this.bytesLoaded = value;
	public var bytesTotalKnown(get, set):Float;
	inline function get_bytesTotalKnown():Float return untyped this.bytesTotalKnown;
	inline function set_bytesTotalKnown(value:Float):Float return untyped this.bytesTotalKnown = value;
	public var itemsWithKnownBytes(get, set):Int;
	inline function get_itemsWithKnownBytes():Int return untyped this.itemsWithKnownBytes;
	inline function set_itemsWithKnownBytes(value:Int):Int return untyped this.itemsWithKnownBytes = value;
}
