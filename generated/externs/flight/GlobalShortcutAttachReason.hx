package flight;

abstract GlobalShortcutAttachReason(Int) from Int to Int {
	public static inline var AlreadyAttached:GlobalShortcutAttachReason = 0;
	public static inline var AlreadyRegistered:GlobalShortcutAttachReason = 1;
	public static inline var Attached:GlobalShortcutAttachReason = 2;
	public static inline var NativeRefused:GlobalShortcutAttachReason = 3;
	public static inline var RegistrationInProgress:GlobalShortcutAttachReason = 4;
	public static inline var TriggerProviderFailed:GlobalShortcutAttachReason = 5;
}
