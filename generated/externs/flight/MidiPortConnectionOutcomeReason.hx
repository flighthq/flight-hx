package flight;

abstract MidiPortConnectionOutcomeReason(Int) from Int to Int {
	public static inline var Disposed:MidiPortConnectionOutcomeReason = 0;
	public static inline var Ok:MidiPortConnectionOutcomeReason = 1;
	public static inline var OperationFailed:MidiPortConnectionOutcomeReason = 2;
}
