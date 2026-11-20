package flight;

abstract MidiPortStateOutcomeReason(Int) from Int to Int {
	public static inline var Disposed:MidiPortStateOutcomeReason = 0;
	public static inline var Ok:MidiPortStateOutcomeReason = 1;
	public static inline var OperationFailed:MidiPortStateOutcomeReason = 2;
}
