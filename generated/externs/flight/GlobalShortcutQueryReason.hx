package flight;

abstract GlobalShortcutQueryReason(Int) from Int to Int {
	public static inline var NotRegistered:GlobalShortcutQueryReason = 0;
	public static inline var QueryProviderFailed:GlobalShortcutQueryReason = 1;
	public static inline var Registered:GlobalShortcutQueryReason = 2;
	public static inline var Unparseable:GlobalShortcutQueryReason = 3;
}
