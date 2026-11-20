package flight._js;

abstract CaptureBaselineProvenance(Dynamic) {
	public var frames(get, set):Int;
	inline function get_frames():Int return untyped this.frames;
	inline function set_frames(value:Int):Int return untyped this.frames = value;
	public var verifyPublished(get, set):Bool;
	inline function get_verifyPublished():Bool return untyped this.verifyPublished;
	inline function set_verifyPublished(value:Bool):Bool return untyped this.verifyPublished = value;
	public var warmupFrames(get, set):Int;
	inline function get_warmupFrames():Int return untyped this.warmupFrames;
	inline function set_warmupFrames(value:Int):Int return untyped this.warmupFrames = value;
}
