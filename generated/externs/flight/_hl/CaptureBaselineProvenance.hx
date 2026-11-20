package flight._hl;

abstract CaptureBaselineProvenance(hl.Bytes) {
	public var frames(get, set):Int;

	inline function get_frames():Int return this.getI32(72);

	inline function set_frames(value:Int):Int { this.setI32(72, value); return value; }
	public var verifyPublished(get, set):Bool;

	inline function get_verifyPublished():Bool return this.getUI8(80) != 0;

	inline function set_verifyPublished(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
	public var warmupFrames(get, set):Int;

	inline function get_warmupFrames():Int return this.getI32(76);

	inline function set_warmupFrames(value:Int):Int { this.setI32(76, value); return value; }
}
