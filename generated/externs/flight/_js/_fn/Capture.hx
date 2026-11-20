package flight._js._fn;

@:jsRequire("@flighthq/capture")
extern class Capture {
	@:native("createCaptureBaseline")
	public static function createCaptureBaseline():flight._js.CaptureBaseline;
	@:native("formatCaptureBaseline")
	public static function formatCaptureBaseline(baseline:flight._js.CaptureBaseline):String;
	@:native("getCaptureBaselineField")
	public static function getCaptureBaselineField(baseline:flight._js.CaptureBaseline, column:String, field:Dynamic):Null<String>;
	@:native("getCaptureBaselineProvenance")
	public static function getCaptureBaselineProvenance(baseline:flight._js.CaptureBaseline, column:String, field:Dynamic):Null<flight._js.CaptureBaselineProvenance>;
	@:native("parseCaptureBaseline")
	public static function parseCaptureBaseline(text:String):Null<flight._js.CaptureBaseline>;
	@:native("setCaptureBaselineField")
	public static function setCaptureBaselineField(baseline:flight._js.CaptureBaseline, column:String, field:Dynamic, value:String):Void;
	@:native("setCaptureBaselineProvenance")
	public static function setCaptureBaselineProvenance(baseline:flight._js.CaptureBaseline, column:String, field:Dynamic, provenance:flight._js.CaptureBaselineProvenance):Void;
	@:native("compareCaptureFingerprints")
	public static function compareCaptureFingerprints(a:String, b:String):Float;
	@:native("evaluateCaptureParity")
	public static function evaluateCaptureParity(a:String, b:String, tolerance:Null<Float>):flight._js.CaptureCheckResult;
	@:native("evaluateCaptureRegression")
	public static function evaluateCaptureRegression(fingerprint:String, baselineFingerprint:String, tolerance:Null<Float>):flight._js.CaptureCheckResult;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCaptureBaseline(ptr:flight._js.CaptureBaseline):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCaptureBaselineProvenance(ptr:flight._js.CaptureBaselineProvenance):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCaptureCheckResult(ptr:flight._js.CaptureCheckResult):Void {}
}
