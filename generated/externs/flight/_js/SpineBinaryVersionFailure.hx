package flight._js;

abstract SpineBinaryVersionFailure(Dynamic) {
	public var bytes(get, set):Int;
	inline function get_bytes():Int return untyped this.bytes;
	inline function set_bytes(value:Int):Int return untyped this.bytes = value;
}
