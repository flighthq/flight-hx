package flight._hl._fn;

extern class Capture {
	@:hlNative("flight", "flight_create_capture_baseline")
	public static function createCaptureBaseline():flight._hl.CaptureBaseline;
	@:hlNative("flight", "flight_format_capture_baseline")
	public static function formatCaptureBaseline(baseline:flight._hl.CaptureBaseline):hl.Bytes;
	@:hlNative("flight", "flight_get_capture_baseline_field")
	public static function getCaptureBaselineField(baseline:flight._hl.CaptureBaseline, column:hl.Bytes, field:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_capture_baseline_provenance")
	public static function getCaptureBaselineProvenance(baseline:flight._hl.CaptureBaseline, column:hl.Bytes, field:Int):flight._hl.CaptureBaselineProvenance;
	@:hlNative("flight", "flight_parse_capture_baseline")
	public static function parseCaptureBaseline(text:hl.Bytes):flight._hl.CaptureBaseline;
	@:hlNative("flight", "flight_set_capture_baseline_field")
	public static function setCaptureBaselineField(baseline:flight._hl.CaptureBaseline, column:hl.Bytes, field:Int, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_capture_baseline_provenance")
	public static function setCaptureBaselineProvenance(baseline:flight._hl.CaptureBaseline, column:hl.Bytes, field:Int, provenance:flight._hl.CaptureBaselineProvenance):Void;
	@:hlNative("flight", "flight_compare_capture_fingerprints")
	public static function compareCaptureFingerprints(a:hl.Bytes, b:hl.Bytes):Float;
	@:hlNative("flight", "flight_evaluate_capture_parity")
	public static function evaluateCaptureParity(a:hl.Bytes, b:hl.Bytes, tolerance:Float):flight._hl.CaptureCheckResult;
	@:hlNative("flight", "flight_evaluate_capture_regression")
	public static function evaluateCaptureRegression(fingerprint:hl.Bytes, baselineFingerprint:hl.Bytes, tolerance:Float):flight._hl.CaptureCheckResult;
	@:hlNative("flight", "flight_free_capture_baseline")
	public static function freeCaptureBaseline(ptr:flight._hl.CaptureBaseline):Void;
	@:hlNative("flight", "flight_free_capture_baseline_provenance")
	public static function freeCaptureBaselineProvenance(ptr:flight._hl.CaptureBaselineProvenance):Void;
	@:hlNative("flight", "flight_free_capture_check_result")
	public static function freeCaptureCheckResult(ptr:flight._hl.CaptureCheckResult):Void;
}
