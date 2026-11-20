package flight._cpp;

private extern class CaptureBaselineProvenance_Ffi {
	@:native("flight_get_capture_baseline_provenance_frames") static function get_frames(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_capture_baseline_provenance_frames") static function set_frames(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_capture_baseline_provenance_verify_published") static function get_verifyPublished(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_capture_baseline_provenance_verify_published") static function set_verifyPublished(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_capture_baseline_provenance_warmup_frames") static function get_warmupFrames(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_capture_baseline_provenance_warmup_frames") static function set_warmupFrames(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract CaptureBaselineProvenance(cpp.Star<cpp.Void>) {
	public var frames(get, set):Int;

	inline function get_frames():Int return CaptureBaselineProvenance_Ffi.get_frames(this);

	inline function set_frames(value:Int):Int { CaptureBaselineProvenance_Ffi.set_frames(this, value); return value; }
	public var verifyPublished(get, set):Bool;

	inline function get_verifyPublished():Bool return CaptureBaselineProvenance_Ffi.get_verifyPublished(this);

	inline function set_verifyPublished(value:Bool):Bool { CaptureBaselineProvenance_Ffi.set_verifyPublished(this, value); return value; }
	public var warmupFrames(get, set):Int;

	inline function get_warmupFrames():Int return CaptureBaselineProvenance_Ffi.get_warmupFrames(this);

	inline function set_warmupFrames(value:Int):Int { CaptureBaselineProvenance_Ffi.set_warmupFrames(this, value); return value; }
}
