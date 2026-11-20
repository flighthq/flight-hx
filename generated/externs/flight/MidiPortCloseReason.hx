package flight;

abstract MidiPortCloseReason(Int) from Int to Int {
	public static inline var AlreadyClosed:MidiPortCloseReason = 0;
	public static inline var Closed:MidiPortCloseReason = 1;
	public static inline var Disposed:MidiPortCloseReason = 2;
	public static inline var OperationFailed:MidiPortCloseReason = 3;
}
