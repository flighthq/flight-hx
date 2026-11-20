package flight._js;

abstract CffIndex(Dynamic) {
	public var endOffset(get, set):Int;
	inline function get_endOffset():Int return untyped this.endOffset;
	inline function set_endOffset(value:Int):Int return untyped this.endOffset = value;
}
