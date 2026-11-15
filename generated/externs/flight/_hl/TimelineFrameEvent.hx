package flight._hl;

abstract TimelineFrameEvent(hl.Bytes) {
	public var frame(get, set):Int;

	inline function get_frame():Int return this.getI32(0);

	inline function set_frame(value:Int):Int { this.setI32(0, value); return value; }
	public var previousFrame(get, set):Int;

	inline function get_previousFrame():Int return this.getI32(4);

	inline function set_previousFrame(value:Int):Int { this.setI32(4, value); return value; }
}
