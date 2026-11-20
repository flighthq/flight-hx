package flight;

abstract GlobalShortcutDetachReason(Int) from Int to Int {
	public static inline var Detached:GlobalShortcutDetachReason = 0;
	public static inline var NotAttached:GlobalShortcutDetachReason = 1;
	public static inline var TriggerProviderFailed:GlobalShortcutDetachReason = 2;
}
