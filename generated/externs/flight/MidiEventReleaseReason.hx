package flight;

abstract MidiEventReleaseReason(Int) from Int to Int {
	public static inline var Ok:MidiEventReleaseReason = 0;
	public static inline var OperationFailed:MidiEventReleaseReason = 1;
}
