package flight;

abstract CaptureBaselineField(Int) from Int to Int {
	public static inline var Fingerprint:CaptureBaselineField = 0;
	public static inline var Sha256:CaptureBaselineField = 1;
}
