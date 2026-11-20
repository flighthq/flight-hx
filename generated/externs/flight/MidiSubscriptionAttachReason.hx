package flight;

abstract MidiSubscriptionAttachReason(Int) from Int to Int {
	public static inline var Ok:MidiSubscriptionAttachReason = 0;
	public static inline var OperationFailed:MidiSubscriptionAttachReason = 1;
}
