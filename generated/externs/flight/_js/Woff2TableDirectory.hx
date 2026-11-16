package flight._js;

abstract Woff2TableDirectory(Dynamic) {
	public var streamStart(get, set):Int;
	inline function get_streamStart():Int return untyped this["streamStart"];
	inline function set_streamStart(value:Int):Int return untyped this["streamStart"] = value;
	public var totalUncompressedLength(get, set):Int;
	inline function get_totalUncompressedLength():Int return untyped this["totalUncompressedLength"];
	inline function set_totalUncompressedLength(value:Int):Int return untyped this["totalUncompressedLength"] = value;
}
