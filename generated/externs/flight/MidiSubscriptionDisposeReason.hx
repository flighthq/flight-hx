package flight;

abstract MidiSubscriptionDisposeReason(Int) from Int to Int {
	public static inline var AlreadyDisposed:MidiSubscriptionDisposeReason = 0;
	public static inline var Ok:MidiSubscriptionDisposeReason = 1;
	public static inline var OperationFailed:MidiSubscriptionDisposeReason = 2;
}
