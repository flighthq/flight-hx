package flight;

abstract CaptureBaselineProvenanceField(Int) from Int to Int {
	public static inline var Fingerprint:CaptureBaselineProvenanceField = 0;
	public static inline var Sha256:CaptureBaselineProvenanceField = 1;
}
