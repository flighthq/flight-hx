package flight._hl;

abstract TimelineSource(hl.Bytes) {
	public var totalFrames(get, set):Int;

	inline function get_totalFrames():Int return this.getI32(16);

	inline function set_totalFrames(value:Int):Int { this.setI32(16, value); return value; }
}
