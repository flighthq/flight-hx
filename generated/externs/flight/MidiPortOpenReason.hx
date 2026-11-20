package flight;

abstract MidiPortOpenReason(Int) from Int to Int {
	public static inline var AlreadyOpen:MidiPortOpenReason = 0;
	public static inline var Disconnected:MidiPortOpenReason = 1;
	public static inline var Disposed:MidiPortOpenReason = 2;
	public static inline var Opened:MidiPortOpenReason = 3;
	public static inline var OperationFailed:MidiPortOpenReason = 4;
}
