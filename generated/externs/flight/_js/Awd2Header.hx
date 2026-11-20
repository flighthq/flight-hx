package flight._js;

abstract Awd2Header(Dynamic) {
	public var bodyLength(get, set):Int;
	inline function get_bodyLength():Int return untyped this.bodyLength;
	inline function set_bodyLength(value:Int):Int return untyped this.bodyLength = value;
	public var compression(get, set):Int;
	inline function get_compression():Int return untyped this.compression;
	inline function set_compression(value:Int):Int return untyped this.compression = value;
	public var flags(get, set):Int;
	inline function get_flags():Int return untyped this.flags;
	inline function set_flags(value:Int):Int return untyped this.flags = value;
	public var versionMajor(get, set):Int;
	inline function get_versionMajor():Int return untyped this.versionMajor;
	inline function set_versionMajor(value:Int):Int return untyped this.versionMajor = value;
	public var versionMinor(get, set):Int;
	inline function get_versionMinor():Int return untyped this.versionMinor;
	inline function set_versionMinor(value:Int):Int return untyped this.versionMinor = value;
}
