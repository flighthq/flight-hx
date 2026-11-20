package flight._cpp._fn;

extern class Capture {
	@:native("flight_create_capture_baseline")
	public static function createCaptureBaseline():flight._cpp.CaptureBaseline;
	@:native("flight_format_capture_baseline")
	public static function formatCaptureBaseline(baseline:flight._cpp.CaptureBaseline):cpp.ConstCharStar;
	@:native("flight_get_capture_baseline_field")
	public static function getCaptureBaselineField(baseline:flight._cpp.CaptureBaseline, column:cpp.ConstCharStar, field:Int):cpp.ConstCharStar;
	@:native("flight_get_capture_baseline_provenance")
	public static function getCaptureBaselineProvenance(baseline:flight._cpp.CaptureBaseline, column:cpp.ConstCharStar, field:Int):flight._cpp.CaptureBaselineProvenance;
	@:native("flight_parse_capture_baseline")
	public static function parseCaptureBaseline(text:cpp.ConstCharStar):flight._cpp.CaptureBaseline;
	@:native("flight_set_capture_baseline_field")
	public static function setCaptureBaselineField(baseline:flight._cpp.CaptureBaseline, column:cpp.ConstCharStar, field:Int, value:cpp.ConstCharStar):Void;
	@:native("flight_set_capture_baseline_provenance")
	public static function setCaptureBaselineProvenance(baseline:flight._cpp.CaptureBaseline, column:cpp.ConstCharStar, field:Int, provenance:flight._cpp.CaptureBaselineProvenance):Void;
	@:native("flight_compare_capture_fingerprints")
	public static function compareCaptureFingerprints(a:cpp.ConstCharStar, b:cpp.ConstCharStar):Float;
	@:native("flight_evaluate_capture_parity")
	public static function evaluateCaptureParity(a:cpp.ConstCharStar, b:cpp.ConstCharStar, tolerance:Float):flight._cpp.CaptureCheckResult;
	@:native("flight_evaluate_capture_regression")
	public static function evaluateCaptureRegression(fingerprint:cpp.ConstCharStar, baselineFingerprint:cpp.ConstCharStar, tolerance:Float):flight._cpp.CaptureCheckResult;
	@:native("flight_free_capture_baseline")
	public static function freeCaptureBaseline(ptr:flight._cpp.CaptureBaseline):Void;
	@:native("flight_free_capture_baseline_provenance")
	public static function freeCaptureBaselineProvenance(ptr:flight._cpp.CaptureBaselineProvenance):Void;
	@:native("flight_free_capture_check_result")
	public static function freeCaptureCheckResult(ptr:flight._cpp.CaptureCheckResult):Void;
}
