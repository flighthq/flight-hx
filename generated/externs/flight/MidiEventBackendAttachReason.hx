package flight;

abstract MidiEventBackendAttachReason(Int) from Int to Int {
	public static inline var Ok:MidiEventBackendAttachReason = 0;
	public static inline var OperationFailed:MidiEventBackendAttachReason = 1;
}
