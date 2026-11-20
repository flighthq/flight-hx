package flight;

#if (js && flight_esm)
extern inline function createCaptureBaseline():CaptureBaseline {
	return flight._js._fn.Capture.createCaptureBaseline();
}
#else
extern inline function createCaptureBaseline():CaptureBaseline {
#if hl
	return flight._hl._fn.Capture.createCaptureBaseline();
#elseif cpp
	return flight._cpp._fn.Capture.createCaptureBaseline();
#elseif (js && flight_esm)
	return flight._js._fn.Capture.createCaptureBaseline();
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function formatCaptureBaseline(baseline:CaptureBaseline):String {
	return flight._js._fn.Capture.formatCaptureBaseline(baseline);
}
#else
extern inline function formatCaptureBaseline(baseline:CaptureBaseline):String {
#if hl
	return cast flight._hl._fn.Capture.formatCaptureBaseline(baseline);
#elseif cpp
	return cast flight._cpp._fn.Capture.formatCaptureBaseline(baseline);
#elseif (js && flight_esm)
	return cast flight._js._fn.Capture.formatCaptureBaseline(baseline);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCaptureBaselineField(baseline:CaptureBaseline, column:String, field:Dynamic):Null<String> {
	return flight._js._fn.Capture.getCaptureBaselineField(baseline, column, field);
}
#else
extern inline function getCaptureBaselineField(baseline:CaptureBaseline, column:String, field:flight.CaptureBaselineField):String {
#if hl
	return cast flight._hl._fn.Capture.getCaptureBaselineField(baseline, cast column, field);
#elseif cpp
	return cast flight._cpp._fn.Capture.getCaptureBaselineField(baseline, cast column, field);
#elseif (js && flight_esm)
	return cast flight._js._fn.Capture.getCaptureBaselineField(baseline, column, field);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCaptureBaselineProvenance(baseline:CaptureBaseline, column:String, field:Dynamic):Null<CaptureBaselineProvenance> {
	return flight._js._fn.Capture.getCaptureBaselineProvenance(baseline, column, field);
}
#else
extern inline function getCaptureBaselineProvenance(baseline:CaptureBaseline, column:String, field:flight.CaptureBaselineProvenanceField):CaptureBaselineProvenance {
#if hl
	return flight._hl._fn.Capture.getCaptureBaselineProvenance(baseline, cast column, field);
#elseif cpp
	return flight._cpp._fn.Capture.getCaptureBaselineProvenance(baseline, cast column, field);
#elseif (js && flight_esm)
	return flight._js._fn.Capture.getCaptureBaselineProvenance(baseline, column, field);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseCaptureBaseline(text:String):Null<CaptureBaseline> {
	return flight._js._fn.Capture.parseCaptureBaseline(text);
}
#else
extern inline function parseCaptureBaseline(text:String):CaptureBaseline {
#if hl
	return flight._hl._fn.Capture.parseCaptureBaseline(cast text);
#elseif cpp
	return flight._cpp._fn.Capture.parseCaptureBaseline(cast text);
#elseif (js && flight_esm)
	return flight._js._fn.Capture.parseCaptureBaseline(text);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setCaptureBaselineField(baseline:CaptureBaseline, column:String, field:Dynamic, value:String):Void {
	flight._js._fn.Capture.setCaptureBaselineField(baseline, column, field, value);
}
#else
extern inline function setCaptureBaselineField(baseline:CaptureBaseline, column:String, field:flight.CaptureBaselineField, value:String):Void {
#if hl
	flight._hl._fn.Capture.setCaptureBaselineField(baseline, cast column, field, cast value);
#elseif cpp
	flight._cpp._fn.Capture.setCaptureBaselineField(baseline, cast column, field, cast value);
#elseif (js && flight_esm)
	flight._js._fn.Capture.setCaptureBaselineField(baseline, column, field, value);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setCaptureBaselineProvenance(baseline:CaptureBaseline, column:String, field:Dynamic, provenance:CaptureBaselineProvenance):Void {
	flight._js._fn.Capture.setCaptureBaselineProvenance(baseline, column, field, provenance);
}
#else
extern inline function setCaptureBaselineProvenance(baseline:CaptureBaseline, column:String, field:flight.CaptureBaselineProvenanceField, provenance:CaptureBaselineProvenance):Void {
#if hl
	flight._hl._fn.Capture.setCaptureBaselineProvenance(baseline, cast column, field, provenance);
#elseif cpp
	flight._cpp._fn.Capture.setCaptureBaselineProvenance(baseline, cast column, field, provenance);
#elseif (js && flight_esm)
	flight._js._fn.Capture.setCaptureBaselineProvenance(baseline, column, field, provenance);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compareCaptureFingerprints(a:String, b:String):Float {
	return flight._js._fn.Capture.compareCaptureFingerprints(a, b);
}
#else
extern inline function compareCaptureFingerprints(a:String, b:String):Float {
#if hl
	return flight._hl._fn.Capture.compareCaptureFingerprints(cast a, cast b);
#elseif cpp
	return flight._cpp._fn.Capture.compareCaptureFingerprints(cast a, cast b);
#elseif (js && flight_esm)
	return flight._js._fn.Capture.compareCaptureFingerprints(a, b);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function evaluateCaptureParity(a:String, b:String, tolerance:Null<Float>):CaptureCheckResult {
	return flight._js._fn.Capture.evaluateCaptureParity(a, b, tolerance);
}
#else
extern inline function evaluateCaptureParity(a:String, b:String, tolerance:Float):CaptureCheckResult {
#if hl
	return flight._hl._fn.Capture.evaluateCaptureParity(cast a, cast b, tolerance);
#elseif cpp
	return flight._cpp._fn.Capture.evaluateCaptureParity(cast a, cast b, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Capture.evaluateCaptureParity(a, b, tolerance);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function evaluateCaptureRegression(fingerprint:String, baselineFingerprint:String, tolerance:Null<Float>):CaptureCheckResult {
	return flight._js._fn.Capture.evaluateCaptureRegression(fingerprint, baselineFingerprint, tolerance);
}
#else
extern inline function evaluateCaptureRegression(fingerprint:String, baselineFingerprint:String, tolerance:Float):CaptureCheckResult {
#if hl
	return flight._hl._fn.Capture.evaluateCaptureRegression(cast fingerprint, cast baselineFingerprint, tolerance);
#elseif cpp
	return flight._cpp._fn.Capture.evaluateCaptureRegression(cast fingerprint, cast baselineFingerprint, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Capture.evaluateCaptureRegression(fingerprint, baselineFingerprint, tolerance);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCaptureBaseline(ptr:CaptureBaseline):Void {
	flight._js._fn.Capture.freeCaptureBaseline(ptr);
}
#else
extern inline function freeCaptureBaseline(ptr:CaptureBaseline):Void {
#if hl
	flight._hl._fn.Capture.freeCaptureBaseline(ptr);
#elseif cpp
	flight._cpp._fn.Capture.freeCaptureBaseline(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Capture.freeCaptureBaseline(ptr);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCaptureBaselineProvenance(ptr:CaptureBaselineProvenance):Void {
	flight._js._fn.Capture.freeCaptureBaselineProvenance(ptr);
}
#else
extern inline function freeCaptureBaselineProvenance(ptr:CaptureBaselineProvenance):Void {
#if hl
	flight._hl._fn.Capture.freeCaptureBaselineProvenance(ptr);
#elseif cpp
	flight._cpp._fn.Capture.freeCaptureBaselineProvenance(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Capture.freeCaptureBaselineProvenance(ptr);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCaptureCheckResult(ptr:CaptureCheckResult):Void {
	flight._js._fn.Capture.freeCaptureCheckResult(ptr);
}
#else
extern inline function freeCaptureCheckResult(ptr:CaptureCheckResult):Void {
#if hl
	flight._hl._fn.Capture.freeCaptureCheckResult(ptr);
#elseif cpp
	flight._cpp._fn.Capture.freeCaptureCheckResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Capture.freeCaptureCheckResult(ptr);
#else
	#error "flight.Capture: no backend for this target."
#end
}
#end
