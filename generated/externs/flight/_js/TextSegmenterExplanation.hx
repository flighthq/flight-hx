package flight._js;

abstract TextSegmenterExplanation(Dynamic) {
	public var available(get, set):Bool;
	inline function get_available():Bool return untyped this.available;
	inline function set_available(value:Bool):Bool return untyped this.available = value;
	public var intlSegmenterAvailable(get, set):Bool;
	inline function get_intlSegmenterAvailable():Bool return untyped this.intlSegmenterAvailable;
	inline function set_intlSegmenterAvailable(value:Bool):Bool return untyped this.intlSegmenterAvailable = value;
}
