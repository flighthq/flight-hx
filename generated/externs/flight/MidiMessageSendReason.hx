package flight;

abstract MidiMessageSendReason(Int) from Int to Int {
	public static inline var Disconnected:MidiMessageSendReason = 0;
	public static inline var Disposed:MidiMessageSendReason = 1;
	public static inline var InvalidMessage:MidiMessageSendReason = 2;
	public static inline var NotOpen:MidiMessageSendReason = 3;
	public static inline var OperationFailed:MidiMessageSendReason = 4;
	public static inline var Sent:MidiMessageSendReason = 5;
	public static inline var SystemExclusiveNotEnabled:MidiMessageSendReason = 6;
}
