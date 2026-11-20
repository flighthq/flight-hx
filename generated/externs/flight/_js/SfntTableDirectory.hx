package flight._js;

abstract SfntTableDirectory(Dynamic) {
	public var declaredTableCount(get, set):Int;
	inline function get_declaredTableCount():Int return untyped this.declaredTableCount;
	inline function set_declaredTableCount(value:Int):Int return untyped this.declaredTableCount = value;
	public var sfntVersion(get, set):Int;
	inline function get_sfntVersion():Int return untyped this.sfntVersion;
	inline function set_sfntVersion(value:Int):Int return untyped this.sfntVersion = value;
}
