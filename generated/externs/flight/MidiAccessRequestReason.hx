package flight;

abstract MidiAccessRequestReason(Int) from Int to Int {
	public static inline var Accepted:MidiAccessRequestReason = 0;
	public static inline var OperationFailed:MidiAccessRequestReason = 1;
	public static inline var PermissionDenied:MidiAccessRequestReason = 2;
	public static inline var SecurityRestricted:MidiAccessRequestReason = 3;
	public static inline var Unsupported:MidiAccessRequestReason = 4;
}
