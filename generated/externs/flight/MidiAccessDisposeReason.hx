package flight;

abstract MidiAccessDisposeReason(Int) from Int to Int {
	public static inline var AlreadyDisposed:MidiAccessDisposeReason = 0;
	public static inline var Ok:MidiAccessDisposeReason = 1;
	public static inline var OperationFailed:MidiAccessDisposeReason = 2;
}
