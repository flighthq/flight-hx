package flight._js;

abstract TimelineSource(Dynamic) {
	public var totalFrames(get, set):Int;
	inline function get_totalFrames():Int return untyped this.totalFrames;
	inline function set_totalFrames(value:Int):Int return untyped this.totalFrames = value;
}
