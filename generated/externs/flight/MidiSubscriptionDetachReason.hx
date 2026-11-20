package flight;

abstract MidiSubscriptionDetachReason(Int) from Int to Int {
	public static inline var NotAttached:MidiSubscriptionDetachReason = 0;
	public static inline var Ok:MidiSubscriptionDetachReason = 1;
	public static inline var OperationFailed:MidiSubscriptionDetachReason = 2;
}
