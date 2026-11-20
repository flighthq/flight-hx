package flight;

abstract MidiPortLifecycleFailureOperation(Int) from Int to Int {
	public static inline var Close:MidiPortLifecycleFailureOperation = 0;
	public static inline var MessageSubscriptionRelease:MidiPortLifecycleFailureOperation = 1;
	public static inline var StateSubscriptionRelease:MidiPortLifecycleFailureOperation = 2;
}
