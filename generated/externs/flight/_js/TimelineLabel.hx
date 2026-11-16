package flight._js;

abstract TimelineLabel(Dynamic) {
	public var frame(get, set):Int;
	inline function get_frame():Int return untyped this.frame;
	inline function set_frame(value:Int):Int return untyped this.frame = value;
}
