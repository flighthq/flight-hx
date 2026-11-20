package flight.esm.types.capture;

#if (js && flight_esm)
typedef CaptureBaseline = Dynamic;

typedef CaptureBaselineField = String;

typedef CaptureBaselineProvenance = { computationId:Null<String>, frames:Float, sourceHash:Null<String>, targetKind:Null<String>, verifyPublished:Bool, warmupFrames:Float };

typedef CaptureBaselineProvenanceField = String;

typedef CaptureCheckResult = { pass:Bool, difference:Float, tolerance:Float };

typedef CaptureCheckTier = String;

typedef CaptureColumnBaseline = { ?fingerprint:Null<String>, ?sourceHash:Null<String>, ?sha256:Null<String>, ?fingerprintProvenance:Null<flight.esm.types.capture.Types.CaptureBaselineProvenance>, ?sha256Provenance:Null<flight.esm.types.capture.Types.CaptureBaselineProvenance> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
