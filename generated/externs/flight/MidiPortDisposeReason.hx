package flight;

abstract MidiPortDisposeReason(Int) from Int to Int {
	public static inline var AlreadyDisposed:MidiPortDisposeReason = 0;
	public static inline var Ok:MidiPortDisposeReason = 1;
	public static inline var OperationFailed:MidiPortDisposeReason = 2;
}
