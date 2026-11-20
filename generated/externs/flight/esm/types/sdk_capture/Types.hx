package flight.esm.types.sdk_capture;

#if (js && flight_esm)
typedef CaptureBaseline = flight.esm.types.capture.Types.CaptureBaseline;

typedef CaptureBaselineField = flight.esm.types.capture.Types.CaptureBaselineField;

typedef CaptureBaselineProvenance = flight.esm.types.capture.Types.CaptureBaselineProvenance;

typedef CaptureBaselineProvenanceField = flight.esm.types.capture.Types.CaptureBaselineProvenanceField;

typedef CaptureCheckResult = flight.esm.types.capture.Types.CaptureCheckResult;

typedef CaptureCheckTier = flight.esm.types.capture.Types.CaptureCheckTier;

typedef CaptureColumnBaseline = flight.esm.types.capture.Types.CaptureColumnBaseline;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
