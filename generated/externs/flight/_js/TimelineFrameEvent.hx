package flight._js;

abstract TimelineFrameEvent(Dynamic) {
	public var frame(get, set):Int;
	inline function get_frame():Int return untyped this.frame;
	inline function set_frame(value:Int):Int return untyped this.frame = value;
	public var previousFrame(get, set):Int;
	inline function get_previousFrame():Int return untyped this.previousFrame;
	inline function set_previousFrame(value:Int):Int return untyped this.previousFrame = value;
}
