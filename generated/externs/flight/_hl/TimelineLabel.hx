package flight._hl;

abstract TimelineLabel(hl.Bytes) {
	public var frame(get, set):Int;

	inline function get_frame():Int return this.getI32(0);

	inline function set_frame(value:Int):Int { this.setI32(0, value); return value; }
}
