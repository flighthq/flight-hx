package flight.esm.capture;

#if (js && flight_esm)
@:jsRequire("@flighthq/capture/contract")
extern class Contract {
  public static final CAPTURE_PARITY_TOLERANCE:Float;
  public static final CAPTURE_REGRESSION_TOLERANCE:Float;
  public static function compareCaptureFingerprints(a:String, b:String):Float;
  public static function createCaptureBaseline():flight.esm.types.capture.Types.CaptureBaseline;
  public static function evaluateCaptureParity(a:String, b:String, ?tolerance:Null<Float>):flight.esm.types.capture.Types.CaptureCheckResult;
  public static function evaluateCaptureRegression(fingerprint:String, baselineFingerprint:String, ?tolerance:Null<Float>):flight.esm.types.capture.Types.CaptureCheckResult;
  public static function formatCaptureBaseline(baseline:flight.esm.types.capture.Types.CaptureBaseline):String;
  public static function getCaptureBaselineField(baseline:flight.esm.types.capture.Types.CaptureBaseline, column:String, field:flight.esm.types.capture.Types.CaptureBaselineField):Null<String>;
  public static function getCaptureBaselineProvenance(baseline:flight.esm.types.capture.Types.CaptureBaseline, column:String, field:flight.esm.types.capture.Types.CaptureBaselineProvenanceField):Null<flight.esm.types.capture.Types.CaptureBaselineProvenance>;
  public static function parseCaptureBaseline(text:String):Null<flight.esm.types.capture.Types.CaptureBaseline>;
  public static function setCaptureBaselineField(baseline:flight.esm.types.capture.Types.CaptureBaseline, column:String, field:flight.esm.types.capture.Types.CaptureBaselineField, value:String):Void;
  public static function setCaptureBaselineProvenance(baseline:flight.esm.types.capture.Types.CaptureBaseline, column:String, field:flight.esm.types.capture.Types.CaptureBaselineProvenanceField, provenance:flight.esm.types.capture.Types.CaptureBaselineProvenance):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
