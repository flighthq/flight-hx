package flight._js;

abstract FileSystemUsage(Dynamic) {
	public var usedBytes(get, set):Int;
	inline function get_usedBytes():Int return untyped this.usedBytes;
	inline function set_usedBytes(value:Int):Int return untyped this.usedBytes = value;
	public var quotaBytes(get, set):Int;
	inline function get_quotaBytes():Int return untyped this.quotaBytes;
	inline function set_quotaBytes(value:Int):Int return untyped this.quotaBytes = value;
}
