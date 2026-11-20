package flight;

abstract MidiAccessPortsReason(Int) from Int to Int {
	public static inline var Disposed:MidiAccessPortsReason = 0;
	public static inline var Ok:MidiAccessPortsReason = 1;
	public static inline var OperationFailed:MidiAccessPortsReason = 2;
}
