package flight._js;

abstract CocosPlistMetadata(Dynamic) {
	public var format(get, set):Int;
	inline function get_format():Int return untyped this.format;
	inline function set_format(value:Int):Int return untyped this.format = value;
}
